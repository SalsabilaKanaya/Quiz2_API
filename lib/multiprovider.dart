import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MaterialApp(
        title: 'My App',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/detail': (context) => DetailScreen(),
        },
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_4),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Counter'),
                    SizedBox(height: 16.0),
                    Text(
                      '${counter.count}',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      child: Text('Increment'),
                      onPressed: () => counter.increment(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Theme'),
                    SizedBox(height: 16.0),
                    Text(
                      themeProvider.isDarkMode ? 'Dark Mode' : 'Light Mode',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Text('This is the detail screen'),
      ),
    );
  }
}
