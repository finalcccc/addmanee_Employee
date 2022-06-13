import 'package:flutter/material.dart';
import 'package:untitled4/celement/elements.dart';
import 'package:untitled4/route/router.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
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
        //actions: [element.CartButton(context, route.Cart)],
      ),
      drawer: buildDrawer(),
      body: Container(
        color: Colors.grey[300],
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 0.5),
          children: [
            element.MenuButton(
                context, route.Get_oerder, Icons.shop, element.main, element.p1),
            element.MenuButton(context, route.register, Icons.airplay,
                element.Indigo, element.p2),
            element.MenuButton(context, route.m_orders, Icons.border_color,
                element.ocean, element.p3),
            element.MenuButton(context, route.product, Icons.article_rounded,
                element.sky, element.p4),
          ],
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff0031CA),
            ),
            //Title of header
            child: Text(
              'ທະວິສັກ',
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
          ),
          buildListTile(element.p1, route.Get_oerder),
          buildListTile(element.p2, route.register),
          buildListTile(element.p3, route.m_orders),
          buildListTile(element.p4, route.product),
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
