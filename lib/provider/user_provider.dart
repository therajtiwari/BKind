import 'package:bkind/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get getUser => _user;

  void refreshUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      print("user got");
      print(value.data()!["name"]);
      _user = UserModel.fromMap(value.data());
    });

    notifyListeners();
  }
}
