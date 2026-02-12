## v1.0.1 (2026-02-12)

### Changes

- **외부 의존성 완전 제거**: 순수 Dart 패키지로 전환 (`dart test`, `dart run` 등 Dart CLI 만으로 실행 가능)
- **`toTimestamp` → `toMillis`**: `int` (millisecondsSinceEpoch)를 반환하도록 변경

### Bug Fixes

- `hasHangeul`: 공백 문자가 한글로 판별되던 버그 수정
- `moassugi`: 삼중모음(`ㅙ`, `ㅞ`) 모아쓰기가 올바르게 처리되지 않던 버그 수정
  - `ㅗㅏㅣ` → `ㅙ`, `ㅗㅐ` → `ㅙ`, `ㅘㅣ` → `ㅙ`
  - `ㅜㅓㅣ` → `ㅞ`, `ㅜㅔ` → `ㅞ`, `ㅝㅣ` → `ㅞ`

---

## v1.0.0 (2024-12-01)

### Features

- **`bool` Extension**: `toInt` — 논리 자료형을 정수로 변환
- **`DateTime` Extension**: `toMillis`, `ignoreTime`, `age`, `generation`, `wd`
- **`DateTime` Enum**: `Weekday` — `short`, `middle`, `long`, `shortKorean`, `longKorean`
- **`List` Extension**: `addIf` — 조건부 요소 추가
- **`num` Extension**: `toBool`, `asCurrency`, `asKorean`, `asHanja`, `asKoreanWithUnits`, `asKoreanCurrency`, `asHanjaCurrency`
- **`num` List Extension**: `sum`, `average`
- **`NumRange` / `IntRange` / `DoubleRange`**: 숫자 범위 클래스 — `start`, `end`, `difference`, `length`, `contains`, `subRanges`, `excludes` 지원
- **`String` Extension**: `reversed`
- **`String` Korean Extension**: 초/중/종성 분리, `hasBatchim`, `puleossugi`, `moassugi`, 조사 자동 선택(은/는, 이/가, 을/를, 으로/로), `isJaeum`, `isMoeum`, `isEumjeol`, `isHangeul`, `hasHangeul`, `hasSeparatedJaeumOrMoeum`, `containsHangeul`
- **`StringCaseConverter`**: 9가지 문자열 케이스 형식 상호 변환 (snake, skewer, pascal, camel, title, lower, upper)
