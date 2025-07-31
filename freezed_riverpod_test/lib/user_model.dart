import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_riverpod_test/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({required int id, required String name, required String email, required bool isActive}) =
      _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

extension UserModelMapper on UserModel {
  User toEntity() => User(id: id, name: name, email: email, isActive: isActive);
}
