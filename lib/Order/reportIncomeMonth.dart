// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/menu.dart';
import '../api/widget/widgetShearch.dart';
import '../celement/elements.dart';
import 'package:intl/intl.dart';


class Report_Order_Day extends StatefulWidget {
  const Report_Order_Day({Key? key}) : super(key: key);

  @override
  State<Report_Order_Day> createState() => _Report_Order_DayState();
}

final List items = List.generate(3, (i) => "Item $i");

class _Report_Order_DayState extends State<Report_Order_Day> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍການສັ່ງຊື້ທີ່ສຳເລັດໃນເເຕ່ລະມື້'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const Menu()),
        bottom: WidgetSearch(label: 'ປີ - ເດືອນ-ວັນ'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  '   ປະຈຳປີ : 2022-1',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: 2,
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
                                      'ປີ : 2022-1-${index+4}'),
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
                                            ' 100',
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
                                                ' 1.000.000',
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
                        //
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //         const ReportIncomeMonth()));
                      },
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
