
import 'package:chatia/app_router.dart';
import 'package:chatia/module_theme/model/app_themes.dart';
import 'package:chatia/module_theme/model/theme_manager.dart';
import 'package:chatia/module_theme/storage/sharedpreferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await themeStorage.init();
  firstRoute = await AppRouter.firstRoute();
  runApp(
    const ChatiaApp()
  );
}

class ChatiaApp extends StatefulWidget {
  const ChatiaApp({Key? key}) : super(key: key);

  @override
  State<ChatiaApp> createState() => _ChatiaAppState();
}

class _ChatiaAppState extends State<ChatiaApp> {
  @override
  Widget build(BuildContext context) {
    activeTheme = ThemeManager.getTheme();
    return MaterialApp(
      initialRoute: firstRoute,
      onGenerateRoute: AppRouter.route,
      theme: AppThemes.themes[1],
      debugShowCheckedModeBanner: false,
    );
  }
}

