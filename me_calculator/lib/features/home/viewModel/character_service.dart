import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:me_calculator/models/character.dart';

class CharacterService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 캐릭터 추가
  Future<void> addCharacter(String userId, MyCharacter character) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('characters')
          .doc(character.ocid) // ocid를 문서 ID로 사용
          .set(character.toMap());
    } catch (e) {
      print('캐릭터 추가 실패: $e');
      rethrow;
    }
  }

  // 특정 캐릭터 조회 (ocid로)
  Future<MyCharacter?> getCharacterByOcid(String userId, String ocid) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('users')
          .doc(userId)
          .collection('characters')
          .doc(ocid)
          .get();

      if (doc.exists) {
        return MyCharacter.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('캐릭터 조회 실패: $e');
      return null;
    }
  }

  // 캐릭터 삭제
  Future<void> deleteCharacter(String userId, String ocid) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('characters')
          .doc(ocid)
          .delete();
    } catch (e) {
      print('캐릭터 삭제 실패: $e');
      rethrow;
    }
  }

  // 실시간 캐릭터 목록 스트림
  Stream<List<MyCharacter>> getUserCharactersStream(String userId) {
    print('스트림 시작 - userId: $userId'); // 디버그용

    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('characters')
        .snapshots()
        .map((snapshot) {
          print('Firestore 스냅샷 받음: ${snapshot.docs.length}개 문서'); // 디버그용
          return snapshot.docs
              .map((doc) => MyCharacter.fromMap(doc.data()))
              .toList();
        });
  }

  Future<List<MyCharacter>> getUserCharacters(String userId) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('characters')
          // .orderBy('createdAt', descending: true)
          .get(); // .snapshots() 대신 .get() 사용

      return querySnapshot.docs
          .map((doc) => MyCharacter.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('캐릭터 조회 실패: $e');
      return [];
    }
  }
}
