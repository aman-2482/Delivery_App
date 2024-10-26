import 'package:flutter/material.dart';

import '../widget/wdiget_support.dart';
import 'add_food.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.only(top: 50.0, left: 14.0, right: 20.0),
          child: Column(
            children: [
              Center(child: Text("Home Admin", style: AppWidget.HeadlineTextFIeldStyle(),),),
              SizedBox(height: 220.0,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddFood()));
                },
                child: Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Container(
                      height: 250,
                      width: 350,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.black,

                        borderRadius: BorderRadius.circular(10),


                      ),
                      child: Row(children: [
                        Padding(padding: EdgeInsets.all(7.0),
                          child: Image.asset("images/food.jpg", height: 150, width: 120, fit: BoxFit.cover,),),
                        SizedBox(width: 16.0,) ,
                        Text("Add Food Items", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),) ],),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}