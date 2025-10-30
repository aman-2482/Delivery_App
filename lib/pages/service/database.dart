import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Minimal placeholder for DatabaseMethods used across the app.
/// These stubs return empty streams / no-op futures so the app can compile
/// and be built for web. Replace with real Firestore logic as needed.
class DatabaseMethods {
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getFoodItem(String category) async {
    return Stream<QuerySnapshot<Map<String, dynamic>>>.empty();
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getFoodCart(String userId) async {
    return Stream<QuerySnapshot<Map<String, dynamic>>>.empty();
  }

  Future<void> addFoodToCart(Map<String, dynamic> data, String userId) async {
    // no-op placeholder
  }

  Future<void> addFoodItem(Map<String, dynamic> data, String? value) async {
    // no-op placeholder
  }

  Future<void> addUserDetail(Map<String, dynamic> data, String id) async {
    // no-op placeholder
  }

  Future<void> updateUserWallet(String userId, String amount) async {
    // no-op placeholder
  }
}
