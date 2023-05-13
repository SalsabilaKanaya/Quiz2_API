import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card and Routing Example',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
        '/settings': (context) => SettingsPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/details');
                },
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text('Go to Details Page'),
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text('Go to Settings Page'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Center(
        child: Text('This is the Details Page'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Center(
        child: Text('This is the Settings Page'),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: Center(
        child: Text('This is the About Page'),
      ),
    );
  }
}
