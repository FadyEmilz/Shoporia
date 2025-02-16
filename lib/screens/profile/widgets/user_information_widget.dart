import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shophoria/providers/user_provider.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var userProvider = Provider.of<UserProvider>(context);
    return Visibility(
      visible: user != null ? true : false,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, top: 8, bottom: 8),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.surface,
                      width: 3),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                      ))),
            ),
          ),
          Expanded(
              child: ListTile(
                title: Text(
                  userProvider.userModel!.userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(userProvider.userModel!.userEmail),
              ))
        ],
      ),
    );
  }
}
