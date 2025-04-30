import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/food_item.dart';

class FoodViewModel extends ChangeNotifier {
  List<FoodItem> foodItems = [];
  bool isLoading = false;
  StreamSubscription? _subscription;

  void listenToFoodItems() {
    isLoading = true;
    notifyListeners();

    _subscription = FirebaseFirestore.instance
        .collection('food_items')
        .snapshots()
        .listen((snapshot) {
      foodItems = snapshot.docs
          .map((doc) => FoodItem.fromMap(doc.data(), doc.id))
          .toList();

      isLoading = false;
      notifyListeners();
    }, onError: (error) {
      print("Error listening to food items: $error");
      isLoading = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
