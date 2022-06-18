// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/Order/reportIncomeMonth.dart';
import 'package:untitled4/menu.dart';
import '../api/widget/widgetShearch.dart';
import '../celement/elements.dart';
import 'package:intl/intl.dart';


class Report_Order_Month extends StatefulWidget {
  const Report_Order_Month({Key? key}) : super(key: key);

  @override
  State<Report_Order_Month> createState() => _Report_Order_MonthState();
}

final List items = List.generate(3, (i) => "Item $i");

class _Report_Order_MonthState extends State<Report_Order_Month> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍງານຈຳນວນສັ່ງຊື້ທີສຳເລັດ'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const Menu()),
        bottom: WidgetSearch(label: 'ປີ - ເດືອນ'),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                                'ປີ/ເດືອນ: 2022-${index+1}'),
                            subtitle: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'ລາຍການສ່ັງຊື້ສຳເລັດ:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      ' 200',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: element.main,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ' ອໍເດີ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'ຍອດເງີນ:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          ' 2.000.000',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          ' ກີບ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      child:Icon(Icons.arrow_forward_ios_sharp,size: 14),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const Report_Order_Day()));
                },
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox();
        },
      ),
    );
  }
}
