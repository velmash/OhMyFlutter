import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_calculator/features/add_character/add_character_view.dart';
import 'package:me_calculator/features/boss_config/views/boss_config_view.dart';
import 'package:me_calculator/presentation/home/widgets/character_card.dart';
import 'package:me_calculator/domain/entities/my_character.dart';
import 'package:me_calculator/providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _onTapAddCharacter(BuildContext context, WidgetRef ref) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddCharacterView())).then((_) {
      // ref를 사용하여 notifier의 메소드를 호출합니다.
      ref.read(homeProvider.notifier).loadCharacters();
    });
  }

  void _onTapCard(BuildContext context, MyCharacter myCharacter) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const BossConfigView()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    onTap: () => _onTapAddCharacter(context, ref), // ref 전달
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
                            child: CharacterCard(myCharacter: character, onTap: () => _onTapCard(context, character)),
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
