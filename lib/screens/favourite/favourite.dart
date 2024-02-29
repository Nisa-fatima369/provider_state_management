import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/favourite_provider.dart';
import 'package:provider_state_management/screens/favourite/my_favourite_items.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.deepPurple[400],
        title: const Text('Favourite Screen',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await Provider.of<FavouriteItemProvider>(context, listen: false)
                  .fetchItemNames();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyFavouriteItems(),
                ),
              );
            },
            icon: const Icon(Icons.favorite, color: Colors.white),
            iconSize: 30,
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Consumer<FavouriteItemProvider>(
            builder: (context, value, child) {
              return ListTile(
                title:
                    Text('Item $index', style: const TextStyle(fontSize: 20)),
                trailing: value.selectedItem.contains(index)
                    ? Icon(Icons.favorite, color: Colors.blueGrey[700])
                    : const Icon(Icons.favorite_border),
                onTap: () {
                  if (value.selectedItem.contains(index)) {
                    value.removeItem(index);
                  } else {
                    value.addItem(index);
                  }
                },
              );
            },
          );
        },
        itemCount: 100,
      ),
    );
  }
}
