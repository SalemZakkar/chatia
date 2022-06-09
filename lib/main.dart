
import 'package:chatia/app_router.dart';
import 'package:chatia/module_theme/bloc/theme_cubit.dart';
import 'package:chatia/module_theme/model/app_themes.dart';
import 'package:chatia/module_theme/model/theme_manager.dart';
import 'package:chatia/module_theme/storage/sharedpreferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initService();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
        create: (context) => themeCubit,
      )
    ],
    child: const ChatiaApp(),
  ));
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
    return MultiBlocListener(
      listeners: [
        BlocListener<ThemeCubit, ThemeState>(
          listener: (context, state) {
            if (state is ThemeChanged) {
              setState(() {
                activeTheme = state.i;
              });
            }
          },
        )
      ],
      child: MaterialApp(
        initialRoute: firstRoute,
        onGenerateRoute: AppRouter.route,
        theme: AppThemes.themes[activeTheme],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

Future<bool> initService() async {
  await Firebase.initializeApp();
  await themeStorage.init();
  firstRoute = await AppRouter.firstRoute();
  return true;
}
