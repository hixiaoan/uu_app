




///分:秒
String durationTransform(int seconds){

  int m = (seconds/60).truncate();
  int s = seconds - m*60;
  if (s < 10){
    return "$m:0$s";
  }else{
    return "$m:$s";
  }
}
String formatDuration(Duration duration){

  int m = duration.inMinutes;
  int s = duration.inSeconds;
  return "$m:$s";
}


/**
 * 日期工具
 */
class DateUtils {
  /**
   * 计算两个日期相差多少年
   */
  static int daysBetweenYear(DateTime a, DateTime b) {
    int v = a.millisecondsSinceEpoch - b.millisecondsSinceEpoch;
    return v ~/ 86400000 * 30 * 12;
  }

  /**
   * 计算两个日期相差多少月
   */
  static int daysBetweenMonth(DateTime a, DateTime b) {
    int v = a.millisecondsSinceEpoch - b.millisecondsSinceEpoch;
    return v ~/ 86400000 * 30;
  }

  /**
   * 计算两个日期相差多少天
   */
  static int daysBetweenDay(DateTime a, DateTime b) {
    int v = a.millisecondsSinceEpoch - b.millisecondsSinceEpoch;
    return v ~/ 86400000;
  }

  /**
   * 计算两个日期相差多少分钟
   */
  static int daysBetweenMin(DateTime a, DateTime b) {
    int v = a.millisecondsSinceEpoch - b.millisecondsSinceEpoch;
    return v ~/ 60000;
  }

  /**
   * 计算两个日期相差多少秒
   */
  static int daysBetweenSecond(DateTime a, DateTime b) {
    int v = a.millisecondsSinceEpoch - b.millisecondsSinceEpoch;
    return v ~/ 1000;
  }

  /**
   * 计算两个日期相差多少毫秒
   */
  static int daysBetweenMillSecond(DateTime a, DateTime b) {
    int v = a.millisecondsSinceEpoch - b.millisecondsSinceEpoch;
    return v;
  }

  /**
   * 获取当天（不足两位，拼0处理）
   * space 需要拼接日期的字段
   */
  static String getYYYYMMDD(DateTime dateTime, String space) {
    String year = dateTime.year.toString();
    String month = dateTime.month.toString().length == 1
        ? "0${dateTime.month}"
        : dateTime.month.toString();
    String day = dateTime.day.toString().length == 1
        ? "0${dateTime.day}"
        : dateTime.day.toString();
    return "${year}${space}${month}${space}${day}";
  }

  /**
   * 获取当天（不足两位，拼0处理）
   * space 需要拼接日期的字段
   */
  static String getYYYYMMDDHHMMSS(DateTime dateTime, String space1, String space2,) {
    String year = dateTime.year.toString();
    String month = dateTime.month.toString().length == 1
        ? "0${dateTime.month}"
        : dateTime.month.toString();
    String day = dateTime.day.toString().length == 1
        ? "0${dateTime.day}"
        : dateTime.day.toString();
    String hour = dateTime.hour.toString().length == 1
        ? "0${dateTime.hour}"
        : dateTime.hour.toString();
    String minute = dateTime.minute.toString().length == 1
        ? "0${dateTime.minute}"
        : dateTime.minute.toString();
    String second = dateTime.second.toString().length == 1
        ? "0${dateTime.second}"
        : dateTime.second.toString();
    return "${year}${space1}${month}${space1}${day} ${hour}${space2}${minute}${space2}${second}";
  }

  /**
   * 获取昨天
   */
  static String getYesterDayYYYYMMDD(DateTime dateTime) {
    DateTime yesterDay = new DateTime.fromMillisecondsSinceEpoch(
        dateTime.millisecondsSinceEpoch - (24 * 60 * 60 * 1000));
    return getYYYYMMDD(yesterDay, "-");
  }

  /**
   * 获取前天
   */
  static String getDayBeforeYesterdayDayYYYYMMDD(DateTime dateTime) {
    DateTime yesterDay = new DateTime.fromMillisecondsSinceEpoch(
        dateTime.millisecondsSinceEpoch - (2 * 24 * 60 * 60 * 1000));
    return getYYYYMMDD(yesterDay, "-");
  }

  /**
   * 获取明天
   */
  static String getTomorrowDayYYYYMMDD(DateTime dateTime) {
    DateTime yesterDay = new DateTime.fromMillisecondsSinceEpoch(
        dateTime.millisecondsSinceEpoch + (24 * 60 * 60 * 1000));
    return getYYYYMMDD(yesterDay, "-");
  }

