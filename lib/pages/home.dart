import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/details.dart';
import 'package:food_delivery/pages/service/database.dart';
import 'package:food_delivery/widget/wdiget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool iceream = false, pizza = false, salad = false, burger = false;

  Stream? fooditemStream;

  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem("Pizza");
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  // Horizontal List of Food Items
  Widget allItems() {
    return StreamBuilder(
      stream: fooditemStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
          return Center(child: Text('No items found'));
        } else {
          return ListView.builder(
            padding: const EdgeInsets.only(left: 10, right: 10),
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.docs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(detail:ds ["Detail"],name: ds["Name"],price: ds["Price"],image: ds["Image"],),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                                ds["Image"],
                                height: 190,
                                width: 190,
                                fit: BoxFit.cover,
                              ),
                            ),

                          Text(ds["Name"],
                              style: AppWidget.SemiTextFIeldStyle()),
                          SizedBox(height: 5.0),
                          Text("Fresh and Healthy",
                              style: AppWidget.HeaderTextFIeldStyle()),
                          SizedBox(height: 5.0),
                          Text("\$${ds["Price"]}",
                              style: AppWidget.SemiTextFIeldStyle()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  // Vertical List of Featured Items
  Widget allItemsVertical() {
    return StreamBuilder(
      stream: fooditemStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
          return Center(child: Text('No items found'));
        } else {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Padding between items and sides
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // Disable vertical scrolling since we're in a column
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.docs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Details(detail:ds ["Detail"],name: ds["Name"],price: ds["Price"],image: ds["Image"],),
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20), // Add margin between items
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            ds["Image"],
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 15),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ds["Name"],
                                    style: AppWidget.SemiTextFIeldStyle()),
                                SizedBox(height: 15),
                                Text("Honey Goat Chicken",
                                    style: AppWidget.HeaderTextFIeldStyle()),
                                SizedBox(height: 15),
                                Text("\$${ds["Price"]}",
                                    style: AppWidget.SemiTextFIeldStyle()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  // Category Icons with logic to update fooditemStream
  Widget showitem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        categoryIcon("images/ice-cream.png", iceream, () {
          setState(() {
            iceream = true;
            pizza = false;
            salad = false;
            burger = false;
          });
          updateCategory("Ice Cream");
        }),
        categoryIcon("images/pizza.png", pizza, () {
          setState(() {
            iceream = false;
            pizza = true;
            salad = false;
            burger = false;
          });
          updateCategory("Pizza");
        }),
        categoryIcon("images/salad.png", salad, () {
          setState(() {
            iceream = false;
            pizza = false;
            salad = true;
            burger = false;
          });
          updateCategory("Salad");
        }),
        categoryIcon("images/burger.png", burger, () {
          setState(() {
            iceream = false;
            pizza = false;
            salad = false;
            burger = true;
          });
          updateCategory("Burger");
        }),
      ],
    );
  }

  // Function to update the food category
  void updateCategory(String category) async {
    fooditemStream = await DatabaseMethods().getFoodItem(category);
    setState(() {});
  }

  // Widget for each category icon
  Widget categoryIcon(String imagePath, bool isActive, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              color: isActive ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(8),
          child: Image.asset(imagePath,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              color: isActive ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row with Hello and Cart Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hello Aman", style: AppWidget.boldTextFieldStyle()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.black),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text("Delicious Food", style: AppWidget.HeadlineTextFIeldStyle()),
                Text("Discover and get Great Food",
                    style: AppWidget.HeaderTextFIeldStyle()),
                const SizedBox(height: 20.0),

                // Food Category Icons
                Container(
                    margin: const EdgeInsets.only(right: 20), child: showitem()),
                const SizedBox(height: 20),

                // Scrollable Food Items Row (Horizontal)
                SizedBox(
                  height: 350,
                  child: allItems(),
                ),

                // Padding between lists
                const SizedBox(height: 30),

                // Featured Item (Vertical)
                allItemsVertical(), // Flexible vertical list
              ],
            ),
          ),
        ),
      ),
    );
  }
}
