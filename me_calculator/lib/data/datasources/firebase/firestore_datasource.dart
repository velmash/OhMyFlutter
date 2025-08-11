import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:me_calculator/data/DTOs/my_character_dto.dart';
import 'package:me_calculator/domain/entities/my_character.dart';

abstract class FirestoreDatasource {
  Future<List<MyCharacter>> getUserCharacters(String userId);
}

class FirestoreDatasourceImpl implements FirestoreDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<MyCharacter>> getUserCharacters(String userId) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('characters')
          // .orderBy('createdAt', descending: true)
          .get(); // .snapshots() 대신 .get() 사용

      List<MyCharacter> characters = querySnapshot.docs
          .map(
            (doc) => MyCharacterDTO.fromJson(
              doc.data() as Map<String, dynamic>,
            ).toMyCharacter(),
          )
          .toList();

      characters.sort((a, b) {
        final totalMesoA = a.bosses.fold(0, (sum, boss) => sum + boss.meso);
        final totalMesoB = b.bosses.fold(0, (sum, boss) => sum + boss.meso);
        return totalMesoB.compareTo(totalMesoA);
      });

      return characters;
    } catch (e) {
      print('캐릭터 조회 실패: $e');
      return [];
    }
  }
}
