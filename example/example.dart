// ignore_for_file: avoid_print, unused_local_variable

/// extify 패키지 사용 예제
///
/// ```bash
/// dart example/example.dart
/// ```

import 'package:extify/util.dart';

void main() {
  boolExample();
  dateTimeExample();
  listExample();
  numberExample();
  numRangeExample();
  stringExample();
  koreanExample();
  caseConverterExample();
}

// ─────────────────────────────────────────────
// bool Extension
// ─────────────────────────────────────────────
void boolExample() {
  print('═══ bool Extension ═══');
  print('true.toInt  → ${true.toInt}');   // 1
  print('false.toInt → ${false.toInt}');  // 0
  print('');
}

// ─────────────────────────────────────────────
// DateTime Extension & Weekday Enum
// ─────────────────────────────────────────────
void dateTimeExample() {
  print('═══ DateTime Extension ═══');

  final now = DateTime.now();
  print('DateTime.now()          → $now');
  print('.ignoreTime             → ${now.ignoreTime}');
  print('.wd                     → ${now.wd}');
  print('.wd.shortKorean         → ${now.wd.shortKorean}');
  print('.wd.longKorean          → ${now.wd.longKorean}');
  print('');

  final birthday = DateTime(2000, 1, 1);
  print('DateTime(2000, 1, 1)');
  print('.age                    → ${birthday.age}');
  print('.generation             → ${birthday.generation}');
  print('');

  // Weekday Enum
  print('── Weekday Enum ──');
  final weekday = Weekday.monday;
  print('Weekday.monday.short       → ${weekday.short}');        // m
  print('Weekday.monday.middle      → ${weekday.middle}');       // mon
  print('Weekday.monday.long        → ${weekday.long}');         // monday
  print('Weekday.monday.shortKorean → ${weekday.shortKorean}');  // 월
  print('Weekday.monday.longKorean  → ${weekday.longKorean}');   // 월요일
  print('');
}

// ─────────────────────────────────────────────
// List Extension
// ─────────────────────────────────────────────
void listExample() {
  print('═══ List Extension ═══');

  final list = [1, 2, 3];
  list.addIf(true, 4);
  print('[1,2,3].addIf(true, 4)  → $list');   // [1, 2, 3, 4]
  list.addIf(false, 5);
  print('.addIf(false, 5)        → $list');    // [1, 2, 3, 4]
  print('');
}

// ─────────────────────────────────────────────
// Number Extension
// ─────────────────────────────────────────────
void numberExample() {
  print('═══ Number Extension ═══');

  // int → bool
  print('1.toBool     → ${1.toBool}');     // true
  print('0.toBool     → ${0.toBool}');     // false
  print('(-5).toBool  → ${(-5).toBool}');  // true
  print('');

  // 통화 형식
  print('123456789.asCurrency → ${123456789.asCurrency}');  // 123,456,789
  print('');

  // 한글 숫자
  print('123.asKorean → ${123.asKorean}');  // 일이삼
  print('');

  // 한자 숫자
  print('123.asHanja()                 → ${123.asHanja()}');                // 一二三
  print('123.asHanja(gajeunja: true)   → ${123.asHanja(gajeunja: true)}'); // 壹貳參
  print('');

  // 단위 포함 한글 숫자
  print('11111.asKoreanWithUnits()                → ${11111.asKoreanWithUnits()}');                // 일만일천일백일십일
  print('11111.asKoreanWithUnits(ignoreIl: true)  → ${11111.asKoreanWithUnits(ignoreIl: true)}'); // 일만천백십일
  print('');

  // 한글 통화
  print('1234.asKoreanCurrency()  → ${1234.asKoreanCurrency()}');  // 금 일천이백삼십사 원정
  print('');

  // 한자 통화
  print('1234.asHanjaCurrency()                → ${1234.asHanjaCurrency()}');                // 金 壹仟貳佰參拾肆 원整
  print('1234.asHanjaCurrency(gajeunja: false) → ${1234.asHanjaCurrency(gajeunja: false)}'); // 金 一千二百三十四 원整
  print('');

  // List<num> 합산 / 평균
  print('[1, 2, 3].sum     → ${[1, 2, 3].sum}');      // 6
  print('[1, 2, 3].average → ${[1, 2, 3].average}');   // 2
  print('<num>[].sum       → ${<num>[].sum}');          // 0
  print('<num>[].average   → ${<num>[].average}');      // 0
  print('');
}

// ─────────────────────────────────────────────
// NumRange / IntRange / DoubleRange
// ─────────────────────────────────────────────
void numRangeExample() {
  print('═══ NumRange ═══');

  final range = NumRange(1, 10);
  print('NumRange(1, 10)');
  print('.start      → ${range.start}');       // 1
  print('.end        → ${range.end}');         // 10
  print('.difference → ${range.difference}');  // 9.0
  print('.length     → ${range.length}');      // 9.0
  print('.contains(5)  → ${range.contains(5)}');   // true
  print('.contains(11) → ${range.contains(11)}');  // false
  print('');

  final rangeExcludes = NumRange(1, 10, excludes: [
    NumRange(3.7, 6.5),
    NumRange(8.8, 9.1),
  ]);
  print('NumRange(1, 10, excludes: [NumRange(3.7, 6.5), NumRange(8.8, 9.1)])');
  print('.contains(3.8) → ${rangeExcludes.contains(3.8)}');  // false (제외 범위)
  print('.contains(7.6) → ${rangeExcludes.contains(7.6)}');  // true
  print('.subRanges     → ${rangeExcludes.subRanges}');
  print('');
}