  /**
   * 获取某天
   *
   * index  需要几天后，就传几
   */
  static String getSomeDayYYYYMMDD(DateTime dateTime, int index) {
    DateTime yesterDay = new DateTime.fromMillisecondsSinceEpoch(
        dateTime.millisecondsSinceEpoch + (index * 24 * 60 * 60 * 1000));
    return getYYYYMMDD(yesterDay, "-");
  }

  /**
   * 获取后天
   */
  static String getTomorrowAcquiredYYYYMMDD(DateTime dateTime) {
    DateTime yesterDay = new DateTime.fromMillisecondsSinceEpoch(
        dateTime.millisecondsSinceEpoch + (2 * 24 * 60 * 60 * 1000));
    return getYYYYMMDD(yesterDay, "-");
  }

  /**
   * 获取本周开始
   */
  static String getWeekFirstDayYYYYMMDD(DateTime dateTime) {
    int current = dateTime.weekday;
    DateTime firstDay = new DateTime.fromMillisecondsSinceEpoch(
        dateTime.millisecondsSinceEpoch -
            (24 * 60 * 60 * 1000 * (current - 1)));
    return getYYYYMMDD(firstDay, "-");
  }

  /**
   * 获取本周结束
   */
  static String getWeekLastDayYYYYMMDD(DateTime dateTime) {
    int current = dateTime.weekday;
    DateTime lastDay = new DateTime.fromMillisecondsSinceEpoch(
        dateTime.millisecondsSinceEpoch +
            (24 * 60 * 60 * 1000 * (7 - current)));
    return getYYYYMMDD(lastDay, "-");
  }

  /**
   * 获取上周开始
   */
  static String getLastWeekFirstDayYYYYMMDD(DateTime dateTime) {
    int current = dateTime.weekday;
    DateTime firstDay = new DateTime.fromMillisecondsSinceEpoch(
        dateTime.millisecondsSinceEpoch -
            (24 * 60 * 60 * 1000 * (current - 1)));
    DateTime day = new DateTime.fromMillisecondsSinceEpoch(
        firstDay.millisecondsSinceEpoch - (24 * 60 * 60 * 1000 * 7));
    return getYYYYMMDD(day, "-");
  }

  /**
   * 获取上周结束
   */
  static String getLastWeekLastDayYYYYMMDD(DateTime dateTime) {
    int current = dateTime.weekday;
    DateTime lastDay = new DateTime.fromMillisecondsSinceEpoch(
        dateTime.millisecondsSinceEpoch +
            (24 * 60 * 60 * 1000 * (7 - current)));
    DateTime day = new DateTime.fromMillisecondsSinceEpoch(
        lastDay.millisecondsSinceEpoch - (24 * 60 * 60 * 1000 * 7));
    return getYYYYMMDD(day, "-");
  }

  /**
   * 获取本月第一天
   */
  static String getMonthFirstDayYYYYMMDD(DateTime dateTime, String space) {
    String year = "${DateTime.now().year}";
    String month = "${DateTime.now().month}".length == 1
        ? "0${DateTime.now().month}"
        : "${DateTime.now().month}";
    return "${year}${space}${month}${space}01";
  }

  /**
   * 获取本月最后一天
   */
  static String getMonthLastDayYYYYMMDD(DateTime dateTime, String space) {
    String year = "${DateTime.now().year}";
    String month = "${DateTime.now().month}".length == 1
        ? "0${DateTime.now().month}"
        : "${DateTime.now().month}";
    int d = getDayCounts(DateTime.now().month);
    return "${year}${space}${month}${space}${d}";
  }

  /**
   * 获取周几
   */
  static String getWeekday(DateTime dateTime) {
    String weekday;
    switch (dateTime.weekday) {
      case 1:
        weekday = '星期一';
        break;
      case 2:
        weekday = '星期二';
        break;
      case 3:
        weekday = '星期三';
        break;
      case 4:
        weekday = '星期四';
        break;
      case 5:
        weekday = '星期五';
        break;
      case 6:
        weekday = '星期六';
        break;
      case 7:
        weekday = '星期日';
        break;
      default:{
        weekday = "没找到";
      }
        break;
    }
    return weekday;
  }

  /**
   * 获取一个月有多少天
   */
  static int getDayCounts(int month) {
    int year = DateTime.now().year;
    int end = 0;
    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
      end = 31;
    } else if (month == 2) {
      if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) {
        end = 29;
      } else {
        end = 28;
      }
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
      end = 30;
    }
    return end;
  }
}
