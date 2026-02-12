import 'package:test/test.dart';
import 'package:extify/string/extension.dart';

void main() {
  group('StringExtension', () {
    group('reversed', () {
      test('문자열을 뒤집어 반환한다', () {
        expect('Hello World'.reversed, 'dlroW olleH');
      });

      test('빈 문자열은 빈 문자열을 반환한다', () {
        expect(''.reversed, '');
      });

      test('한 글자는 그대로 반환한다', () {
        expect('A'.reversed, 'A');
      });

      test('숫자 문자열도 뒤집힌다', () {
        expect('12345'.reversed, '54321');
      });
    });
  });

  group('KoreanExtension', () {
    group('choseong / jungseong / jongseong', () {
      test('초성을 반환한다', () {
        expect('고양이'.choseong, 'ㄱㅇㅇ');
      });

      test('중성을 반환한다', () {
        expect('고양이'.jungseong, 'ㅗㅑㅣ');
      });

      test('종성을 반환한다 (없으면 공백)', () {
        expect('고양이'.jongseong, ' ㅇ ');
      });
    });

    group('hasBatchim', () {
      test('받침이 있으면 true를 반환한다', () {
        expect('받'.hasBatchim, true);
        expect('강'.hasBatchim, true);
        expect('한'.hasBatchim, true);
      });

      test('받침이 없으면 false를 반환한다', () {
        expect('바'.hasBatchim, false);
        expect('가'.hasBatchim, false);
        expect('이'.hasBatchim, false);
      });
    });

    group('puleossugi', () {
      test('한글을 풀어쓰기 한다', () {
        expect('고양이'.puleossugi, 'ㄱㅗㅇㅑㅇㅇㅣ');
      });

      test('받침이 있는 글자도 풀어쓰기 한다', () {
        expect('한글'.puleossugi, 'ㅎㅏㄴㄱㅡㄹ');
      });
    });

    group('moassugi', () {
      test('풀어쓴 한글을 모아쓰기 한다', () {
        expect('ㄱㅗㅇㅑㅇㅇㅣ'.moassugi, '고양이');
      });

      test('풀어쓴 한글을 원래대로 복원한다', () {
        expect('ㅎㅏㄴㄱㅡㄹ'.moassugi, '한글');
      });

      group('이중모음 모아쓰기', () {
        test('ㅗㅏ -> ㅘ', () {
          expect('ㄱㅗㅏㄴ'.moassugi, '관');
        });

        test('ㅗㅣ -> ㅚ', () {
          expect('ㅎㅗㅣ'.moassugi, '회');
        });

        test('ㅜㅣ -> ㅟ', () {
          expect('ㄱㅜㅣ'.moassugi, '귀');
        });

        test('ㅡㅣ -> ㅢ', () {
          expect('ㅇㅡㅣ'.moassugi, '의');
        });

        test('ㅏㅣ -> ㅐ', () {
          expect('ㄱㅏㅣ'.moassugi, '개');
        });

        test('ㅓㅣ -> ㅔ', () {
          expect('ㅅㅓㅣ'.moassugi, '세');
        });

        test('ㅜㅓ -> ㅝ', () {
          expect('ㄱㅜㅓㄴ'.moassugi, '권');
        });
      });

      group('삼중모음 모아쓰기', () {
        test('ㅗㅏㅣ -> ㅙ (삼중 분해)', () {
          expect('ㄱㅗㅏㅣ'.moassugi, '괘');
        });

        test('ㅗㅐ -> ㅙ (이중모음+ㅐ)', () {
          expect('ㄱㅗㅐ'.moassugi, '괘');
        });

        test('ㅘㅣ -> ㅙ (ㅘ+ㅣ)', () {
          expect('ㄱㅘㅣ'.moassugi, '괘');
        });

        test('ㅜㅓㅣ -> ㅞ (삼중 분해)', () {
          expect('ㄱㅜㅓㅣ'.moassugi, '궤');
        });

        test('ㅜㅔ -> ㅞ (이중모음+ㅔ)', () {
          expect('ㄱㅜㅔ'.moassugi, '궤');
        });

        test('ㅝㅣ -> ㅞ (ㅝ+ㅣ)', () {
          expect('ㄱㅝㅣ'.moassugi, '궤');
        });
      });
    });

    group('조사 (은/는, 이/가, 을/를, 으로/로)', () {
      group('eunNeun', () {
        test('받침 있으면 은을 반환한다', () {
          expect('김밥'.eunNeun, '은');
        });

        test('받침 없으면 는을 반환한다', () {
          expect('떡볶이'.eunNeun, '는');
        });
      });

      group('eunNeunName', () {
        test('받침 있는 이름은 이는을 반환한다', () {
          expect('민철'.eunNeunName, '이는');
        });

        test('받침 없는 이름은 는을 반환한다', () {
          expect('유리'.eunNeunName, '는');
        });
      });

      group('iGa', () {
        test('받침 있으면 이를 반환한다', () {
          expect('김밥'.iGa, '이');
        });

        test('받침 없으면 가를 반환한다', () {
          expect('떡볶이'.iGa, '가');
        });
      });

      group('iGaName', () {
        test('받침 있는 이름은 이가를 반환한다', () {
          expect('민철'.iGaName, '이가');
        });

        test('받침 없는 이름은 가를 반환한다', () {
          expect('유리'.iGaName, '가');
        });
      });

      group('eulReul', () {
        test('받침 있으면 을을 반환한다', () {
          expect('김밥'.eulReul, '을');
        });

        test('받침 없으면 를을 반환한다', () {
          expect('떡볶이'.eulReul, '를');
        });
      });

      group('eulReulName', () {
        test('받침 있는 이름은 이를을 반환한다', () {
          expect('민철'.eulReulName, '이를');
        });

        test('받침 없는 이름은 를을 반환한다', () {
          expect('유리'.eulReulName, '를');
        });
      });

      group('roEuro', () {
        test('받침 없으면 로를 반환한다', () {
          expect('학교'.roEuro, '로');
        });

        test('받침 있으면 으로를 반환한다', () {
          expect('병원'.roEuro, '으로');
        });
      });
    });

    group('with 조사 (문자열 + 조사)', () {
      test('withEunNeun', () {
        expect('김밥'.withEunNeun, '김밥은');
        expect('떡볶이'.withEunNeun, '떡볶이는');
      });

      test('withEunNeunName', () {
        expect('민철'.withEunNeunName, '민철이는');
      });

      test('withIGa', () {
        expect('김밥'.withIGa, '김밥이');
        expect('떡볶이'.withIGa, '떡볶이가');
      });

      test('withIGaName', () {
        expect('민철'.withIGaName, '민철이가');
      });

      test('withEulReul', () {
        expect('김밥'.withEulReul, '김밥을');
        expect('떡볶이'.withEulReul, '떡볶이를');
      });

      test('withEulReulName', () {
        expect('민철'.withEulReulName, '민철이를');
      });

      test('withRoEuro', () {
        expect('학교'.withRoEuro, '학교로');
        expect('병원'.withRoEuro, '병원으로');
      });
    });

    group('isJaeum / isMoeum / isEumjeol', () {
      test('자음 판별', () {
        expect('ㄱ'.isJaeum, true);
        expect('ㅏ'.isJaeum, false);
        expect('가'.isJaeum, false);
      });

      test('모음 판별', () {
        expect('ㄱ'.isMoeum, false);
        expect('ㅏ'.isMoeum, true);
        expect('가'.isMoeum, false);
      });

      test('음절 판별', () {
        expect('ㄱ'.isEumjeol, false);
        expect('ㅏ'.isEumjeol, false);
        expect('가'.isEumjeol, true);
      });
    });

    group('isHangeul', () {
      test('한글만 포함된 문자열은 true를 반환한다', () {
        expect('ㄱ'.isHangeul, true);
        expect('ㅏ'.isHangeul, true);
        expect('가'.isHangeul, true);
        expect('강아지'.isHangeul, true);
        expect('강 아지'.isHangeul, true);
      });

      test('한글이 아닌 문자열은 false를 반환한다', () {
        expect('Dog'.isHangeul, false);
        expect('Dog강아지'.isHangeul, false);
      });
    });

    group('hasHangeul', () {
      test('한글이 포함되어 있으면 true를 반환한다', () {
        expect('안녕 World'.hasHangeul, true);
      });

      test('한글이 없으면 false를 반환한다', () {
        expect('Hello World'.hasHangeul, false);
      });
    });

    group('hasSeparatedJaeumOrMoeum', () {
      test('독립 자모가 있으면 true를 반환한다', () {
        expect('안녕ㅎ'.hasSeparatedJaeumOrMoeum, true);
      });

      test('독립 자모가 없으면 false를 반환한다', () {
        expect('안녕'.hasSeparatedJaeumOrMoeum, false);
      });
    });

    group('containsHangeul', () {
      test('초성 검색이 가능하다', () {
        expect('세상'.containsHangeul('ㅅ'), true);
      });

      test('완성된 글자로 검색이 가능하다', () {
        expect('세상'.containsHangeul('세'), true);
      });

      test('유사한 글자로 검색이 가능하다', () {
        expect('세상'.containsHangeul('셋'), true);
      });

      test('부분 입력으로 검색이 가능하다', () {
        expect('세상'.containsHangeul('세ㅅ'), true);
        expect('세상'.containsHangeul('세사'), true);
        expect('세상'.containsHangeul('세상'), true);
      });
    });
  });
}
