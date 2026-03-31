import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;

  void setUser(UserModel user) {
    _currentUser = user;
    notifyListeners(); // This tells the UI to update (e.g., show "Welcome, [Name]")
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}