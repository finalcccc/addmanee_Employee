import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/notifire/employeeNotifire.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    EmployeeNotifire emp = Provider.of<EmployeeNotifire>(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${emp.CurrentEmployee_loco!.id}'),
            Text('${emp.CurrentEmployee_loco!.name}'),
            Text('${emp.CurrentEmployee_loco!.tel}'),
            Text('${emp.CurrentEmployee_loco!.email}'),
            Text('${emp.CurrentEmployee_loco!.address}'),
            Text('${emp.CurrentEmployee_loco!.position}'),
           // Text('${emp.CurrentEmployee_loco!.date}'),
          ],
        ),
      ),
    );
  }
}
