// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/product_Model.dart';

SearchProduct() async {
  List<product_Model> _Product = [];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('products')
      .where(
        'nameProduct',
        isGreaterThanOrEqualTo: 'ເປບຊີ',
      )
      .get();
  rfn.docs.forEach(
    (data) {
      String nameProduct = data['nameProduct'].toString().substring(1, 2);
      if (nameProduct == 'ປ') {
        print(data["nameProduct"]);
      } else {}
    },
  );
}
