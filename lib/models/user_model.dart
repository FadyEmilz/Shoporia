import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
  final String userEmail, userName, userImage, userId;
  final Timestamp createdAt;
  final List userCart, userWish;

  UserModel({
    required this.userEmail,
    required this.userName,
    required this.userImage,
    required this.userId,
    required this.createdAt,
    required this.userCart,
    required this.userWish,
  });
}
