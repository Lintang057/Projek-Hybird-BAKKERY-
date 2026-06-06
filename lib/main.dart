import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/keranjang_page.dart';
import 'pages/history_page.dart';
import 'pages/login_page.dart';

void main() => runApp(const MaterialApp(home: LoginPage())); // Login jadi halaman pertama

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  final List<Widget> _pages = [const HomePage(), const KeranjangPage(), const HistoryPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Keranjang"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
      ),
    );
  }
}