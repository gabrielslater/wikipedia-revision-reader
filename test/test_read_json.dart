import 'package:test/test.dart';
import 'package:twp_payton_h_gabriel_s/read_json.dart';

void main() {
  group('ReadJson', () {
    test('File open and read successfully', () async {
      var json = await readJson('c._elegans');
      expect(json['continue'] != null, true);
    });
  });
}
