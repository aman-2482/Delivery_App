import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/pages/details.dart';
import 'package:food_delivery/widget/wdiget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool iceream = false, pizza = false, salad = false, burger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(
        top: 40,
        left: 15,

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hello Aman", style: AppWidget.boldTextFieldStyle()),
              Container(
                margin: EdgeInsets.only(right: 20),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.black),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Delicious Food",
            style: AppWidget.HeadlineTextFIeldStyle(),
          ),
          Text(
            "Discover and get Great Food",
            style: AppWidget.HeaderTextFIeldStyle(),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(margin: EdgeInsets.only(right: 20), child: showitem()),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Details()));
                },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("images/salad2.png",
                                height: 150, width: 150, fit: BoxFit.cover),
                            Text(
                              'Vegie Taco Hash ',
                              style: AppWidget.SemiTextFIeldStyle(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Fresh and Healthy ',
                              style: AppWidget.HeaderTextFIeldStyle(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '\$25',
                              style: AppWidget.SemiTextFIeldStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("images/salad2.png",
                            height: 150, width: 150, fit: BoxFit.cover),
                        Text(
                          'Vegie Taco Hash ',
                          style: AppWidget.SemiTextFIeldStyle(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Fresh and Healthy ',
                          style: AppWidget.HeaderTextFIeldStyle(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '\$25',
                          style: AppWidget.SemiTextFIeldStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("images/salad2.png",
                            height: 150, width: 150, fit: BoxFit.cover),
                        Text(
                          'Vegie Taco Hash ',
                          style: AppWidget.SemiTextFIeldStyle(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Fresh and Healthy ',
                          style: AppWidget.HeaderTextFIeldStyle(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '\$25',
                          style: AppWidget.SemiTextFIeldStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("images/salad2.png",
                            height: 150, width: 150, fit: BoxFit.cover),
                        Text(
                          'Vegie Taco Hash ',
                          style: AppWidget.SemiTextFIeldStyle(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Fresh and Healthy ',
                          style: AppWidget.HeaderTextFIeldStyle(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '\$25',
                          style: AppWidget.SemiTextFIeldStyle(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/salad2.png",
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width:MediaQuery.of(context).size.width/2,
                            child: Text(
                          "Meditearean Chicken Salad",
                          style: AppWidget.SemiTextFIeldStyle(),
                        )),
                        SizedBox(height: 15,),
                        Container(
                            width:MediaQuery.of(context).size.width/2,
                            child: Text(
                              "Honey GOat Chicken",
                              style: AppWidget.HeaderTextFIeldStyle(),
                            )),
                        SizedBox(height: 15,),
                        Container(
                            width:MediaQuery.of(context).size.width/2,
                            child: Text(
                              "\$28",
                              style: AppWidget.SemiTextFIeldStyle(),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),

          ),
        ],
      ),
    ));
  }

  Widget showitem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            iceream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: iceream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/ice-cream.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  color: iceream ? Colors.white : Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/pizza.png",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/salad.png",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/burger.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  color: burger ? Colors.white : Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
