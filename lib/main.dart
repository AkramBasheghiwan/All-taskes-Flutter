import 'package:flutter/material.dart';

import 'package:flutter_taskes/login.dart';

class AllFlutterTasks extends StatelessWidget {
  const AllFlutterTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        fontFamily: 'Segoe UI', // يمكنك تغيير الخط هنا
      ),
      home: const LoginPage(),
    );
  }
}
