import 'package:flutter/cupertino.dart';

import '../../../../core/assets_managers.dart';

class ForgotPassImageWidget extends StatelessWidget {
  const ForgotPassImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: SizedBox(
          height: size.height * .3,
          width: size.width * .6,
          child: Image.asset(
            AssetsManagers.forgot_password,
            fit: BoxFit.cover,
          ),
        ));
  }
}
