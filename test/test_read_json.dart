import 'package:test/test.dart';
import 'package:twp_payton_h_gabriel_s/read_json.dart';

void main() {
  group('ReadJson', () {
    test('File open and read successfully', () async {
      var file = await readJson('c._elegans');
      expect(
          file.startsWith(
              '{"continue":{"rvcontinue":"20211208001101|1059189921","continue":"||"},'),
          true);
    });
  });
}
