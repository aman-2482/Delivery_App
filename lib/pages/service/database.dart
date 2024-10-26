import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  // Function to add user details to Firebase Firestore
  Future<void> addUserDetail(
      Map<String, dynamic> userInfoMap, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(id)
          .set(userInfoMap);
    } catch (e) {
      print("Error adding user details: $e");
    }
  }

  // Function to update the user wallet balance in Firestore
  Future<void> updateUserWallet(String id, String amount) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(id)
          .update({"wallet": amount});
    } catch (e) {
      print("Error updating user wallet: $e");
    }
  }

  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
    return FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  // Function to fetch user wallet data from Firestore
  Future<String?> getUserWallet(String id) async {
    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection("Users").doc(id).get();
      if (userDoc.exists && userDoc.data() != null) {
        return userDoc
            .get('wallet')
            ?.toString(); // Assuming 'wallet' is a field in the user's document
      }
    } catch (e) {
      print("Error fetching user wallet: $e");
    }
    return null;
  }

  Future addFoodToCart(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("Cart")
        .add(userInfoMap);
  }
  Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).collection("Cart").snapshots();
  }


}
