import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    Widget pageTitle = Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text(
              'Page Title',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Redirected from',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          )
        ],
      ),
    );

    Widget searchForm = Column(
      children: [
        TextFormField(controller: _controller),
        Container(
          padding: const EdgeInsets.all(8),
          child: const ElevatedButton(
              onPressed: null, child: Text('Get revisions')),
        ),
      ],
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
              pageTitle,
              searchForm,
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: 30,
                    clipBehavior: Clip.hardEdge,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildRevisionItem(
                          Theme.of(context).colorScheme, index % 2 == 0);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildRevisionItem(ColorScheme colorScheme, bool isEven) {
    return Container(
      color: (isEven ? colorScheme.surface : colorScheme.primaryContainer),
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Row(
        children: <Widget>[
          Column(
            children: const <Widget>[
              Text(
                'User',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                '(IP address)',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const Spacer(),
          const Text('Timestamp')
        ],
      ),
    );
  }
}
