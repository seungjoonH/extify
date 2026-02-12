import 'package:test/test.dart';
import 'package:extify/date_time/extension.dart';
import 'package:extify/date_time/enum.dart';

void main() {
  group('DateTimeExtension', () {
    group('toMillis', () {
      test('Unix Epoch 기준 밀리초를 반환한다', () {
        final dt = DateTime(2024, 1, 1);
        expect(dt.toMillis, dt.millisecondsSinceEpoch);
      });

      test('Epoch 시작(1970-01-01) 은 0을 반환한다', () {
        final epoch = DateTime.utc(1970, 1, 1);
        expect(epoch.toMillis, 0);
      });
    });

    group('ignoreTime', () {
      test('시간부를 제거하고 날짜만 남긴다', () {
        final dt = DateTime(2024, 11, 28, 17, 46, 42);
        expect(dt.ignoreTime, DateTime(2024, 11, 28));
      });

      test('이미 00:00:00인 경우 동일하게 반환한다', () {
        final dt = DateTime(2024, 1, 1);
        expect(dt.ignoreTime, DateTime(2024, 1, 1));
      });
    });

    group('age', () {
      test('현재 날짜 기준으로 만 나이를 계산한다', () {
        final now = DateTime.now();
        // 올해 생일이 이미 지난 경우
        final pastBirthday = DateTime(now.year - 25, 1, 1);
        expect(pastBirthday.age, greaterThanOrEqualTo(24));
        expect(pastBirthday.age, lessThanOrEqualTo(25));
      });

      test('생일이 아직 오지 않은 경우 1살 적게 계산한다', () {
        final now = DateTime.now();
        // 12월 31일생 - 대부분의 경우 아직 생일이 안 지남
        final futureBirthday = DateTime(now.year - 20, 12, 31);
        if (now.month < 12 || (now.month == 12 && now.day < 31)) {
          expect(futureBirthday.age, 19);
        } else {
          expect(futureBirthday.age, 20);
        }
      });

      test('오늘이 생일인 경우 정확한 나이를 반환한다', () {
        final now = DateTime.now();
        final birthday = DateTime(now.year - 30, now.month, now.day);
        expect(birthday.age, 30);
      });
    });

    group('generation', () {
      test('나이를 10단위로 내림하여 세대를 반환한다', () {
        final now = DateTime.now();
        final birthday = DateTime(now.year - 25, 1, 1);
        final age = birthday.age;
        expect(birthday.generation, age ~/ 10 * 10);
      });
    });

    group('wd', () {
      test('올바른 요일 Weekday를 반환한다', () {
        // 2024-01-01은 월요일
        expect(DateTime(2024, 1, 1).wd, Weekday.monday);
        // 2024-01-02는 화요일
        expect(DateTime(2024, 1, 2).wd, Weekday.tuesday);
        // 2024-01-03은 수요일
        expect(DateTime(2024, 1, 3).wd, Weekday.wednesday);
        // 2024-01-04는 목요일
        expect(DateTime(2024, 1, 4).wd, Weekday.thursday);
        // 2024-01-05는 금요일
        expect(DateTime(2024, 1, 5).wd, Weekday.friday);
        // 2024-01-06은 토요일
        expect(DateTime(2024, 1, 6).wd, Weekday.saturday);
        // 2024-01-07은 일요일
        expect(DateTime(2024, 1, 7).wd, Weekday.sunday);
      });
    });
  });
}
