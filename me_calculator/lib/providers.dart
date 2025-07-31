import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_calculator/data/datasources/firebase/firestore_datasource.dart';
import 'package:me_calculator/data/repositories/character_repository_impl.dart';
import 'package:me_calculator/domain/repositories/character_repository.dart';
import 'package:me_calculator/domain/usecases/get_character_usecase.dart';
import 'package:me_calculator/presentation/home/providers/home_provider.dart';

final storeDataSource = Provider<FirestoreDatasource>((ref) {
  return FirestoreDatasourceImpl();
});

final characterRepository = Provider<CharacterRepository>((ref) {
  return CharacterRepositoryImpl(ref.read(storeDataSource));
});

final characterProvider = Provider<GetCharacterUsecase>((ref) {
  return GetCharacterUsecase(ref.read(characterRepository));
});

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(ref.read(characterProvider));
});
