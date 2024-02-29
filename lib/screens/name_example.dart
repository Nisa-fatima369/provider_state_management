import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/name_provider.dart';

class Name extends StatefulWidget {
  const Name({super.key});
  
  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    final nameProvider = Provider.of<NameProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: const Text('Counter Example',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<NameProvider>(
              builder: (context, value, child) {
                return Text('Name: ${value.name}');
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) =>
                    Provider.of<NameProvider>(context, listen: false)
                        .updateName(value),
                decoration: const InputDecoration(labelText: 'Enter Name'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
