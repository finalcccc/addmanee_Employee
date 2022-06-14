import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
WidgetSearch({String? label}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(40),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: CupertinoTextField(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
              placeholder: label,
              prefix: const Padding(
                padding: EdgeInsets.only(left: 14),
                child: Icon(
                  Icons.search,
                  color: Color(0xff7b7b7b),
                ),
              ),
              decoration: BoxDecoration(
                color: const Color(0xfff7f7f7),
                borderRadius: BorderRadius.circular(40),
              ),
              style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
