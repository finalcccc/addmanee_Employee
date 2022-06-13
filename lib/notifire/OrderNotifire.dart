import 'package:flutter/cupertino.dart';

import '../model/Order.dart';

class Order with ChangeNotifier{
  List<Order_Model_upload> OrderCutommer =[];
  Order_Model_upload?Order_upload;
}