import 'dart:io';

import 'package:flutter/material.dart';
import 'package:twp_payton_h_gabriel_s/wiki_requester.dart';
import 'package:twp_payton_h_gabriel_s/wiki_revision.dart';

void main() {
  runApp(const WikipediaRevisionReader());
}

class WikipediaRevisionReader extends StatelessWidget {
  const WikipediaRevisionReader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wikipedia Revision Reader',
      theme: ThemeData(
          colorSchemeSeed: Colors.deepOrange,
          textTheme: Theme.of(context).textTheme.apply(
              fontSizeFactor: 1.25,
              displayColor: Theme.of(context).colorScheme.onBackground)),
      home: const MainPage(title: 'Wikipedia Revision Reader'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _controller = TextEditingController();
  final _wikiRequester = WikiRequester();
  final _snackBar = const SnackBar(content: Text('Fetching data...'));

  /// necessary to prevent empty space when the app opens
  bool _hasRequestedOnce = false;
  bool _isProcessing = false;
  bool _isRedirect = false;
  bool _isError = false;

  var _errorText = '';
  var _pageTitle = '';
  var _redirectText = '';
  var _revisionsList = <WikiRevision>[];

  @override
  Widget build(BuildContext context) {
    var redirect = Text(
      _redirectText,
      style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 20,
          fontStyle: FontStyle.italic),
    );

    var title = Text(
      _pageTitle,
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );

    Widget errorMessage = Container(
      child: (_isError
          ? Text(
              _errorText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 30,
              ),
            )
          : null),
    );

    Widget pageTitle = Container(
      child: (!_isError
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: (_hasRequestedOnce && !_isProcessing ? title : null),
                ),
                Container(
                  child: (_isRedirect ? redirect : null),
                )
              ],
            )
          : null),
    );

    Widget searchForm = Column(
      children: [
        TextFormField(
          controller: _controller,
          enabled: !_isProcessing,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
              onPressed: (!_isProcessing ? _createWikiResponse : null),
              child: const Text('Get revisions')),
        ),
      ],
    );

    var revisionList = Expanded(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: (_revisionsList.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: _revisionsList.length,
                clipBehavior: Clip.hardEdge,
                itemBuilder: (BuildContext context, int index) {
                  return _buildRevisionItem(
                    Theme.of(context).colorScheme,
                    index % 2 == 0,
                    _revisionsList[index],
                  );
                },
              )
            : null),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              errorMessage,
              pageTitle,
              searchForm,
              revisionList,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createWikiResponse() async {
    var query = _controller.value.text;

    if (query.isNotEmpty) {
      if (!_hasRequestedOnce) {
        _hasRequestedOnce = true;
      }

      try {
        setState(() {
          _isProcessing = true;
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
        });

        var response = await _wikiRequester.fetchPage(query);

        setState(() {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          _isProcessing = false;
          _isError = false;
          _pageTitle = response.title;
          _isRedirect = response.redirect.isNotEmpty;

          if (_isRedirect) {
            _redirectText = 'Redirected from "${response.redirect['from']}"';
          }

          _revisionsList = response.revisions;
        });
      } on SocketException {
        setState(() {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          _isProcessing = false;
          _isError = true;

          _errorText = 'Cannot reach Wikipedia. Do you have a connection?';
          _revisionsList = [];
          _isRedirect = false;
        });
      } catch (e) {
        setState(() {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          _isProcessing = false;
          _isError = true;

          _errorText = 'No page found with name "$query"';
          _revisionsList = [];
          _isRedirect = false;
        });
      }
    }
  }

  Container _buildRevisionItem(
      ColorScheme colorScheme, bool isEven, WikiRevision revision) {
    return Container(
      color: (isEven ? colorScheme.surface : colorScheme.primaryContainer),
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                revision.isAnon ? 'Anonymous' : revision.user,
                style: const TextStyle(fontSize: 25),
              ),
              Container(
                child: (revision.isAnon
                    ? Text(
                        revision.user,
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      )
                    : null),
              ),
            ],
          ),
          const Spacer(),
          Text(revision.timestamp.toString())
        ],
      ),
    );
  }
}
