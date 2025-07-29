import 'package:flutter/material.dart';
import 'package:me_calculator/features/add_character/add_character_view.dart';
import 'package:me_calculator/features/boss_config/views/boss_config_view.dart';
import 'package:me_calculator/features/home/views/widgets/character_card.dart';
import 'package:me_calculator/models/character.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MyCharacter> myCharacters = [
    MyCharacter(
      nickName: "수원오피스",
      imagePath:
          "https://open.api.nexon.com/static/maplestory/character/look/AFLJBGPHNGLMOBKANJGJDJHGAILFNHAOBPAMEEEKFMNDJAOOJJLODAPLAFPDKPPCFIHLBJLHAPLBJKMAKMMEJHHNHDKJILCKOGMCAONOPNLCNCKANOEECBAIAMGADABFDPLKIEGPLIGHCJKCOJDIAKEJOKJCMOBPDHCNGCOHBPOKABFAONFLLIJCFJKOOKPKAKIGLKMDHBLCKILNDAIBDDLIHKHEFKFOBHPMPEFNIECIFHIAFGAFMOKBDPAGLCHK",
      ocid: "bbfee59e10f70371c025e6091e577c3aefe8d04e6d233bd35cf2fabdeb93fb0d",
    ),

    MyCharacter(
      nickName: "언주보마",
      imagePath:
          "https://open.api.nexon.com/static/maplestory/character/look/FEEFPOOCEIFHHPJFCMMMMNHICBACCKMHOBHJFCBCCJIANNOCMCKIMPLFLJENCAOGLOPONFNMCPBAGJCJNOIHPNFEHHBOBOLHBDDEPHDKJJFOPHMKDFLMDEDHIBJBPADLNKAAFNJJBGCLKGHBCMPOMMCFJIHNBKCDHHNGIICHNDBLHLABDDHAPDDGIPIBKGFMHFNAKJFONHGCKNIMOPFKGLIHOLCGMCLIDPGANGPGGNJLIJJNGGKDNLOGEDKMEIOK",
      ocid: "3aca53cb9f42fd665e0795494daa33f1efe8d04e6d233bd35cf2fabdeb93fb0d",
    ),
  ];

  void _onTapAddCharacter() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCharacterView()),
    );
  }

  void _onTapCard(MyCharacter myCharacter) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BossConfigView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                spacing: 0,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "주간 총 수익",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),

                  Text(
                    "22,333,444 메소",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),

                  SizedBox(height: 30),

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

                  SizedBox(height: 10),

                  if (myCharacters.isEmpty)
                    Text("등록된 캐릭터가 없습니다.\n상단의 버튼을 이용해 캐릭터를 등록해주세요.")
                  else
                    for (var character in myCharacters) ...[
                      CharacterCard(
                        myCharacter: character,
                        onTap: () => _onTapCard(character),
                      ),
                      SizedBox(height: 10),
                    ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
