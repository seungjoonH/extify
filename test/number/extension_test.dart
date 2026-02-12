import 'package:test/test.dart';
import 'package:extify/number/extension.dart';

void main() {
  group('IntExtension', () {
    group('toBool', () {
      test('0은 false를 반환한다', () {
        expect(0.toBool, false);
      });

      test('1은 true를 반환한다', () {
        expect(1.toBool, true);
      });

      test('양수는 true를 반환한다', () {
        expect(42.toBool, true);
        expect(100.toBool, true);
      });

      test('음수는 true를 반환한다', () {
        expect((-1).toBool, true);
        expect((-50).toBool, true);
      });
    });

    group('asCurrency', () {
      test('천 단위 쉼표를 추가한다', () {
        expect(1000.asCurrency, '1,000');
        expect(123456789.asCurrency, '123,456,789');
      });

      test('1000 미만은 쉼표 없이 반환한다', () {
        expect(0.asCurrency, '0');
        expect(999.asCurrency, '999');
        expect(100.asCurrency, '100');
      });

      test('큰 숫자도 올바르게 변환한다', () {
        expect(1000000.asCurrency, '1,000,000');
        expect(10000000000.asCurrency, '10,000,000,000');
      });
    });

    group('asKorean', () {
      test('각 자릿수를 한글 숫자로 변환한다', () {
        expect(123.asKorean, '일이삼');
        expect(4567.asKorean, '사오육칠');
        expect(0.asKorean, '영');
      });
    });

    group('asHanja', () {
      test('기본(간체자)으로 변환한다', () {
        expect(123.asHanja(), '一二三');
      });

      test('갖은자로 변환한다', () {
        expect(123.asHanja(gajeunja: true), '壹貳參');
      });
    });

    group('asKoreanWithUnits', () {
      test('단위 포함 한글 숫자로 변환한다 (ignoreIl 기본값=false, 일 포함)', () {
        expect(11111.asKoreanWithUnits(), '일만일천일백일십일');
      });

      test('ignoreIl=true이면 일을 생략한다', () {
        expect(11111.asKoreanWithUnits(ignoreIl: true), '일만천백십일');
      });

      test('0은 영을 반환한다', () {
        expect(0.asKoreanWithUnits(), '영');
      });

      test('10000은 일만을 반환한다', () {
        expect(10000.asKoreanWithUnits(), '일만');
      });

      test('큰 숫자도 올바르게 변환한다', () {
        expect(10000000.asKoreanWithUnits(), '일천만');
        expect(10000000.asKoreanWithUnits(ignoreIl: true), '천만');
      });
    });

    group('asKoreanCurrency', () {
      test('기본 접두/접미사로 통화 한글을 생성한다', () {
        expect(1234.asKoreanCurrency(), '금 일천이백삼십사 원정');
        expect(10000000.asKoreanCurrency(), '금 일천만 원정');
      });

      test('커스텀 접두/접미사를 사용할 수 있다', () {
        expect(
          1000.asKoreanCurrency(prefix: '총 ', suffix: ' 원'),
          '총 일천 원',
        );
      });
    });

    group('asHanjaCurrency', () {
      test('갖은자(기본) 한자 통화를 생성한다', () {
        expect(1234.asHanjaCurrency(), '金 壹仟貳佰參拾肆 원整');
      });

      test('간체자 한자 통화를 생성한다', () {
        expect(1234.asHanjaCurrency(gajeunja: false), '金 一千二百三十四 원整');
      });

      test('ignoreIl=true이면 壹/一을 생략한다', () {
        expect(1234.asHanjaCurrency(ignoreIl: true), '金 仟貳佰參拾肆 원整');
      });

      test('큰 숫자도 올바르게 변환한다', () {
        expect(10000000.asHanjaCurrency(), '金 壹仟萬 원整');
        expect(10000000.asHanjaCurrency(gajeunja: false), '金 一千萬 원整');
        expect(10000000.asHanjaCurrency(ignoreIl: true), '金 仟萬 원整');
      });
    });
  });

  group('NumListExtension', () {
    group('sum', () {
      test('리스트의 모든 요소를 합산한다', () {
        expect(<num>[1, 2, 3].sum, 6);
      });

      test('빈 리스트는 0을 반환한다', () {
        expect(<num>[].sum, 0);
      });

      test('실수 리스트도 합산한다', () {
        expect(<num>[1.5, 2.5, 3.0].sum, 7.0);
      });

      test('음수를 포함한 리스트도 합산한다', () {
        expect(<num>[1, -2, 3].sum, 2);
      });
    });

    group('average', () {
      test('리스트의 평균값을 반환한다', () {
        expect(<num>[1, 2, 3].average, 2);
      });

      test('빈 리스트는 0을 반환한다', () {
        expect(<num>[].average, 0);
      });

      test('실수 리스트의 평균을 반환한다', () {
        expect(<num>[1.0, 2.0, 3.0].average, 2.0);
      });

      test('요소가 하나인 리스트는 그 값을 반환한다', () {
        expect(<num>[5].average, 5);
      });
    });
  });
}
