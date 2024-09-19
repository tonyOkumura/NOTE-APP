import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/material_theme.dart';

import 'app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });
  final materialTheme = MaterialTheme(TextTheme());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Note App",
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.light,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
