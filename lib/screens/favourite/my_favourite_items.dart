import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/favourite_provider.dart';

class MyFavouriteItems extends StatefulWidget {
  const MyFavouriteItems({super.key});

  @override
  State<MyFavouriteItems> createState() => _MyFavouriteItemsState();
}

class _MyFavouriteItemsState extends State<MyFavouriteItems> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
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
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Consumer<FavouriteItemProvider>(
            builder: (context, value, child) {
              final selectedItemIndex = favouriteProvider.selectedItem[index];
              return ListTile(
                title: Text(favouriteProvider.itemNames[selectedItemIndex],
                    style: const TextStyle(fontSize: 20)),
                trailing: Icon(Icons.favorite, color: Colors.blueGrey[700]),
                // onTap: () {
                //   if (value.selectedItem.contains(index)) {
                //     value.removeItem(index);
                //   } else {
                //     value.addItem(index);
                //   }
                // },
              );
            },
          );
        },
        itemCount: favouriteProvider.selectedItem.length,
      ),
    );
  }
}
