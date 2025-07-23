import "features/user/presentation/screens/user_account_screen.dart";
import 'features/wishlist/presentation/screens/wishlist_screen.dart';
import "features/home/presentation/screens/home_screen.dart";
import "package:flutter/material.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const WishListScreen(),
    const UserAccountScreen(),
  ];
  int _currentScreenIndex = 0;
  String title = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions:[
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          tooltip: 'Cart',
          onPressed: () {
            // Can use context here
            Navigator.pushNamed(context, "/cart");
          },
        ),

        ]


      ),
      body: _screens[_currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenIndex,
        onTap: (index) {
          setState(() {
            _currentScreenIndex = index;
            switch (_currentScreenIndex) {
              case 0:
                title = "Home";
                break;
              case 1:
                title = "Wishlist";
                break;
              case 2:
                title = "User Account";
                break;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
