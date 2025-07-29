import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:me_calculator/features/home/viewModel/character_service.dart';
import 'package:me_calculator/models/character.dart';

enum ViewState { idle, loading, error }

class HomeViewModel extends ChangeNotifier {
  final CharacterService _characterService = CharacterService();
  final String userId = FirebaseAuth.instance.currentUser?.uid ?? "";

  List<MyCharacter> _characters = [];
  List<MyCharacter> get characters => _characters;

  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  HomeViewModel() {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    _state = ViewState.loading;
    // Only notify listeners if the ViewModel is still active
    if (hasListeners) {
      notifyListeners();
    }

    try {
      _characters = await _characterService.getUserCharacters(userId);
      _state = ViewState.idle;
    } catch (e) {
      _state = ViewState.error;
      _errorMessage = e.toString();
    }

    // Only notify listeners if the ViewModel is still active
    if (hasListeners) {
      notifyListeners();
    }
  }
}
