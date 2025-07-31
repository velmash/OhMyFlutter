import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:me_calculator/presentation/home/widgets/character_card.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).loadCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final characters = ref.watch(
      homeProvider.select((state) => state.characters),
    );
    final isLoading = ref.watch(
      homeProvider.select((state) => state.isLoading),
    );
    final errorMessage = ref.watch(
      homeProvider.select((state) => state.errorMessage),
    );
    final homeNotifier = ref.read(homeProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "주간 총 수익",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                characters.isEmpty ? "0 메소" : "22,333,444 메소",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Text(
                    "나의 캐릭터들",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // go_router로 캐릭터 추가 페이지로 이동
                      context.push('/add-character').then((_) {
                        // 돌아올 때 캐릭터 목록 재로드
                        homeNotifier.loadCharacters();
                      });
                    },
                    child: const Text(
                      "추가",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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
                          ElevatedButton(
                            onPressed: () => homeNotifier.loadCharacters(),
                            child: const Text('다시 시도'),
                          ),
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
                              onTap: () {
                                // go_router로 보스 설정 페이지로 이동 (캐릭터 ID 전달)
                                context
                                    .push('/boss-config/${character.ocid}')
                                    .then((_) {
                                      // 돌아올 때 캐릭터 목록 재로드
                                      homeNotifier.loadCharacters();
                                    });
                              },
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
