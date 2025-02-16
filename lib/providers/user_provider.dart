import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shophoria/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? userModel;
  UserModel? get getUserModel {
    return userModel;
  }

  Future<UserModel?> fetchUserInfo() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user == null) {
      return null;
    }
    final uid = user.uid;
    try {
      final userInfo =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      final userInfoDict = userInfo.data();
      userModel = UserModel(
          userEmail: userInfo.get("userEmail"),
          userName: userInfo.get("userName"),
          userImage: userInfo.get("userImage"),
          userId: userInfo.get("userId"),
          createdAt: userInfo.get("createdAt"),
          userCart: userInfoDict!.containsKey("userCart")
              ? userInfo.get("userCart")
              : [],
          userWish: userInfoDict!.containsKey("userWish")
              ? userInfo.get("userWish")
              : []);
      return userModel;
    } on FirebaseException catch (error) {
      throw error.message.toString();
    } catch (error) {
      rethrow;
    }
  }
}
