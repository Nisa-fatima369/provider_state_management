// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/count_provider.dart';
import 'package:provider_state_management/provider/favourite_provider.dart';
import 'package:provider_state_management/provider/name_provider.dart';
import 'package:provider_state_management/provider/theme_provider.dart';
import 'package:provider_state_management/screens/counter_example.dart';
import 'package:provider_state_management/screens/favourite/favourite.dart';
import 'package:provider_state_management/screens/login_api_example.dart';
import 'package:provider_state_management/screens/name_example.dart';
import 'package:provider_state_management/screens/theme_example.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: const Text('Provider State Management',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Provider State Management',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            ChangeNotifierProvider(
              create: (context) => CountProvider(),
              child: ExampleButton(
                text: 'Counter Example',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CounterExample()),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ChangeNotifierProvider(
              create: (context) => NameProvider(),
              child: ExampleButton(
                text: 'Name Example',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Name()),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ChangeNotifierProvider(
              create: (context) => ThemeProvider(),
              child: ExampleButton(
                text: 'Theme Example',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThemeExample()),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ChangeNotifierProvider(
              create: (context) => FavouriteItemProvider(),
              child: ExampleButton(
                text: 'Favourite Example',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavouriteScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginRESTAPIwithProvider(),
                  ),
                );
              },
              child: const Text('Login Example'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ExampleButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
