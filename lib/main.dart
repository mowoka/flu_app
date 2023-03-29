import 'package:flu_app/features/home/data/repository/home_repository_impl.dart';
import 'package:flu_app/features/home/presentation/provider/home_provider.dart';
import 'package:flu_app/features/home/presentation/routes/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'core/utils/material_color.dart';

void main() {
  runApp(const FluApp());
}

class FluApp extends StatefulWidget {
  const FluApp({super.key});

  @override
  State<FluApp> createState() => _FluAppState();
}

class _FluAppState extends State<FluApp> {
  late final GoRouter _router;
  late final HomeProvider _homeProvider;

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = "id_ID";
    initDependencies();
  }

  Future<String> getAccessToken() async {
    return '';
  }

  initDependencies() {
    _router = initRouter();
    // register repository and provider
    final homeRepo = HomeRepositoryImpl(accessTokenGetter: getAccessToken);
    _homeProvider = HomeProvider(repository: homeRepo);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => _homeProvider,
        ),
      ],
      child: MaterialApp.router(
        title: "Flutter App",
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: createMaterialColor(fluAppLightOrangeColor),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.bold,
              color: fluAppLightOrangeColor,
            ),
            displayMedium: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: fluAppLightOrangeColor,
            ),
            titleLarge: TextStyle(fontSize: 12, color: Colors.black38),
            bodyLarge: TextStyle(fontSize: 14),
            bodyMedium: TextStyle(fontSize: 12),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(fontSize: 14),
            contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            isDense: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black38)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: fluAppLightOrangeColor),
            ),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1,
              color: Colors.redAccent,
            )),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black38),
            ),
            errorStyle:
                TextStyle(fontSize: 12, height: .3, color: Colors.redAccent),
          ),
          radioTheme: const RadioThemeData(
            fillColor: MaterialStatePropertyAll(fluAppLightOrangeColor),
          ),
          checkboxTheme: const CheckboxThemeData(
            fillColor: MaterialStatePropertyAll(fluAppLightOrangeColor),
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [Locale('id', 'ID')],
        routerConfig: _router,
      ),
    );
  }

  GoRouter initRouter() {
    final router = GoRouter(
      routes: [
        GoRoute(
          name: HomeRoute.routeName,
          path: HomeRoute.routeName,
          builder: (context, state) => const HomeRoute(),
        ),
      ],
    );

    return router;
  }
}
