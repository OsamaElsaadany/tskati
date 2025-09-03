import 'package:flutter/material.dart';

pushto(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (cnontext) => screen));

}

pushrplc(BuildContext context, Widget screen) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (cnontext) => screen));
}

pop(BuildContext context, Widget screen) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => screen));
}

pushandrm(BuildContext context, Widget screen) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => screen),
    (route) => false,
  );
}
