import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shophoria/app/appWidgets/custom_text.dart';
import 'package:shophoria/controllers/dash_board_controller.dart';
import 'package:shophoria/core/assets_managers.dart';

class SingleDash extends StatefulWidget {
  const SingleDash({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  State<SingleDash> createState() => _SingleDashState();
}

class _SingleDashState extends State<SingleDash> {

  DashBoardController controller = DashBoardController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        controller.setNavigators(text: widget.text, context: context);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: ThemeData().primaryColor,),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70,width: 70,
              child: Image.asset(widget.image,fit: BoxFit.fill,),
              ),
              SizedBox(height: 10,),
              CustomText(text: widget.text, fontSize: 20)
            ],
          ),
        ),
        width: size.width*.25,height: size.height*.2,
      ),
    );
  }
}
