import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:usedcar_ex_flutter/config/theme.dart';
import 'package:usedcar_ex_flutter/presentation/journey/Home/home_screen.dart';
import 'package:usedcar_ex_flutter/presentation/journey/root/root_screen.dart';

class UsedCarApp extends StatefulWidget {
  const UsedCarApp({super.key});

  @override
  State<UsedCarApp> createState() => _UsedCarAppState();
}

class _UsedCarAppState extends State<UsedCarApp> {
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();
  final _botToastBuilder = BotToastInit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UsedCar Ex',
      theme: theme(),
      debugShowCheckedModeBanner: true,
      home: const RootScreen(),
      navigatorKey: _navigator,
      builder: (context, child) {
        return _botToastBuilder(context, child);
      },
    );
  }
}
