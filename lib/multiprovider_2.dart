import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/category1': (context) => CategoryPage(categoryName: 'Category 1'),
        '/category2': (context) => CategoryPage(categoryName: 'Category 2'),
        '/category3': (context) => CategoryPage(categoryName: 'Category 3'),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: 'Category 1'),
        Provider.value(value: 'Category 2'),
        Provider.value(value: 'Category 3'),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
          children: [
            CategoryCard(),
            CategoryCard(),
            CategoryCard(),
          ],
        ),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String categoryName;

  CategoryPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text(categoryName),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryName = Provider.of<String>(context);

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/${categoryName.toLowerCase().replaceAll(' ', '')}');
        },
        child: Container(
          width: double.infinity,
          height: 100,
          alignment: Alignment.center,
          child: Text(categoryName),
        ),
      ),
    );
  }
}
