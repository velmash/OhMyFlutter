import 'package:me_calculator/domain/entities/weekly_boss.dart';

// --- Data Layer에 숨겨진 내부 데이터 및 로직 ---

// 1. 난이도 정의 (비공개 enum)
enum _Difficulty {
  easy(name: 'easy', displayName: '이지'),
  normal(name: 'normal', displayName: '노말'),
  hard(name: 'hard', displayName: '하드'),
  chaos(name: 'chaos', displayName: '카오스'),
  extreme(name: 'extreme', displayName: '익스트림');

  const _Difficulty({required this.name, required this.displayName});
  final String name;
  final String displayName;
}

// 2. 보스 데이터 정의 (비공개 enum)
enum _Boss {
  zakum(
    name: 'zakum',
    displayName: '자쿰',
    rewards: {_Difficulty.chaos: 8080000},
  ),
  magnus(
    name: 'magnus',
    displayName: '매그너스',
    rewards: {_Difficulty.hard: 8560000},
  ),
  hilla(name: 'hilla', displayName: '힐라', rewards: {_Difficulty.hard: 5750000}),
  papulatus(
    name: 'papulatus',
    displayName: '파풀라투스',
    rewards: {_Difficulty.chaos: 17300000},
  ),
  pierre(
    name: 'pierre',
    displayName: '피에르',
    rewards: {_Difficulty.chaos: 8170000},
  ),
  banban(
    name: 'banban',
    displayName: '반반',
    rewards: {_Difficulty.chaos: 8150000},
  ),
  bloodyQueen(
    name: 'bloodyQueen',
    displayName: '블러디 퀸',
    rewards: {_Difficulty.chaos: 8140000},
  ),
  vellum(
    name: 'vellum',
    displayName: '벨룸',
    rewards: {_Difficulty.chaos: 9280000},
  ),
  pinkbin(
    name: 'pinkbin',
    displayName: "핑크빈",
    rewards: {_Difficulty.chaos: 6580000},
  ),
  cygnus(
    name: 'cygnus',
    displayName: '시그너스',
    rewards: {_Difficulty.easy: 4550000, _Difficulty.normal: 7500000},
  ),
  lotus(
    name: 'su',
    displayName: '스우',
    rewards: {
      _Difficulty.normal: 22000000,
      _Difficulty.hard: 77400000,
      _Difficulty.extreme: 549000000,
    },
  ),
  damien(
    name: 'damien',
    displayName: '데미안',
    rewards: {_Difficulty.normal: 23000000, _Difficulty.hard: 73500000},
  ),
  gudianSlime(
    name: 'gudian',
    displayName: '가엔슬',
    rewards: {_Difficulty.normal: 33500000, _Difficulty.chaos: 113500000},
  ),
  lucid(
    name: 'lucid',
    displayName: '루시드',
    rewards: {
      _Difficulty.easy: 39200000,
      _Difficulty.normal: 46900000,
      _Difficulty.hard: 94500000,
    },
  ),
  will(
    name: 'will',
    displayName: '윌',
    rewards: {
      _Difficulty.easy: 42500000,
      _Difficulty.normal: 54100000,
      _Difficulty.hard: 116000000,
    },
  ),
  dusk(
    name: 'dusk',
    displayName: '더스크',
    rewards: {_Difficulty.normal: 57900000, _Difficulty.chaos: 105000000},
  ),
  jinHilla(
    name: 'jinHilla',
    displayName: '진 힐라',
    rewards: {_Difficulty.normal: 107000000, _Difficulty.hard: 160000000},
  ),
  dunkel(
    name: 'dunkel',
    displayName: '듄켈',
    rewards: {_Difficulty.normal: 62500000, _Difficulty.hard: 142000000},
  ),
  seren(
    name: 'seren',
    displayName: '세렌',
    rewards: {
      _Difficulty.normal: 295000000,
      _Difficulty.hard: 440000000,
      _Difficulty.extreme: 2420000000,
    },
  ),
  kalos(
    name: 'kalos',
    displayName: '칼로스',
    rewards: {
      _Difficulty.easy: 345000000,
      _Difficulty.normal: 510000000,
      _Difficulty.chaos: 1120000000,
      _Difficulty.extreme: 2700000000,
    },
  ),
  kaling(
    name: 'kaling',
    displayName: '카링',
    rewards: {
      _Difficulty.easy: 381000000,
      _Difficulty.normal: 595000000,
      _Difficulty.chaos: 1310000000,
      _Difficulty.extreme: 3150000000,
    },
  ),
  limbo(
    name: 'limbo',
    displayName: '림보',
    rewards: {_Difficulty.normal: 900000000, _Difficulty.hard: 1930000000},
  ),
  baldrix(
    name: 'baldrix',
    displayName: '발드릭스',
    rewards: {_Difficulty.normal: 1200000000, _Difficulty.hard: 2160000000},
  ),
  blackMage(
    name: 'blackMage',
    displayName: '검은 마법사',
    rewards: {_Difficulty.hard: 120000000000, _Difficulty.extreme: 15000000000},
  );

  const _Boss({
    required this.name,
    required this.displayName,
    required this.rewards,
  });
  final String name;
  final String displayName;
  final Map<_Difficulty, int> rewards;
}

// 3. 서버 문자열을 WeeklyBoss 모델로 변환하는 공개 헬퍼 함수
WeeklyBoss weeklyBossFromServerId(String serverId) {
  final parts = serverId.split('_');
  if (parts.length != 2) {
    return WeeklyBoss(serverId: serverId, displayName: '알 수 없는 보스', meso: 0);
  }

  final bossName = parts[0];
  final difficultyName = parts[1];

  final boss = _Boss.values.firstWhere(
    (b) => b.name == bossName,
    orElse: () => _Boss.zakum,
  );
  final difficulty = _Difficulty.values.firstWhere(
    (d) => d.name == difficultyName,
    orElse: () => _Difficulty.normal,
  );

  return WeeklyBoss(
    serverId: serverId,
    displayName: '${difficulty.displayName} ${boss.displayName}',
    meso: boss.rewards[difficulty] ?? 0,
  );
}
