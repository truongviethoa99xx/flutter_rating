//@dart=2.9
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenServices with ChangeNotifier{
  bool _isLoading = false;
  String _errorMessage;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> createWithEmailAndPassword(String email, String password) async {
    setLoading(true);
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      setLoading(false);
      return userCredential.user;
    } on SocketException {
      setLoading(false);
      setMessage("Không có kết nối mạng");
    } catch (e) {
      setLoading(false);
      setMessage(e.message);
    }
    notifyListeners();
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    setLoading(true);
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      setLoading(false);
      return userCredential.user;
    } on SocketException {
      setLoading(false);
      setMessage("Không có kết nối mạng");
    } catch (e) {
      setLoading(false);
      setMessage(e.message);
    }
    notifyListeners();
  }

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessage(message){
    _errorMessage = message;
    notifyListeners();
  }

  Stream<User> get user => _firebaseAuth.authStateChanges().map((event) => event);
}
