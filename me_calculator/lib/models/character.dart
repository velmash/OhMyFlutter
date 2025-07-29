class MyCharacter {
  final String nickName;
  final String imagePath;
  final String ocid;

  MyCharacter({
    required this.nickName,
    required this.imagePath,
    required this.ocid,
  });

  Map<String, dynamic> toMap() {
    return {'ocid': ocid, 'nickName': nickName, 'imagePath': imagePath};
  }

  factory MyCharacter.fromMap(Map<String, dynamic> map) {
    return MyCharacter(
      ocid: map['ocid'] ?? '',
      nickName: map['nickName'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }
}
