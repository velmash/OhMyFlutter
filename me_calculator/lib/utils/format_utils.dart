import 'package:intl/intl.dart';

String formatMeso(int meso) {
  if (meso == 0) {
    return '0 메소';
  }

  final formatter = NumberFormat('#,###'); // 콤마 포맷터

  String result = '';
  int billion = meso ~/ 100000000; // 억 단위
  int tenThousand = (meso % 100000000) ~/ 10000; // 만 단위
  int remainder = meso % 10000; // 나머지 (천 단위 이하)

  if (billion > 0) {
    result += '${formatter.format(billion)}억';
  }

  if (tenThousand > 0) {
    if (billion > 0) {
      result += ' ';
    }
    result += '${formatter.format(tenThousand)}만';
  } else if (billion > 0 && remainder > 0) {
    // 억 단위가 있고 만 단위가 0인데 나머지가 있으면 0만으로 표시
    result += ' 0만';
  }

  if (remainder > 0) {
    if (billion > 0 || tenThousand > 0) {
      result += ' ';
    }
    result += '${formatter.format(remainder)}';
  }

  return '$result 메소';
}
