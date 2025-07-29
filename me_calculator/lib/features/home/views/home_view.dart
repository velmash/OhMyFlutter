import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:me_calculator/features/add_character/add_character_view.dart';
import 'package:me_calculator/features/boss_config/views/boss_config_view.dart';
import 'package:me_calculator/features/home/viewmodels/character_service.dart';
import 'package:me_calculator/features/home/views/widgets/character_card.dart';
import 'package:me_calculator/models/character.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CharacterService _characterService = CharacterService();
  final String userId = FirebaseAuth.instance.currentUser?.uid ?? "";

  // Future 변수 추가
  late Future<List<MyCharacter>> _charactersFuture;

  @override
  void initState() {
    super.initState();
    _loadCharacters(); // 초기 로드
  }

  // 캐릭터 로드 메서드
  void _loadCharacters() {
    print('_loadCharacters 호출됨');
    _charactersFuture = _characterService.getUserCharacters(userId);
    _charactersFuture
        .then((characters) {
          print(userId);
          print('캐릭터 조회 완료: ${characters.length}개');
          for (var char in characters) {
            print('캐릭터: ${char.nickName}');
          }
        })
        .catchError((error) {
          print('캐릭터 조회 에러: $error');
        });
  }

  /// 캐릭터 추가 화면 이동
  void _onTapAddCharacter() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddCharacterView()),
    ).then((_) {
      // 추가 후 데이터 새로고침
      setState(() {
        _loadCharacters();
      });
    });
  }

  /// 캐릭터 카드 탭 시 보스 설정 화면 이동
  void _onTapCard(MyCharacter myCharacter) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BossConfigView()),
    );
  }

  // 새로고침 메서드 (필요시 사용)
  Future<void> _refreshCharacters() async {
    setState(() {
      _loadCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: FutureBuilder<List<MyCharacter>>(
            future: _charactersFuture,
            builder: (context, snapshot) {
              // 로딩 상태
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              // 에러 상태
              if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('데이터를 불러오는 중 오류가 발생했습니다.'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _refreshCharacters,
                      child: const Text('다시 시도'),
                    ),
                  ],
                );
              }

              // 데이터 없음
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "주간 총 수익",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "0 메소",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "나의 캐릭터들",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: _onTapAddCharacter,
                          child: Text(
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
                    const Text("등록된 캐릭터가 없습니다.\n상단의 버튼을 이용해 캐릭터를 등록해주세요."),
                  ],
                );
              }

              // 데이터 있음
              final myCharacters = snapshot.data!;

              return RefreshIndicator(
                // 당겨서 새로고침 추가
                onRefresh: _refreshCharacters,
                child: SingleChildScrollView(
                  physics:
                      const AlwaysScrollableScrollPhysics(), // RefreshIndicator를 위해 필요
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "주간 총 수익",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "22,333,444 메소",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "나의 캐릭터들",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: _onTapAddCharacter,
                            child: Text(
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
                      ...myCharacters.map(
                        (character) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: CharacterCard(
                            myCharacter: character,
                            onTap: () => _onTapCard(character),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
