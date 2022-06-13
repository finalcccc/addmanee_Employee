// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, unused_local_variable, avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Employee_Model.dart';
import '../notifire/employeeNotifire.dart';




GetEmployeeData_only(EmployeeNotifire emp,String email) async {
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('employees')
      .where('email',isEqualTo:'${email}')
      .get();
  rfn.docs.forEach((e) async{
       EmployeeData em =  await EmployeeData.frommap(e.data());
       emp.CurrentEmployee_loco = em;
       print(emp.CurrentEmployee_loco!.name);
       },
  );

  emp.RefreshEmp();
}