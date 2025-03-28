import 'package:hive/hive.dart';

part 'subscription_model.g.dart';

@HiveType(typeId: 0)
class Subscription {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final double price;

  @HiveField(2)
  final DateTime renewalDate;

  Subscription({
    required this.name,
    required this.price,
    required this.renewalDate,
  });
}