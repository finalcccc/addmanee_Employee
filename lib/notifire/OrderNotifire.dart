import 'package:flutter/foundation.dart';

import '../model/Employee_Model.dart';

import '../model/Orde_Modelr.dart';

class Order_Notifire with ChangeNotifier {
  List<Order_Model_upload> Order = [];
  List<CartDetailData> Order_detill = [];
  Order_Model_upload? Curren_Order;
  EmployeeData? emp_Ooder;
  Referenc() {
    Order;
    notifyListeners();
  }
}
