import 'package:d_day_app/models/dday.dart';
import 'package:dart_date/dart_date.dart';

String getDDayMessage(String datetime, {String type}) {
  type = type ?? DDayType.DEFAULT.toString();

  final String datePattern = "yyyy-MM-dd";
  final String locale = "ko_KR";

  DateTime now = DateTime.now();
  now = DateTime(now.year, now.month, now.day);
  final dt = Date.parse(datetime, pattern: datePattern, locale: locale);
  final int days = dt.difference(now).inDays;

  final Map<String, Map<String, String>> _messageTable = {
    DDayType.DEFAULT.toString(): {
      "nowIsBefore": "D+${-1 * days}",
      "d-day": "D-DAY",
      "nowIsAfter": "D${-1 * days}"
    },
    DDayType.LOVE.toString(): {
      "nowIsBefore": "${-1 * days + 1}일째 연애중",
      "d-day": "오늘부터 1일",
      "nowIsAfter": "$days일 뒤에 고백"
    },
    DDayType.SOLDIER.toString(): {
      "nowIsBefore": "${-1 * days + 1}일째 민간인",
      "d-day": "나도 이제 민간인!",
      "nowIsAfter": "짬밥 $days일만 더 먹자"
    },
    DDayType.STUDY.toString(): {
      "nowIsBefore": "수능 끝. ${-1 * days}일 지났네",
      "d-day": "수능 대박! 시험 잘보고 와!",
      "nowIsAfter": "수능까지 $days일, 화이팅!"
    },
  };

  String text = "";
  if (days > 0) {
    text = _messageTable[type]["nowIsAfter"];
  } else if (days == 0) {
    text = _messageTable[type]["d-day"];
  } else {
    text = _messageTable[type]["nowIsBefore"];
  }

  return text;
}
