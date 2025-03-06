import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:portfolio/app.dart';
import 'package:portfolio/common/styles/index.dart';
import 'package:portfolio/provider/index.dart';

void main() {
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => ProjectProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pavan Sonawane',
        home: const MainApp(),
        theme: AppThemes.appTheme,
      ),
    );
  }
}
