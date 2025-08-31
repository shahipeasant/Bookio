import 'dart:async';
import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';



class AuthController extends GetxController{
  static AuthController get to => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User?> firebaseUser = Rxn<User?>();

  User? get user => firebaseUser.value;
  bool get isLoggedIn => user != null;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.value = _auth.currentUser; // seed
    firebaseUser.bindStream(_auth.authStateChanges()); // bind stream
  }


  Stream<User?> get authStateChanges => _auth.authStateChanges();

  //Sign in
  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    // Get.offAllNamed('/main'); // or just rely on Root widget
  }


  //Sign out
  Future<void> signOut() async {
    await _auth.signOut();
    // Get.offAllNamed('/login');
  }

  //create account
  Future<void> register(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    // Get.offAllNamed('/main');
  }

  //reset password
  Future<void> resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //update username
  Future<void> updateUsername({required String username}) async {
    await user!.updateDisplayName(username);
    await user!.reload();
  }

  //delete account
  Future<void> deleteAccount({
        required String email,
        required String password}
      ) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    await user!.reauthenticateWithCredential(credential);
    await user!.delete();
    await _auth.signOut();
  }

  //reset password with email and password
  Future<void> updatePassword({
    required String email,
    required String password,
  }) async{
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    await user!.reauthenticateWithCredential(credential);
    await user!.updatePassword(password);
  }
}