import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/api/searchData/search_product.dart';

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
              prefix: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Color(0xff7b7b7b),
                  ),
                  onPressed: () {
                    SearchProduct();
                  },
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
