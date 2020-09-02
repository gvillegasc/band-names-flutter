import 'dart:io';

import 'package:band_names/src/models/band_model.dart';
import 'package:flutter/cupertino.dart';
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
          onPressed: addNewBand,
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

  addNewBand() {
    final textController = new TextEditingController();
    if (Platform.isAndroid) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('New band name:'),
              content: TextField(
                controller: textController,
              ),
              actions: <Widget>[
                MaterialButton(
                  child: Text('Add'),
                  elevation: 6,
                  textColor: Color(0xff17202A),
                  onPressed: () => addBandToList(textController.text),
                )
              ],
            );
          });
    }
    showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text('New band name:'),
            content: CupertinoTextField(
              controller: textController,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Add'),
                onPressed: () => addBandToList(textController.text),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text('Dismiss'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  void addBandToList(String name) {
    if (name.length > 1) {
      setState(() {
        this.bands.add(
            new BandModel(id: DateTime.now().toString(), name: name, votes: 0));
      });
    }
    Navigator.pop(context);
  }
}
