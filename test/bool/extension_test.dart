import 'package:test/test.dart';
import 'package:extify/bool/extension.dart';

void main() {
  group('BoolExtension', () {
    group('toInt', () {
      test('true를 1로 변환한다', () {
        expect(true.toInt, 1);
      });

      test('false를 0으로 변환한다', () {
        expect(false.toInt, 0);
      });
    });
  });
}
