import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => DetailPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: [
          CardWidget(
            title: 'Card 1',
            description: 'Description for Card 1',
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: '1');
            },
          ),
          CardWidget(
            title: 'Card 2',
            description: 'Description for Card 2',
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: '2');
            },
          ),
          CardWidget(
            title: 'Card 3',
            description: 'Description for Card 3',
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: '3');
            },
          ),
          CardWidget(
            title: 'Card 4',
            description: 'Description for Card 4',
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: '4');
            },
          ),
          CardWidget(
            title: 'Card 5',
            description: 'Description for Card 5',
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: '5');
            },
          ),
          CardWidget(
            title: 'Card 6',
            description: 'Description for Card 6',
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: '6');
            },
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    final id = args ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Text('Details for card $id'),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onTap;

  CardWidget({
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
