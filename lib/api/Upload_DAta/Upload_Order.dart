// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls, await_only_futures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled4/api/Get_product.dart';
import 'package:untitled4/notifire/Cartnotififire.dart';
import 'package:untitled4/notifire/employeeNotifire.dart';
import 'package:untitled4/notifire/productNotifire.dart';

import '../../model/Orde_Modelr.dart';

Upload_Order(
    Cartnotifire cart, ProductNotifire product, EmployeeNotifire emp) async {
  Order_Model_upload Order = Order_Model_upload();
  cart.Carts.forEach((element) async {
    CartModel f =
        await CartModel(element.Product!.id, element.amout, element.sum);
    Order.Ditell.add(f.toMap());
    await FirebaseFirestore.instance
        .collection('products')
        .doc(f.Product_ID)
        .update({'amount': FieldValue.increment(-f.amout!)});
  });
  Order.nameCutommer = cart.nameCutomer;
  Order.tel = cart.tel;
  Order.Employee_ID = emp.CurrentEmployee_loco!.id;
  Order.address = cart.address;
  Order.sumtotal = cart.sumltoal;
  Order.amouttotal = cart.amoultoal;
  CollectionReference rfn =
      await FirebaseFirestore.instance.collection('order');
  DocumentReference duoid = await rfn.add(Order.toMap());
  Order.id = duoid.id;
  duoid.set(Order.toMap()).then((value) async {
    cart.Carts = [];
    cart.price = [];
    cart.amoul = [];
    cart.amoultoal = 0;
    cart.sumltoal = 0;
    cart.nameCutomer = '';
    cart.address = '';
    cart.tel = 020;
    cart.Refresh();
    GetProduct(product);
  });
}
