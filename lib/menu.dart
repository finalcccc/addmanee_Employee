import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/celement/elements.dart';
import 'package:untitled4/notifire/employeeNotifire.dart';
import 'package:untitled4/route/router.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    EmployeeNotifire emp = Provider.of<EmployeeNotifire>(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: element.main,
        shadowColor: Colors.grey[300],
        iconTheme: const IconThemeData(color: Colors.white),
        title: Center(

          child: Text(
            element.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [element.CartButton(context, route.Cart)],
      ),
      drawer: buildDrawer(emp),
      body: Container(
        color: Colors.grey[300],
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 0.5),
          children: [
            element.MenuButton(
                context, route.Get_oerder, Icons.shop, element.main, element.p1),
            element.MenuButton(context, route.managerOrder, Icons.airplay,
                element.Indigo, element.p2),
            element.MenuButton(context, route.Report_Order_Month, Icons.border_color,
                element.ocean, element.p3),
            element.MenuButton(context, route.Profile, Icons.article_rounded,
                element.sky, element.p4),
          ],
        ),
      ),
    );
  }

  Widget buildDrawer(EmployeeNotifire emp) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
        DrawerHeader(
            decoration: BoxDecoration(
              color:  Color(0xff179F84),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('ຮ້ານເເອັດມະນີ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white)),
                SizedBox(height: 10,),
                Text('${emp.CurrentEmployee_loco!.id}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white)),
                Text('${emp.CurrentEmployee_loco!.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white)),
                Text('${emp.CurrentEmployee_loco!.email}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white)),
              ],
            ),
          ),
          buildListTile(element.p1, route.Get_oerder),
          buildListTile(element.p2, route.Profile),
          buildListTile(element.p3, route.Report_Order_Month),
          buildListTile(element.p4, route.managerOrder),
        ],
      ),
    );
  }

  ListTile buildListTile(txt, rout) {
    return ListTile(
        title: Text(txt),
        onTap: () {
          Navigator.pushNamed(context, rout);
        });
  }
}
