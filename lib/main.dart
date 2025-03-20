import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'consts/routes.dart';
import 'models/subscription_model.dart';
import 'providers/subscription_provider.dart';
import 'screens/get_started_screen.dart';
import 'screens/my_subscriptions_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SubscriptionAdapter());
  await Hive.openBox<Subscription>('subscriptions');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubscriptionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //black theme , white text, grey subtext
          brightness: Brightness.dark,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => GetStartedScreen(),
          mySubscriptionsPath: (context) => MySubscriptionsScreen(),
        },
      ),
    );
  }
}