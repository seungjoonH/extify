import 'package:test/test.dart';
import 'package:extify/number/range.dart';

void main() {
  group('NumRange', () {
    late NumRange range;
    late NumRange rangeExcludes;

    setUp(() {
      range = NumRange(1, 10);
      rangeExcludes = NumRange(1, 10, excludes: [
        NumRange(3.7, 6.5),
        NumRange(8.8, 9.1),
      ]);
    });

    group('start / end', () {
      test('최솟값을 반환한다', () {
        expect(range.start, 1);
        expect(rangeExcludes.start, 1);
      });

      test('최댓값을 반환한다', () {
        expect(range.end, 10);
        expect(rangeExcludes.end, 10);
      });
    });

    group('difference', () {
      test('최댓값과 최솟값의 차이를 반환한다', () {
        expect(range.difference, 9.0);
        expect(rangeExcludes.difference, 9.0);
      });
    });

    group('length', () {
      test('excludes가 없으면 difference와 같다', () {
        expect(range.length, 9.0);
      });

      test('excludes가 있으면 제외 범위를 뺀 길이를 반환한다', () {
        // 전체 9.0 - (6.5-3.7) - (9.1-8.8) = 9.0 - 2.8 - 0.3 = 5.9
        expect(rangeExcludes.length, closeTo(5.9, 0.001));
      });
    });

    group('contains', () {
      test('범위 내 값은 true를 반환한다', () {
        expect(range.contains(3.8), true);
        expect(range.contains(7.6), true);
        expect(range.contains(1), true);
        expect(range.contains(10), true);
      });

      test('범위 밖 값은 false를 반환한다', () {
        expect(range.contains(0.5), false);
        expect(range.contains(10.1), false);
      });

      test('excludes 범위 내 값은 false를 반환한다', () {
        expect(rangeExcludes.contains(3.8), false);
        expect(rangeExcludes.contains(5.0), false);
        expect(rangeExcludes.contains(9.0), false);
      });

      test('excludes 범위 밖 값은 true를 반환한다', () {
        expect(rangeExcludes.contains(7.6), true);
        expect(rangeExcludes.contains(2.0), true);
        expect(rangeExcludes.contains(9.5), true);
      });
    });

    group('subRanges', () {
      test('excludes가 없으면 자기 자신만 포함한다', () {
        final subs = range.subRanges;
        expect(subs.length, 1);
        expect(subs[0].start, 1);
        expect(subs[0].end, 10);
      });

      test('excludes가 있으면 부분범위 리스트를 반환한다', () {
        final subs = rangeExcludes.subRanges;
        expect(subs.length, 3);
        expect(subs[0].start, 1);
        expect(subs[0].end, 3.7);
        expect(subs[1].start, 6.5);
        expect(subs[1].end, 8.8);
        expect(subs[2].start, 9.1);
        expect(subs[2].end, 10);
      });
    });

    group('toString', () {
      test('올바른 문자열 표현을 반환한다', () {
        expect(range.toString(), 'NumRange(1, 10)');
      });
    });
  });

  group('IntRange', () {
    test('정수 범위를 올바르게 생성한다', () {
      final intRange = IntRange(1, 10);
      expect(intRange.start, 1);
      expect(intRange.end, 10);
      expect(intRange.difference, 9);
      expect(intRange.contains(5), true);
      expect(intRange.contains(11), false);
    });

    test('excludes를 지원한다', () {
      final intRange = IntRange(1, 10, excludes: [IntRange(3, 5)]);
      expect(intRange.contains(4), false);
      expect(intRange.contains(6), true);
    });
  });

  group('DoubleRange', () {
    test('실수 범위를 올바르게 생성한다', () {
      final doubleRange = DoubleRange(1.0, 10.0);
      expect(doubleRange.start, 1.0);
      expect(doubleRange.end, 10.0);
      expect(doubleRange.difference, 9.0);
      expect(doubleRange.contains(5.5), true);
      expect(doubleRange.contains(10.1), false);
    });

    test('excludes를 지원한다', () {
      final doubleRange = DoubleRange(0.0, 1.0, excludes: [
        DoubleRange(0.3, 0.7),
      ]);
      expect(doubleRange.contains(0.5), false);
      expect(doubleRange.contains(0.1), true);
      expect(doubleRange.contains(0.8), true);
      expect(doubleRange.length, closeTo(0.6, 0.001));
    });
  });
}
