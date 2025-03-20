import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/subscription_model.dart'; // Import the Subscription model

class SubscriptionProvider with ChangeNotifier {
  // Hive box to store subscriptions
  final Box<Subscription> _subscriptionsBox = Hive.box<Subscription>('subscriptions');

  // Getter to retrieve all subscriptions
  List<Subscription> get subscriptions => _subscriptionsBox.values.toList();

  // Add a new subscription
  void addSubscription(Subscription subscription) {
    _subscriptionsBox.add(subscription); // Add to Hive box
    notifyListeners(); // Notify listeners to update the UI
  }

  // Remove a subscription by index
  void removeSubscription(int index) {
    _subscriptionsBox.deleteAt(index); // Remove from Hive box
    notifyListeners(); // Notify listeners to update the UI
  }

  // Update a subscription by index
  void updateSubscription(int index, Subscription updatedSubscription) {
    _subscriptionsBox.putAt(index, updatedSubscription); // Update in Hive box
    notifyListeners(); // Notify listeners to update the UI
  }

  // Clear all subscriptions
  void clearSubscriptions() {
    _subscriptionsBox.clear(); // Clear the Hive box
    notifyListeners(); // Notify listeners to update the UI
  }
}