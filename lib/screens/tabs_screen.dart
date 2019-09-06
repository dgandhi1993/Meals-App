import 'package:flutter/material.dart';
import '../screens/favorites_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 1, for fav screen to be default
      child: Scaffold(
        appBar: AppBar(
          title: Text("DesiMeals"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: "Categories",),
              Tab(icon: Icon(Icons.star), text: "Favourites",),
            ],),
        ),
      body: TabBarView(
        children: <Widget>[
          CategoriesScreen(),
          FavoritesScreen()

        ],
      ),
      ),
    );
  }
}
