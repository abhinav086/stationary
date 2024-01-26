import 'package:flutter/material.dart';
import 'item_details_page.dart';
import 'your_cart.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Item> cartItems = [
    Item(
      name: 'Pen',
      image: 'assets/pen.jpg',
      description: 'A high-quality pen suitable for everyday writing tasks.',
    ),
    Item(
      name: 'Pencil',
      image: 'assets/pencil.jpg',
      description: 'A classic wooden pencil for sketching and note-taking.',
    ),
    Item(
      name: 'Notebook',
      image: 'assets/notebook.jpg',
      description: 'A durable notebook with lined pages for all your writing needs.',
    ),
    // Add more items as needed
  ];

  Map<Item, int> selectedItems = {}; // Map to track selected items and their quantities

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stationary'), // Change the app bar title
      ),
      drawer: buildDrawer(),
      body: Column(
        children: [
          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailsPage(item: cartItems[index], onAddToCart: addToCart),
                      ),
                    );
                  },
                  child: buildCard(cartItems[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(Item item) {
    return Container(
      width: 150.0,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              item.image,
              width: 120.0,
              height: 120.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(item.name),
          ],
        ),
      ),
    );
  }
  

  Widget buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Image.asset(
              'assets/drawer_image.jpg',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Your Cart'), // "Your Cart" button
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YourCart(selectedItems: selectedItems),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void addToCart(Item item) {
    setState(() {
      if (selectedItems.containsKey(item)) {
        selectedItems[item] = selectedItems[item]! + 1;
      } else {
        selectedItems[item] = 1;
      }
    });
  }
}

class Item {
  final String name;
  final String image;
  final String description;

  Item({
    required this.name,
    required this.image,
    required this.description,
  });
}
