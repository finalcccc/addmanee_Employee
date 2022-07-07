import 'package:flutter/material.dart';

Dialog_Cire(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      ),
    ),
  );
}