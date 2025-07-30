import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:me_calculator/domain/entities/my_character.dart';
import 'package:me_calculator/domain/usecases/get_character_usecase.dart';
import 'package:state_notifier/state_notifier.dart';

// 생성될 코드 파일명 지정
part 'home_provider.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<MyCharacter> characters,
    @Default(false) bool isLoading,
    @Default('') String error,
    String? errorMessage,
  }) = _HomeState;
}

class HomeNotifier extends StateNotifier<HomeState> {
  final GetCharacterUsecase useCase;

  HomeNotifier(this.useCase) : super(const HomeState());

  Future<void> loadCharacters() async {
    state = state.copyWith(isLoading: true, error: '');

    String userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    final result = await useCase.fetchCharacters(userId);

    result.fold(
      (failure) => state = state.copyWith(isLoading: false, error: failure.message, errorMessage: failure.message),
      (characters) => state = state.copyWith(isLoading: false, characters: characters),
    );
  }
}
