import 'package:flutter/material.dart';

import 'package:band_names_app/src/models/band.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 99),
    Band(id: '2', name: 'Megadeth', votes: 66),
    Band(id: '3', name: 'Slayer', votes: 11),
    Band(id: '4', name: 'AC/DC', votes: 23),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Band Names',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) => _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        child: Icon(Icons.add),
        elevation: 1,
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {},
      background: Container(
          padding: EdgeInsets.only(left: 8),
          color: Colors.redAccent,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 28,
              ))),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${band.name.substring(0, 2)}'),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {},
      ),
    );
  }

  addNewBand() {
    final textController = new TextEditingController();

    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Band Name:'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              content: TextField(
                controller: textController,
              ),
              actions: <Widget>[
                MaterialButton(
                    child: Text('Cancel'),
                    elevation: 5,
                    textColor: Colors.redAccent,
                    onPressed: () => addBandToList(textController.text)),
                MaterialButton(
                    child: Text('Add'),
                    elevation: 5,
                    textColor: Colors.blueAccent,
                    onPressed: () => addBandToList(textController.text))
              ],
            ));
  }

  void addBandToList(String name) {
    if (name.trim().length != 0) {
      setState(() {});
      this.bands.add(Band(id: DateTime.now().toString(), name: name, votes: 0));
    }

    Navigator.pop(context);
  }
}
