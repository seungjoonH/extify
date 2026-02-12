# Dart Utils Package

## 📋 목차

- [📝 개요](#-개요)
- [🔧 기능](#-기능)
  - [논리 자료형 `bool` 관련](#논리-자료형-bool-관련)
  - [날짜 및 시간 `DateTime` 관련](#날짜-및-시간-DateTime-관련)
  - [배열 `List` 관련](#배열-List-관련)
  - [숫자 `num`, `int`, `double` 관련](#숫자-num-int-double-관련)
  - [문자열 `String` 관련](#문자열-String-관련)
- [🚀 사용법](#-사용법)
- [🔄 업데이트 정보](#-업데이트-정보)

---

<br>


## 📝 개요

### 설명

- 내가 사용하려고 만든 <u>**Dart 기반 유틸리티 패키지**</u> 입니다.
- 필요한 기능이 있다면 마음대로 사용하셔도 괜찮습니다.

### 의의

- **개발 편의성**을 향상할 수 있습니다.
- 서로 다른 프로젝트에 **범용적으로 사용**될 수 있습니다.
- 협업 시 같은 기능을 하는 코드를 각자 개발하는 등의 개발력 낭비를 최소화 할 수 있습니다.

## 🔧 기능

### 논리 자료형 `bool` 관련

#### Extension

- `toInt: int`- **Getter**

  논리 자료형 `bool` 을 정수 자료형 `int` 로 변환합니다.

  ```dart
  void main() {
    print(true.toInt);  // 1
    print(false.toInt); // 0
  }
  ```

### 날짜 및 시간 `DateTime` 관련

#### Extension

- `toMillis: int` - **Getter**

  Unix Epoch 기준 밀리초를 반환합니다.

  ```dart
  void main() {
    print(DateTime.now().toMillis); // 1732804031349
  }
  ```

- `ignoreTime: DateTime` - **Getter**

  `DateTime` 의 시간부를 제외합니다.

  ```dart
  void main() {
    print(DateTime.now().ignoreTime); // 2024-11-28 00:00:00.000
  }
  ```

- `age: int` - **Getter**

  해당 시간에 태어난 사람의 만 나이를 계산합니다.

  ```dart
  void main() {
    print(DateTime(2000, 01, 01).age); // 25  (2025년 기준) 
    print(DateTime(1976, 03, 18).age); // 49  (2025년 기준) 
  }
  ```

- `generation: int` - **Getter**

  해당 시간에 태어난 사람의 세대를 계산합니다.

  ```dart
  void main() {
    print(DateTime(2000, 01, 01).generation); // 20  (2025년 기준) 
    print(DateTime(1976, 03, 18).generation); // 40  (2025년 기준)
  }
  ```

- `wd: Weekday` - **Getter**

해당 날짜의 요일 `Weekday` 를 반환합니다.

  ```dart
  void main() {
  print(DateTime.now().wd);  // Weekday.thursday
}
  ```

#### Enum

- `Weekday`

  ```dart
  void main() {
    var weekday = Weekday.monday;
    print(weekday.short);        // m
    print(weekday.middle);       // mon
    print(weekday.long);         // monday
    print(weekday.shortKorean);  // 월
    print(weekday.longKorean);   // 월요일
  }
  ```

### 배열 `List` 관련

#### Extension

- `addIf(bool, T): void`: **Method**

  **매개변수**

| 자료형 | 변수명 | 설명 |
|:-:|:-:|:-:|
| `bool` | condition | 조건식 |
| `T` | element | 추가할 요소 |


  ```dart
  void main() {
  List<int> list = [0];
  list.addIf(list.sum < 5, list.last + 1);
  print(list);  // [0, 1]
  list.addIf(list.sum < 5, list.last + 1);
  print(list);  // [0, 1, 2]
  list.addIf(list.sum < 5, list.last + 1);
  print(list);  // [0, 1, 2, 3]
  list.addIf(list.sum < 5, list.last + 1);
  print(list);  // [0, 1, 2, 3]
}
  ```

### 숫자 `num`, `int`, `double` 관련

#### Extension

##### Num List Extension

- `sum: num` - **Getter**

  리스트의 모든 요소를 합산하여 반환합니다.

  ```dart
  void main() {
    print([1, 2, 3].sum); // 6
    print([].sum);        // 0
  }
  ```

- `average: num` - **Getter**

  리스트의 요소들의 평균값을 반환합니다. 리스트가 비어 있는 경우 `0` 을 반환합니다.

  ```dart
  void main() {
    print([1, 2, 3].average); // 2
    print([].average);        // 0
  }
  ```

##### Int Extension

- `toBool: bool`- **Getter**

  정수 자료형 `int` 을 논리 자료형 `bool` 로 변환합니다.

  ```dart
  void main() {
    print(1.toBool);   // true
    print(0.toBool);   // false
    print(-50.toBool); // true
  }
  ```

- `asCurrency: String` - **Getter**

  정수를 세 자리마다 쉼표로 구분된 통화 형식의 문자열로 변환합니다.

  ```dart
  void main() {
    print(123456789.asCurrency); // 123,456,789
    print(1000.asCurrency);      // 1,000
  }
  ```

- `asKorean: String` - **Getter**

  정수를 한글 숫자로 변환합니다.

  ```dart
  void main() {
    print(123.asKorean); // 일이삼
    print(4567.asKorean); // 사오육칠
  }
  ```

- `asHanja({bool gajeunja = false}): String` - **Method**

  **매개변수**

  정수를 한자로 변환합니다. 기본적으로 간체자를 사용합니다.

  `gajeunja` 가 `true` 값을 가질 경우 갖은자를 사용하여 반환합니다.

| 자료형 | 변수명 | 설명 |
|:-:|:-:|:-:|
| `bool` | gajeunja | 갖은자 반환 여부 |


  ```dart
  void main() {
  print(123.asHanja());                 // 一二三
  print(123.asHanja(gajeunja: true));   // 壹貳參
}
  ```

- `asKoreanWithUnits({bool ignoreIl = true}): String` - **Method**

  정수를 한글 숫자와 단위(십, 백, 천 등)를 포함한 문자열로 변환합니다.

  `ignoreIl` 이 `true` 값을 가질 경우 어색한 `일` 을 생략하여 반환합니다.  (기본값: `true`)

  ```dart
  void main() {
    print(11111.asKoreanWithUnits());                // 일만천백십일
    print(11111.asKoreanWithUnits(ignoreIl: false)); // 일만일천일백일십일
  }
  ```

- `asKoreanCurrency({bool ignoreIl = false, String prefix = '금 ', String suffix = ' 원정'}): String` - **Method**

  정수를 한글 숫자와 통화 단위로 변환합니다.

  `ignoreIl` 이 `true` 값을 가질 경우 어색한 `일` 을 생략하여 반환합니다. (기본값: `false`) <br>
  기본적으로 `금 ~ 원정` 형식을 사용하며, 접두사 `prefix` 와 접미사 `suffix` 를 수정할 수 있습니다. <br>

  ```dart
  void main() {
    print(1234.asKoreanCurrency());     // 금 일천이백삼십사 원정
    print(10000000.asKoreanCurrency()); // 금 일천만 원정
  }
  ```

- `asHanjaCurrency({bool gajeunja = true, bool ignoreIl = false, String prefix = '金 ', String suffix = ' 원整'}): String` - **Method**

  정수를 한자 숫자와 통화 단위로 변환합니다.

  `ignoreIl` 이 `true` 값을 가질 경우 어색한 `一` 또는 `壹` 을 생략하여 반환합니다. (기본값: `false`) <br>
  기본적으로 `金 ~ 원整` 형식을 사용하며, 접두사 `prefix` 와 접미사 `suffix` 를 수정할 수 있습니다. <br>
  `gajeunja` 가 `true` 값을 가질 경우 갖은자를 사용합니다. <br>

  ```dart
  void main() {
    print(1234.asHanjaCurrency());                    // 金 壹仟貳佰參拾肆 원整
    print(1234.asHanjaCurrency(gajeunja: false));     // 金 一千二百三十四 원整
    print(1234.asHanjaCurrency(ignoreIl: true));      // 金 仟貳佰參拾肆 원整
    print(10000000.asHanjaCurrency());                // 金 壹仟萬 원整
    print(10000000.asHanjaCurrency(gajeunja: false)); // 金 一千萬 원整
    print(10000000.asHanjaCurrency(ignoreIl: true));  // 金 仟萬 원整
  }
  ```

#### Class

##### `NumRange`

숫자 자료형 `num` 의 범위에 대한 다양한 기능을 제공합니다.

**생성자 매개변수**

| 자료형 | 변수명 | 설명 |
|:-:|:-:|:-:|
| `T` | start | 최솟값 |
| `T` | end | 최댓값 |
| `List<NumRange(T)>` | excludes | 제외할 범위 리스트 |


```dart
var range = NumRange(1, 10);
var rangeExcludes = NumRange(1, 10, excludes: [
  NumRange(3.7, 6.5),
  NumRange(8.8, 9.1),
]);
```

- `start: num` - **Getter**

  최솟값을 반환합니다.

  ```dart
  print(range.start);         // 1
  print(rangeExcludes.start); // 1
  ```

- `end: num` - **Getter**

  최댓값을 반환합니다.

  ```dart
  print(range.end);         // 10
  print(rangeExcludes.end); // 10
  ```

- `difference: num` - **Getter**

  최솟값과 최댓값의 차이를 반환합니다.

  ```dart
  print(range.difference);         // 9.0
  print(rangeExcludes.difference); // 9.0
  ```

- `length: T` - **Getter**

  범위의 길이를 반환합니다.

  이때 excludes 에 포함되는 범위는 제외됩니다.

  ```dart
  print(range.length);         // 9.0
  print(rangeExcludes.length); // 5.900000000000001
  ```

- `contains(T): bool`  - **Method**

  **매개변수**

| 자료형 | 변수명 | 설명 |
|:-:|:-:|:-:|
| `T` | num | 범위 포함 여부를 판단할 숫자 |

  ```dart
  print(range.contains(3.8));         // true
  print(range.contains(7.6));         // true
  print(rangeExcludes.contains(3.8)); // false
  print(rangeExcludes.contains(7.6)); // true
  ```

- `subRanges: List<NumRange>` - **Getter**

  `excludes` 를 제외한 부분범위 리스트를 반환합니다.

  ```dart
  print(range.subRanges);          // [NumRange(1, 10)]
  print(rangeExcludes.subRanges);  // [NumRange(1, 3.7), NumRange(6.5, 8.8), NumRange(9.1, 10)]
  ```

##### `IntRange`, `DoubleRange`

위와 동일합니다.

### 문자열 `String` 관련

#### Enum

| 이름 | 예시 |
|:-:|:-:|
| lowerSnakeCase | `'hello_world'` |
| upperSnakeCase | `'HELLO_WORLD'` |
| lowerSkewerCase | `'hello-world'` |
| upperSkewerCase | `'HELLO-WORLD'` |
| pascalCase | `'HelloWorld'` |
| camelCase | `'helloWorld'` |
| titleCase | `'Hello World'` |
| lowerCase | `'hello world'` |
| upperCase | `'HELLO WORLD'` |

#### Extension

##### String Extension

- `reversed: String` - **Getter**

  반전된 문자열을 반환합니다.

  ```dart
  void main() {
    print('Hello World'.reversed);  // dlroW olleH 
  }
  ```

##### Korean Extension

- `choseong: String` - **Getter**

  한글 문자열의 초성을 반환합니다.

- `jungseong: String` - **Getter**

  한글 문자열의 중성을 반환합니다.

- `jongseong: String` - **Getter**

  한글 문자열의 종성을 반환합니다.

- `hasBatchim: bool` - **Getter**

  1음절 문자의 받침 존재 여부를 반환합니다.

  **주의**: 1음절 문자만 사용 가능합니다. (ex. `땅`, `별`, `해`)

- `puleossugi: String` - **Getter**

  한글 문자열을 풀어쓰기하여 반환합니다.

- `moassugi: String` - **Getter**

  한글 문자열을 모아쓰기하여 반환합니다.

- `eunNeun: String` - **Getter**

  한글 문자열에 이어질 보조사(은/는)를 반환합니다.

- `eunNeunName: String` - **Getter**

  한글 이름에 이어질 보조사(이는/는)를 반환합니다.

- `iGa: String` - **Getter**

  한글 문자열에 이어질 주격조사(이/가)를 반환합니다.

- `iGaName: String` - **Getter**

  한글 이름에 이어질 주격조사(이가/가)를 반환합니다.

- `eulReul: String` - **Getter**

  한글 문자열에 이어질 목적격조사(을/를)를 반환합니다.

- `eulReulName: String` - **Getter**

  한글 이름에 이어질 목적격조사(이를/를)를 반환합니다.

- `roEuro: String` - **Getter**

  장소를 나타내는 한글 문자열에 이어질 조사(으로/로)를 반환합니다.

- `withEunNeun: String` - **Getter**

  한글 문자열에 보조사(은/는)를 이어 반환합니다.

- `withEunNeunName: String` - **Getter**

  한글 이름에 보조사(이는/는)를 이어 반환합니다.

- `withIGa: String` - **Getter**

  한글 문자열에 주격조사(이/가)를 이어 반환합니다.

- `withIGaName: String` - **Getter**

  한글 이름에 주격조사(이가/가)를 이어 반환합니다.

- `withEulReul: String` - **Getter**

  한글 문자열에 목적격조사(을/를)를 이어 반환합니다.

- `withEulReulName: String` - **Getter**

  한글 이름에 목적격조사(이를/를)를 이어 반환합니다.

- `withRoEuro: String` - **Getter**

  장소를 나타내는 한글 문자열에 조사(으로/로)를 이어 반환합니다.

- `isJaeum: String` - **Getter**

  길이가 1인 한글 문자가 자음인지 여부를 반환합니다.

- `isMoeum: String` - **Getter**

  길이가 1인 한글 문자가 모음인지 여부를 반환합니다.

- `isEumjeol: String` - **Getter**

  길이가 1인 한글 문자가 1음절인지 여부를 반환합니다.

- `isHangeul: String` - **Getter**

  문자열이 한글인지 여부를 반환합니다.

- `hasHangeul: String` - **Getter**

  문자열의 한글 포함 여부를 반환합니다.

- `hasSeparatedJaeumOrMoeum: String` - **Getter**

  문자열에 독립적인 자모 존재 여부를 반환합니다.

- `containsHangeul(other: String): bool` - **Method**

  문자열에 한글 문자열 `string` 포함 여부를 반환합니다.


**사용법**

```dart
void main() {
  print('고양이'.choseong);                 // ㄱㅇㅇ
  print('고양이'.jungseong);                // ㅗㅑㅣ
  print('고양이'.jongseong);                //  ㅇ

  print('바'.hasBatchim);                  // false
  print('받'.hasBatchim);                  // true

  print('고양이'.puleossugi);               // ㄱㅗㅇㅑㅇㅇㅣ
  print('ㄱㅗㅇㅑㅇㅇㅣ'.moassugi);           // 고양이

  print('김밥'.eunNeun);                   // 은
  print('떡볶이'.eunNeun);                  // 는
  print('민철'.eunNeunName);               // 이는
  print('김밥'.iGa);                       // 이
  print('떡볶이'.iGa);                      // 가
  print('민철'.iGaName);                   // 이가
  print('김밥'.eulReul);                   // 을
  print('떡볶이'.eulReul);                  // 를
  print('민철'.eulReulName);               // 이를
  print('학교'.roEuro);                    // 로
  print('병원'.roEuro);                    // 으로

  print('김밥'.withEunNeun);               // 김밥은
  print('떡볶이'.withEunNeun);             // 떡볶이는
  print('민철'.withEunNeunName);           // 민철이는
  print('김밥'.withIGa);                   // 김밥이
  print('떡볶이'.withIGa);                  // 떡볶이가
  print('민철'.withIGaName);               // 민철이가
  print('김밥'.withEulReul);               // 김밥을
  print('떡볶이'.withEulReul);              // 떡볶이를
  print('민철'.withEulReulName);           // 민철이를
  print('학교'.withRoEuro);                // 학교로
  print('병원'.withRoEuro);                // 병원으로

  print('ㄱ'.isJaeum);                     // true
  print('ㅏ'.isJaeum);                     // false
  print('가'.isJaeum);                     // false

  print('ㄱ'.isMoeum);                     // false
  print('ㅏ'.isMoeum);                     // true
  print('가'.isMoeum);                     // false

  print('ㄱ'.isEumjeol);                   // false
  print('ㅏ'.isEumjeol);                   // false
  print('가'.isEumjeol);                   // true

  print('ㄱ'.isHangeul);                   // true
  print('ㅏ'.isHangeul);                   // true
  print('가'.isHangeul);                   // true
  print('강아지'.isHangeul);                // true
  print('강 아지'.isHangeul);               // true
  print('Dog'.isHangeul);                 // false
  print('Dog강아지'.isHangeul);             // false

  print('안녕 World'.hasHangeul);          // true
  print('Hello World'.hasHangeul);        // false

  print('안녕ㅎ'.hasSeparatedJaeumOrMoeum); // true
  print('안녕'.hasSeparatedJaeumOrMoeum);  // false

  print('세상'.containsHangeul('ㅅ'));      // true
  print('세상'.containsHangeul('세'));      // true
  print('세상'.containsHangeul('셋'));      // true
  print('세상'.containsHangeul('세ㅅ'));     // true
  print('세상'.containsHangeul('세사'));     // true
  print('세상'.containsHangeul('세상'));     // true

  print('세상'.contains('ㅅ'));             // false
  print('세상'.contains('세'));             // true
  print('세상'.contains('셋'));             // false
  print('세상'.contains('세ㅅ'));            // false
  print('세상'.contains('세사'));            // false
  print('세상'.contains('세상'));            // true
}
```


#### Class

##### `StringCaseConverter` 문자열 형식 변환기

**생성자 매개변수**

| 자료형 | 변수명 | 설명 |
|:-:|:-:|:-:|
| `String` | value | 변환할 최초 텍스트 |


**사용법**

```dart
void main() {
  print(StringCaseConverter('hello_world').pascalCase);      // HelloWorld
  print(StringCaseConverter('HELLO_WORLD').pascalCase);      // HelloWorld
  print(StringCaseConverter('hello-world').pascalCase);      // HelloWorld
  print(StringCaseConverter('HELLO-WORLD').pascalCase);      // HelloWorld
  print(StringCaseConverter('HelloWorld').pascalCase);       // HelloWorld
  print(StringCaseConverter('helloWorld').pascalCase);       // HelloWorld
  print(StringCaseConverter('Hello World').pascalCase);      // HelloWorld
  print(StringCaseConverter('hello world').pascalCase);      // HelloWorld
  print(StringCaseConverter('HELLO WORLD').pascalCase);      // HelloWorld

  print(StringCaseConverter('hello_world').lowerSnakeCase);  // hello_world
  print(StringCaseConverter('hello_world').upperSnakeCase);  // HELLO_WORLD
  print(StringCaseConverter('hello_world').lowerSkewerCase); // hello-world
  print(StringCaseConverter('hello_world').upperSkewerCase); // HELLO-WORLD
  print(StringCaseConverter('hello_world').pascalCase);      // HelloWorld
  print(StringCaseConverter('hello_world').camelCase);       // helloWorld
  print(StringCaseConverter('hello_world').titleCase);       // Hello World
  print(StringCaseConverter('hello_world').lowerCase);       // hello world
  print(StringCaseConverter('hello_world').upperCase);       // HELLO WORLD
}
```

## 🚀 사용법

### 설치

#### pub.dev (권장)

```bash
dart pub add extify
```

또는 `pubspec.yaml` 에 직접 추가:

```yaml
dependencies:
  extify: ^1.0.1
```

#### GitHub

- 최신버전

  ```yaml
  dependencies:
    extify:
      git:
        url: https://github.com/seungjoonH/extify.git
        ref: latest
  ```

- 특정버전

  ```yaml
  dependencies:
    extify:
      git:
        url: https://github.com/seungjoonH/extify.git
        ref: v1.0.1
  ```

### 의존성 설치

```bash
dart pub get
```

### 임포트

```dart
import 'package:extify/util.dart';
```

필요한 모듈만 개별적으로 임포트할 수도 있습니다:

```dart
import 'package:extify/string.dart';
import 'package:extify/number.dart';
```

### 업데이트

```bash
dart pub upgrade extify
```


## 🔄 업데이트 정보

#### v1.0.1 (2026-02-12)

- 순수 Dart 패키지로 전환 (외부 의존성 완전 제거)
- `toTimestamp` → `toMillis` 변경
- `hasHangeul`, `moassugi` 버그 수정

#### v1.0.0 (2024-12-01)

- 초기 릴리즈