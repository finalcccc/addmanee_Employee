// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/product_Model.dart';
import '../../notifire/productNotifire.dart';

Future SearchProduct( ProductNotifire pro) async {
  List<product_Model> _Product = [];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('products')
      .where(
        'nameProduct',
        isGreaterThanOrEqualTo: pro.shech.toString()
      )
      .get();
  rfn.docs.forEach(
    (data) {
      String nameProduct = data['nameProduct'].toString();
    print(data.data());
      if (nameProduct[0] == 'ນ') {
          product_Model p = product_Model.formMap(data.data());
        _Product.add(p);
      } else
        if(nameProduct.isNotEmpty == pro.shech.isNotEmpty){
         _Product.clear();
        product_Model p = product_Model.formMap(data.data());
        _Product.add(p);
      }else if(nameProduct[1]=='ນ'){
       product_Model p = product_Model.formMap(data.data());
        _Product.add(p);
      }
    },
  );
  pro.Product =_Product;
  pro.RefreshProduct();
}
