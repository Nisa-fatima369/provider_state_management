import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/count_provider.dart';
import 'package:provider_state_management/provider/favourite_provider.dart';
import 'package:provider_state_management/provider/login_api_provider.dart';
import 'package:provider_state_management/provider/name_provider.dart';
import 'package:provider_state_management/provider/theme_provider.dart';
import 'package:provider_state_management/screens/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => NameProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (context) => LoginApiProvider()),
      ],
      child: const MaterialApp(
        title: 'Provider State Management',
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    ),
  );
}


