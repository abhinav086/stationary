import 'package:flutter/material.dart';
import 'landing_page.dart'; // Import the landing_page.dart file

class YourCart extends StatelessWidget {
  final Map<Item, int> selectedItems;

  YourCart({required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (context, index) {
          Item item = selectedItems.keys.elementAt(index);
          int quantity = selectedItems[item]!;
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.description),
            trailing: Text('Quantity: $quantity'),
          );
        },
      ),
    );
  }
}
