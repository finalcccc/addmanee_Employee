import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/celement/elements.dart';
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
      appBar: AppBar(
          backgroundColor: element.main,
          leading: element.BackPage(context),
        title: Text(
            element.p4,
            style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10), //border corner radius
              boxShadow:[
                BoxShadow(
                  color: element.main.withOpacity(0.2), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
          ),
          child: Card(
            color: Colors.white,
            shadowColor: Colors.blue,
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Column(
                      children: [
                        Text('ລະຫັດພະນັກງານ', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text('${emp.CurrentEmployee_loco!.id}'),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(child: Column(
                    children: [
                      Text('ຊື່ພະນັກງານ', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text('${emp.CurrentEmployee_loco!.name}'),
                      SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Column(
                      children: [
                        Text('ເບີໂທ', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text('${emp.CurrentEmployee_loco!.tel}'),
                        SizedBox(height: 10),
                      ],

                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    child: Column(
                      children: [
                        Text('ອີເມວ', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text('${emp.CurrentEmployee_loco!.email}'),
                        SizedBox(height: 10),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Column(
                      children: [
                        Text(
                          'ທີ່ຢຸ່',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        Text('${emp.CurrentEmployee_loco!.address}'),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Column(
                      children: [
                        Text(
                          'ຕຳເເໜ່ງ',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        Text('${emp.CurrentEmployee_loco!.position}'),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                   IconButton(onPressed: (){}, icon: Icon(Icons.edit),iconSize: 40,color: element.main,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
