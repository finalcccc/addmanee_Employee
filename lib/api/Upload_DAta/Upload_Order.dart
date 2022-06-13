

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled4/model/Order.dart';
import 'package:untitled4/notifire/Cartnotififire.dart';

Upload_Order(Cartnotifire cart)async{
  Order_Model_upload Order = Order_Model_upload();
  cart.Carts.forEach((element) {
    CartModel f = CartModel(element.Product!.id,element.amout, element.sum);
    Order.Ditell.add(f.toMap());
  });
  Order.nameCutommer = cart.nameCutomer;
  Order.tel =cart.tel;
  Order.Employee_ID = 'SrW0JRtfaTeCOwvr1h1XA674hC03';
  Order.address=cart.address;
  Order.sumtotal=cart.sumltoal;
  Order.amouttotal=cart.amoultoal;
  CollectionReference rfn = await FirebaseFirestore.instance.collection('order');
  DocumentReference duoid = await rfn.add(Order.toMap());
  Order.id =duoid.id;
  duoid.set(Order.toMap());
}