import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/service/database.dart';
import 'package:food_delivery/pages/service/shared_pref.dart';
import 'package:food_delivery/widget/wdiget_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? id , wallet;
  int total=0 , amount2 = 0;

  void startTimer(){
    Timer(Duration(seconds: 3),(){
      amount2 = total;
      setState(() {

      });

    });
  }
  getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    wallet = await SharedPreferenceHelper().getUserWallet();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    foodStream = await DatabaseMethods().getFoodCart(id!);
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    startTimer();
    super.initState();
  }

  Stream? foodStream;
  Widget foodCart() {
    return StreamBuilder(
      stream: foodStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
          return Center(child: Text('No items found'));
        } else {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15), // Padding between items and sides
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // Disable vertical scrolling since we're in a column
            itemBuilder: (context, index) {
               DocumentSnapshot ds = snapshot.data.docs[index];
              total = total+int.parse(ds["Total"]);
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 12, right: 12,bottom: 6),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 52,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(child: Text(ds["Quantity"])),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.network(
                                  ds["Image"],
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  ds["Name"],
                                  style: AppWidget.SemiTextFIeldStyle(),
                                ),
                                Text(
                                 "\$" + ds["Total"],
                                  style: AppWidget.SemiTextFIeldStyle(),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.0,
                child: Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                      "Wallet",
                      style: AppWidget.HeadlineTextFIeldStyle(),
                    )))),
            SizedBox(
              height: 20,
            ),

            Container(
              height: MediaQuery.of(context).size.height/2,

                child: foodCart()),
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(

                    "Total Price",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Text(
                    "\$"+total.toString(),
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: ()async{
                int amount = int.parse(wallet!)-amount2;
                await DatabaseMethods().updateUserWallet(id!,amount.toString());
                await SharedPreferenceHelper().saveUserWallet(amount.toString());

              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Center(
                    child: Text(
                  "Checkout",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
