
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:moviesandtvs/core/shared/colors.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });

Widget defaultButton({
  double width = double.infinity,
  required double height,
  Color color = buttonColor,
  required Function onPress,
  required String text,
  double radius = 0.0,
  bool isUpper = false,
}) =>
    MaterialButton(
      color: primaryColor,
      minWidth: width,
      height: height,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(27.0))),
      onPressed: () {
        onPress();
      },
      child: Text(
        isUpper ? text.toUpperCase() : text,
        style: const TextStyle(color: Colors.white, fontSize: 25),
      ),
    );

Widget TextForm({
  // ignore: non_constant_identifier_names
  required var Con,
  var type = TextInputType.text,
  var lable,
  var prefixIcon,
  @required var val,
  var obscureText = false,
  var suffixIcon,
  var fun_su,
  var ontap,
  var onchange,
  var onsubmit,
  var enable = true,
}) =>
    TextFormField(
      enabled: enable,
      onFieldSubmitted: onsubmit,
      onTap: ontap,
      controller: Con,
      onChanged: onchange,
      keyboardType: type,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: lable,
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: fun_su, icon: suffixIcon)
            : null,
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return val;
        } else {
          return null;
        }
      },
    );

enum toaststate { error, success, warning }
Color ToastSort(toaststate state) {
  Color color;
  switch (state) {
    case toaststate.success:
      color = Colors.green;
      break;
    case toaststate.error:
      color = Colors.red;
      break;
    case toaststate.warning:
      color = Colors.yellow;
      break;
  }
  return color;
}

void ShowToastFun({required String msg, required toaststate Sort}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ToastSort(Sort),
        textColor: Colors.white,
        fontSize: 16.0);
// Widget defalutAppbar({required var context, var title,var Action}) =>



// Widget defaultDrawer(context) => Container(
//       padding: EdgeInsets.all(0),
//       width: 243,
//       child: Drawer(
//         child: Column(
//           children: [
//             const MyDrawer(),
//             const MyDrawer().myDrawerList(context),
//           ],
//         ),
//       ),
//     );

PreferredSizeWidget defaultAppBar(context, String title, isFirst) => AppBar(
      title: Text(title,style: TextStyle(fontFamily: "Girls"),),
      backgroundColor: primaryColor,
      actions: [
        if (!isFirst)
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward))
      ],
    );
