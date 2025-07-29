import 'package:flutter/material.dart';
import 'package:me_calculator/features/add_character/add_character_view.dart';
import 'package:me_calculator/features/boss_config/views/boss_config_view.dart';
import 'package:me_calculator/features/home/viewModel/home_view_model.dart';
import 'package:me_calculator/features/home/views/widgets/character_card.dart';
import 'package:me_calculator/models/character.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onTapAddCharacter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddCharacterView()),
    ).then((_) {
      Provider.of<HomeViewModel>(context, listen: false).fetchCharacters();
    });
  }

  void _onTapCard(BuildContext context, MyCharacter myCharacter) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BossConfigView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

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
                viewModel.characters.isEmpty ? "0 메소" : "22,333,444 메소",
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
                    onTap: () => _onTapAddCharacter(context),
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
                child: Consumer<HomeViewModel>(
                  builder: (context, viewModel, child) {
                    if (viewModel.state == ViewState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (viewModel.state == ViewState.error) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(viewModel.errorMessage ?? '오류가 발생했습니다.'),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => viewModel.fetchCharacters(),
                            child: const Text('다시 시도'),
                          ),
                        ],
                      );
                    }

                    if (viewModel.characters.isEmpty) {
                      return const Text(
                        "등록된 캐릭터가 없습니다.\n상단의 버튼을 이용해 캐릭터를 등록해주세요.",
                      );
                    }

                    return ListView.builder(
                      itemCount: viewModel.characters.length,
                      itemBuilder: (context, index) {
                        final character = viewModel.characters[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: CharacterCard(
                            myCharacter: character,
                            onTap: () => _onTapCard(context, character),
                          ),
                        );
                      },
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
