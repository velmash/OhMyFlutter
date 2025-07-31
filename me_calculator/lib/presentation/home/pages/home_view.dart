import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_calculator/presentation/add_character/add_character_view.dart';
import 'package:me_calculator/presentation/boss_config/views/boss_config_view.dart';
import 'package:me_calculator/presentation/home/widgets/character_card.dart';
import 'package:me_calculator/domain/entities/my_character.dart';
import 'package:me_calculator/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // 위젯이 처음 빌드될 때 캐릭터 목록을 로드합니다.
    // postFrameCallback을 사용하여 첫 프레임이 렌더링된 후에 안전하게 호출합니다.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).loadCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Riverpod의 select를 사용하여 상태의 특정 부분만 수신(watch)합니다.
    final characters = ref.watch(homeProvider.select((state) => state.characters));
    final isLoading = ref.watch(homeProvider.select((state) => state.isLoading));
    // homeState에 errorMessage: String? 필드가 있다고 가정합니다.
    final errorMessage = ref.watch(homeProvider.select((state) => state.errorMessage));
    final homeNotifier = ref.read(homeProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("주간 총 수익", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              Text(
                characters.isEmpty ? "0 메소" : "22,333,444 메소", // `characters` 사용
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Text("나의 캐릭터들", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => ref.navigateToAddCharacter(context),
                    child: const Text(
                      "추가",
                      style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : errorMessage != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(errorMessage),
                          const SizedBox(height: 10),
                          ElevatedButton(onPressed: () => homeNotifier.loadCharacters(), child: const Text('다시 시도')),
                        ],
                      )
                    : characters.isEmpty
                    ? const Text("등록된 캐릭터가 없습니다.\n상단의 버튼을 이용해 캐릭터를 등록해주세요.")
                    : ListView.builder(
                        itemCount: characters.length,
                        itemBuilder: (context, index) {
                          final character = characters[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CharacterCard(
                              myCharacter: character,
                              onTap: () => ref.navigateToBossConfig(context, character),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension HomeNavigator on WidgetRef {
  void navigateToAddCharacter(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddCharacterView())).then((_) {
      // AddCharacterView에서 돌아왔을 때 캐릭터 목록을 다시 로드합니다.
      read(homeProvider.notifier).loadCharacters();
    });
  }

  void navigateToBossConfig(BuildContext context, MyCharacter myCharacter) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const BossConfigView())).then((_) {
      // BossConfigView에서 돌아왔을 때 캐릭터 목록을 다시 로드합니다.
      read(homeProvider.notifier).loadCharacters();
    });
  }
}
