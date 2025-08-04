import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_boss.freezed.dart';

@freezed
sealed class WeeklyBoss with _$WeeklyBoss {
  const factory WeeklyBoss({
    /// 서버와 통신할 때 사용하는 ID (예: "zakum_chaos")
    required String serverId,

    /// 화면에 표시될 이름 (예: "자쿰 카오스")
    required String displayName,

    /// 결정석 보상
    required int meso,
  }) = _WeeklyBoss;
}
