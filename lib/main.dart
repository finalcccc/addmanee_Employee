// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/Order/Cart.dart';
import 'package:untitled4/Order/Get_order.dart';
import 'package:untitled4/notifire/employeeNotifire.dart';
import 'package:untitled4/profile/Profire.dart';
import 'package:untitled4/route/router.dart';
import 'package:untitled4/splashScreen%20.dart';

import 'notifire/Cartnotififire.dart';
import 'notifire/categoryNotifire.dart';
import 'notifire/productNotifire.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) => print('connect'),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CategoryNotifire()),
      ChangeNotifierProvider(create: (_) => ProductNotifire()),
      ChangeNotifierProvider(create: (_) => Cartnotifire()),
      ChangeNotifierProvider(create: (_) => EmployeeNotifire()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        dividerColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        route.Get_oerder: (BuildContext context) => const Get_Order(),
        route.Cart: (BuildContext context) => const Cart(),
        route.Profile: (BuildContext context) => const Profile(),
      },
    );
  }
}
