import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';
import 'placeholder_page.dart';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeStr = await rootBundle.loadString('assets/dark_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;
  const MyApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moment Screen',
      theme: theme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const PlaceholderPage(pageName: 'Explore'),
    const PlaceholderPage(pageName: 'TV Shows'),
    const PlaceholderPage(pageName: 'Movies'),
    const PlaceholderPage(pageName: 'My Stuff'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.tv),
            label: 'TV Shows',
          ),
          NavigationDestination(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: 'My Stuff',
          ),
        ],
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
