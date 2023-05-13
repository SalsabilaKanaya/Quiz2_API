import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DaftarUmkm {
  String nama;
  String jenis;
  DaftarUmkm({required this.nama, required this.jenis});
}

class jenis {
  List<DaftarUmkm> ListPop = <DaftarUmkm>[];

  jenis(Map<String, dynamic> json) {
    // isi listPop disini
    var data = json["data"];
    for (var val in data) {
      var nama = val["nama"]; //thn dijadikan int
      var jenis = val["jenis"]; //pouliasi sudah int
      ListPop.add(DaftarUmkm(nama: nama, jenis: jenis));
    }
  }
  //map dari json ke atribut
  factory jenis.fromJson(Map<String, dynamic> json) {
    return jenis(json);
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<MyApp> {
  late Future<jenis> futurejenis;

  //https://datausa.io/api/data?drilldowns=Nation&measures=Population
  String url = "http://178.128.17.76:8000/daftar_umkm";

  //fetch data
  Future<jenis> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return jenis.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  @override
  void initState() {
    super.initState();
    futurejenis = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('My App'),
          ),
          body: Center(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  child: const Text('2001360,Salsabila Kanaya; 2009110,Sukma Julianti; Saya tidak akan berbuat curang data atau membantu orang lain berbuat curang'),
                  style: TextStyle(
                    fontSize: 15, color: Color.black
                  )
                )
              ],
            )
            child: FutureBuilder<jenis>(
              future: futurejenis,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    //gunakan listview builder
                    child: ListView.builder(
                      itemCount: snapshot
                          .data!.ListPop.length, //asumsikan data ada isi
                      itemBuilder: (context, index) {
                        return Container(
                            decoration: BoxDecoration(border: Border.all()),
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg', width: 80, height: 80,),
                                  SizedBox(width: 16),
                                  Text(snapshot.data!.ListPop[index].nama
                                      .toString()),
                                  Text(snapshot.data!.ListPop[index].jenis
                                      .toString()),
                                ]));
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ));
  }
}