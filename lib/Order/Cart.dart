
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/api/Upload_DAta/Upload_Order.dart';
import 'package:untitled4/celement/elements.dart';
import 'package:untitled4/notifire/employeeNotifire.dart';

import '../api/Get_product.dart';
import '../notifire/Cartnotififire.dart';
import '../notifire/categoryNotifire.dart';
import '../notifire/productNotifire.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    Productfacing();

  }

  Future Productfacing() async {
    CategoryNotifire category = Provider.of<CategoryNotifire>(context, listen: false);
    await GetCategoryData(category);
  }

  @override
  Widget build(BuildContext context) {
    Cartnotifire cart = Provider.of<Cartnotifire>(context);
    ProductNotifire product = Provider.of<ProductNotifire>(context);
    EmployeeNotifire emp = Provider.of<EmployeeNotifire>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.Cartlist.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                Image.network(
                                  '${cart.Cartlist[index].Product!.image}',
                                  width: 100,
                                  height: 120,
                                  fit: BoxFit.fitWidth,
                                ),
                                Text('${cart.Cartlist[index].Product!.nameProduct}'),
                                Text('ລາຄາ / ລາຍການ: \n${NumberFormat.decimalPattern().format(cart.price[index])}'),
                                Text('ລາຄາ: \n${NumberFormat.decimalPattern().format(cart.Carts[index].sum)}')
                              ],
                            ),
                            const SizedBox(width:90),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          cart.sum(index);
                                        },
                                        child: const Text('ເພີ່ມ')),
                                    Text('${cart.Cartlist[index].amout}'),
                                    TextButton(
                                        onPressed: () {
                                          cart.dedet(index);
                                        },
                                        child: const Text('ລົບ')),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    cart.remove(index);
                                  },
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                ),

                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: element.main,
              ),
            onPressed: () {
           //   cart.Refres();
              _Dialog(cart);
            },
            child: const Text(
              'ເພີ່ມທີ່ຢູ່',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: 100,
            width: 400,
            decoration: const BoxDecoration(),
            child:  Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 55),
                  child: Text('ຈຳນວນ: ' '${ cart.amoultoal} ແກັດ'  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 55),
                  child: Text('ລາຄາລວມ: ' '${ NumberFormat.decimalPattern().format(cart.sumltoal)} ກີບ'  ),

                ),

              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15, left: 15),
            width: 390,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: element.main,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16)),
              onPressed: () async{
               await Upload_Order(cart,product,emp);
               _key_import.currentState!.reset();

              },
              child: const Text(
                "ສັ່ງຊື້",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }


  final GlobalKey<FormState> _key_import = GlobalKey<FormState>();
  _Dialog(Cartnotifire cart) {
    return showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          actions: [
            IconButton(
              icon: const Icon(Icons.indeterminate_check_box_outlined,
                  color: Colors.red, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Column(
              children: [
                Form(
                    key: _key_import,
                    child: Container(
                      width: 400,
                      height: 530,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10, left: 25),
                              child: Text(
                                'ເພີ່ມທີ່ຢູ່ລູກຄ້າ',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            const SizedBox(height: 15),
                            ////////////////////////////////////////////////
                            TextFormField(
                              initialValue: cart.nameCutomer,
                              decoration: InputDecoration(
                                hintText: "ຊື່",
                                fillColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                filled: true,
                                prefixIcon: const Icon(Icons.person_remove_sharp),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onSaved: ( _name) {
                                 cart.nameCutomer =_name;
                              },
                              validator: (cost) {
                                if (cost!.isEmpty) {
                                  return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                                } else if (cost.length < 4) {
                                  return "ກວດສວບລາຄາ";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            /////////////////////////////////////////
                            TextFormField(
                              initialValue: cart.tel.toString(),
                              decoration: InputDecoration(
                                hintText: "ເບີ",
                                fillColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                filled: true,
                                prefixIcon: const Icon(Icons.phone),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onSaved: (_tel) {
                                  cart.tel = int.parse(_tel!);
                              },
                              validator: (amout) {
                                if (amout!.isEmpty) {
                                  return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                                } else if (amout.length < 1) {
                                  return "ກວດສວບລາຄາ";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            ////////////////////////////////////////////////
                            Container(
                              height: 90,
                              child: TextFormField(
                                initialValue: cart.address,
                                decoration: InputDecoration(
                                  hintText: "ທີ່ຢູ່",
                                  fillColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  filled: true,
                                  prefixIcon: const Icon(Icons.home),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onSaved: (_address) {
                                  cart.address =_address;
                                },
                                validator: (cost) {
                                  if (cost!.isEmpty) {
                                    return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                                  } else if (cost.length < 4) {
                                    return "ກວດສວບລາຄາ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 40),

                            Container(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                child: const Text('ບັນທືກ'),
                                onPressed: () async {
                                  if (_key_import.currentState!.validate()) {
                                    _key_import.currentState!.save();

                                   }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

