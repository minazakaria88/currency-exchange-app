import 'package:currency/config/routes/route.dart';
import 'package:currency/config/themes/app_theme.dart';
import 'package:currency/injection.dart%20';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(const CurrencyConverter());
}

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
    onGenerateRoute: AppRoutes.onGeneratedRoute,
    );
  }
}
//https://api.fastforex.io/fetch-multi?from=USD2&to=egp&api_key=c521a42ce5-81a463e76b-s9069g