// ─────────────────────────────────────────────
// String Extension
// ─────────────────────────────────────────────
void stringExample() {
  print('═══ String Extension ═══');
  print("'Hello World'.reversed → ${'Hello World'.reversed}");  // dlroW olleH
  print('');
}

// ─────────────────────────────────────────────
// Korean Extension
// ─────────────────────────────────────────────
void koreanExample() {
  print('═══ Korean Extension ═══');

  // 초/중/종성
  print("── 초/중/종성 분리 ──");
  print("'고양이'.choseong  → ${'고양이'.choseong}");   // ㄱㅇㅇ
  print("'고양이'.jungseong → ${'고양이'.jungseong}");  // ㅗㅑㅣ
  print("'고양이'.jongseong → ${'고양이'.jongseong}");  // ·ㅇ·
  print('');

  // 받침
  print("── 받침 ──");
  print("'바'.hasBatchim → ${'바'.hasBatchim}");  // false
  print("'받'.hasBatchim → ${'받'.hasBatchim}");  // true
  print('');

  // 풀어쓰기 / 모아쓰기
  print("── 풀어쓰기 / 모아쓰기 ──");
  print("'고양이'.puleossugi           → ${'고양이'.puleossugi}");            // ㄱㅗㅇㅑㅇㅇㅣ
  print("'ㄱㅗㅇㅑㅇㅇㅣ'.moassugi     → ${'ㄱㅗㅇㅑㅇㅇㅣ'.moassugi}");  // 고양이
  print('');

  // 조사
  print("── 조사 자동 선택 ──");
  print("'김밥'.withEunNeun   → ${'김밥'.withEunNeun}");    // 김밥은
  print("'떡볶이'.withEunNeun → ${'떡볶이'.withEunNeun}");  // 떡볶이는
  print("'김밥'.withIGa       → ${'김밥'.withIGa}");        // 김밥이
  print("'떡볶이'.withIGa     → ${'떡볶이'.withIGa}");      // 떡볶이가
  print("'김밥'.withEulReul   → ${'김밥'.withEulReul}");    // 김밥을
  print("'떡볶이'.withEulReul → ${'떡볶이'.withEulReul}");  // 떡볶이를
  print("'학교'.withRoEuro    → ${'학교'.withRoEuro}");     // 학교로
  print("'병원'.withRoEuro    → ${'병원'.withRoEuro}");     // 병원으로
  print('');

  // 이름 전용 조사
  print("── 이름 전용 조사 ──");
  print("'민철'.withEunNeunName  → ${'민철'.withEunNeunName}");   // 민철이는
  print("'민철'.withIGaName      → ${'민철'.withIGaName}");       // 민철이가
  print("'민철'.withEulReulName  → ${'민철'.withEulReulName}");   // 민철이를
  print('');

  // 한글 판별
  print("── 한글 판별 ──");
  print("'ㄱ'.isJaeum    → ${'ㄱ'.isJaeum}");      // true
  print("'ㅏ'.isMoeum    → ${'ㅏ'.isMoeum}");      // true
  print("'가'.isEumjeol  → ${'가'.isEumjeol}");    // true
  print("'강아지'.isHangeul  → ${'강아지'.isHangeul}");    // true
  print("'Dog'.isHangeul     → ${'Dog'.isHangeul}");       // false
  print("'안녕 World'.hasHangeul   → ${'안녕 World'.hasHangeul}");  // true
  print("'Hello World'.hasHangeul  → ${'Hello World'.hasHangeul}"); // false
  print('');

  // 초성 검색
  print("── 한글 포함 검색 (containsHangeul) ──");
  print("'세상'.containsHangeul('ㅅ')  → ${'세상'.containsHangeul('ㅅ')}");   // true
  print("'세상'.containsHangeul('세')  → ${'세상'.containsHangeul('세')}");   // true
  print("'세상'.containsHangeul('세ㅅ') → ${'세상'.containsHangeul('세ㅅ')}"); // true
  print("'세상'.containsHangeul('세사') → ${'세상'.containsHangeul('세사')}"); // true
  print('');
}

// ─────────────────────────────────────────────
// StringCaseConverter
// ─────────────────────────────────────────────
void caseConverterExample() {
  print('═══ StringCaseConverter ═══');

  final c = StringCaseConverter('hello_world');
  print("StringCaseConverter('hello_world')");
  print('.lowerSnakeCase  → ${c.lowerSnakeCase}');   // hello_world
  print('.upperSnakeCase  → ${c.upperSnakeCase}');   // HELLO_WORLD
  print('.lowerSkewerCase → ${c.lowerSkewerCase}');  // hello-world
  print('.upperSkewerCase → ${c.upperSkewerCase}');  // HELLO-WORLD
  print('.pascalCase      → ${c.pascalCase}');       // HelloWorld
  print('.camelCase       → ${c.camelCase}');        // helloWorld
  print('.titleCase       → ${c.titleCase}');        // Hello World
  print('.lowerCase       → ${c.lowerCase}');        // hello world
  print('.upperCase       → ${c.upperCase}');        // HELLO WORLD
  print('');

  // 어떤 형식에서든 변환 가능
  print("StringCaseConverter('HelloWorld').lowerSnakeCase → ${StringCaseConverter('HelloWorld').lowerSnakeCase}");
  print("StringCaseConverter('HELLO-WORLD').camelCase     → ${StringCaseConverter('HELLO-WORLD').camelCase}");
  print('');
}

