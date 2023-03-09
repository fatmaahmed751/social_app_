import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

Widget defaultAppBar({
  required BuildContext context,
  String title='',
  List<Widget>?actions,
})=> AppBar(
  backgroundColor: Colors.white,
  elevation: 0.0,
  leading: IconButton(
    color: Colors.black,
    onPressed: (){
      Navigator.pop(context);
    },
    icon:Icon((Icons.arrow_back_ios),
      size: 20,
    ),
  ),
  titleSpacing: 5.0,
  title: Text(title,
  style: TextStyle(
    color: Colors.black,
    fontSize: 17.0
  ),),

  actions: actions,
);
