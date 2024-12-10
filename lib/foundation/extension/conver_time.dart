class TimeAgo {
  static String timeAgoSinceDate(DateTime notificationDate,
      {bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(notificationDate);
    if (difference.inDays > 365) {
      return "last year";
    } else if ((difference.inDays / 30).floor() >= 1) {
      return '${(difference.inDays / 30).floor()} ${"tháng"}';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return '${(difference.inDays / 7).floor()} ${"tuần"}';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} ${"ngày"}';
    } else if (difference.inDays >= 1) {
      return '1 ${"ngày"}';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} ${"giờ"}';
    } else if (difference.inHours >= 1) {
      return '1  ${"giờ"}';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} ${"phút"}';
    } else if (difference.inMinutes >= 1) {
      return '1 ${"phút"}';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} ${"giây"}';
    } else {
      return "bây giờ";
    }
  }
}
