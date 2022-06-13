// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../model/Employee_Model.dart';

class EmployeeNotifire with ChangeNotifier {

  EmployeeData? CurrentEmployee_loco;

  RefreshEmp() {
    CurrentEmployee_loco;
    notifyListeners();
  }
}