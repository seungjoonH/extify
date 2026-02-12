import 'package:test/test.dart';
import 'package:extify/date_time/enum.dart';

void main() {
  group('Weekday', () {
    test('short - 첫 글자를 반환한다', () {
      expect(Weekday.monday.short, 'm');
      expect(Weekday.tuesday.short, 't');
      expect(Weekday.wednesday.short, 'w');
      expect(Weekday.thursday.short, 't');
      expect(Weekday.friday.short, 'f');
      expect(Weekday.saturday.short, 's');
      expect(Weekday.sunday.short, 's');
    });

    test('middle - 앞 3글자를 반환한다', () {
      expect(Weekday.monday.middle, 'mon');
      expect(Weekday.tuesday.middle, 'tue');
      expect(Weekday.wednesday.middle, 'wed');
      expect(Weekday.thursday.middle, 'thu');
      expect(Weekday.friday.middle, 'fri');
      expect(Weekday.saturday.middle, 'sat');
      expect(Weekday.sunday.middle, 'sun');
    });

    test('long - 전체 이름을 반환한다', () {
      expect(Weekday.monday.long, 'monday');
      expect(Weekday.tuesday.long, 'tuesday');
      expect(Weekday.wednesday.long, 'wednesday');
      expect(Weekday.thursday.long, 'thursday');
      expect(Weekday.friday.long, 'friday');
      expect(Weekday.saturday.long, 'saturday');
      expect(Weekday.sunday.long, 'sunday');
    });

    test('shortKorean - 한글 약칭을 반환한다', () {
      expect(Weekday.monday.shortKorean, '월');
      expect(Weekday.tuesday.shortKorean, '화');
      expect(Weekday.wednesday.shortKorean, '수');
      expect(Weekday.thursday.shortKorean, '목');
      expect(Weekday.friday.shortKorean, '금');
      expect(Weekday.saturday.shortKorean, '토');
      expect(Weekday.sunday.shortKorean, '일');
    });

    test('longKorean - 한글 전체명을 반환한다', () {
      expect(Weekday.monday.longKorean, '월요일');
      expect(Weekday.tuesday.longKorean, '화요일');
      expect(Weekday.wednesday.longKorean, '수요일');
      expect(Weekday.thursday.longKorean, '목요일');
      expect(Weekday.friday.longKorean, '금요일');
      expect(Weekday.saturday.longKorean, '토요일');
      expect(Weekday.sunday.longKorean, '일요일');
    });
  });
}
