import 'package:flashcook_poc/router.dart';
import 'package:flutter/material.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class App extends StatelessWidget {
  App({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flashcook POC',
      // theme: ThemeData.light().copyWith(
      //   extensions: <ThemeExtension<AppTheme>>[lightTheme],
      //   iconTheme: IconThemeData(color: lightTheme.colors.black),
      // ),
      // darkTheme: ThemeData.dark().copyWith(
      //   extensions: <ThemeExtension<AppTheme>>[darkTheme],
      //   iconTheme: IconThemeData(color: lightTheme.colors.white),
      // ),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router.config(
        navigatorObservers: () => [routeObserver],
      ),
    );
  }
}
