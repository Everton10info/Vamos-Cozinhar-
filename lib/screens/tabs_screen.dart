import '../components/main-drawer.dart';
import 'categories_screen.dart';
import 'favorite-screen.dart';
import 'package:flutter/material.dart';
import 'package:mult_t/models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];
  List<Widget> _screens = [];

  void initState() {
    super.initState();
    _screens = [
      CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeals),
    ];
  }

  _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      //initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_titles[_selectedScreenIndex]),
          /*  bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favoritos',
              )
            ],
          ), */
        ),
        drawer: MainDrawer(),
        body: _screens[_selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedScreen,
          backgroundColor: Colors.purple,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: ('Categorias')),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: ('Favoritos')),
          ],
        ),

        /* TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ],
        ), */
      ),
    );
  }
}
