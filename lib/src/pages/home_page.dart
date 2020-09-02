import 'package:band_names/src/models/band_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BandModel> bands = [
    BandModel(id: '1', name: 'The Score', votes: 8),
    BandModel(id: '2', name: 'Artic Monkeys', votes: 4),
    BandModel(id: '3', name: 'The Weeknd', votes: 4),
    BandModel(id: '4', name: 'Centella', votes: 2),
    BandModel(id: '5', name: 'Daft Punk', votes: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BandName",
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xff17202A),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          elevation: 1,
          backgroundColor: Color(0xff17202A),
          onPressed: () {},
        ),
        body: ListView.builder(
            itemCount: bands.length,
            itemBuilder: (context, i) => _bandTile(bands[i])));
  }

  ListTile _bandTile(BandModel band) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(band.name.substring(0, 2)),
        backgroundColor: Colors.blue[100],
      ),
      title: Text(band.name),
      trailing: Text(
        "${band.votes}",
        style: TextStyle(fontSize: 15),
      ),
      onTap: () {
        print(band.name);
      },
    );
  }
}
