import 'package:test/test.dart';
import 'package:extify/list/extension.dart';

void main() {
  group('ListExtension', () {
    group('addIf', () {
      test('조건이 true이면 요소를 추가한다', () {
        final list = [1, 2, 3];
        list.addIf(true, 4);
        expect(list, [1, 2, 3, 4]);
      });

      test('조건이 false이면 요소를 추가하지 않는다', () {
        final list = [1, 2, 3];
        list.addIf(false, 4);
        expect(list, [1, 2, 3]);
      });

      test('빈 리스트에서도 동작한다', () {
        final list = <int>[];
        list.addIf(true, 1);
        expect(list, [1]);
      });

      test('문자열 리스트에서도 동작한다', () {
        final list = <String>['a', 'b'];
        list.addIf(true, 'c');
        expect(list, ['a', 'b', 'c']);
      });

      test('연속 호출 시 조건에 따라 누적된다', () {
        final list = [0];
        list.addIf(true, 1);
        list.addIf(true, 2);
        list.addIf(false, 3);
        list.addIf(true, 4);
        expect(list, [0, 1, 2, 4]);
      });
    });
  });
}
