import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';

import 'package:portfolio/common/styles/index.dart';

void main() {
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pavan Sonawane',
      home: const MainApp(),
      theme: AppThemes.appTheme,
    );
  }
}
