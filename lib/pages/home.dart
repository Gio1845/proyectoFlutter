import 'package:flutter/material.dart';
import 'package:proyecto1/models/band.dart';
import 'package:flutter/cupertino.dart';
class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {

  List<Band> bands = [
    Band(id: '1', name: 'Metalica', votes: 5),
    Band(id: '2', name: 'Queen', votes: 1),
    Band(id: '3', name: 'Heroes del silencio', votes: 2),
    Band(id: '4', name: 'Bon Jovi', votes: 5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames', style: TextStyle( color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (context, i) => _bandTile(bands[i])
          ),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add ),
        elevation: 1,
        onPressed: addNewBand
    ),
      );
  }
  Widget _bandTile(Band band){
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){

      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Delete Band', style: TextStyle(color: Colors.white) ),
        ),
      ),
      child: ListTile(
      leading: CircleAvatar(
        child: Text(band.name.substring(0,2)),
        backgroundColor: Colors.blue[100],
      ),
        title: Text(band.name),
        trailing: Text('${ band.votes}', style: TextStyle(fontSize: 20) ),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }
  addNewBand() {

    final textController = new TextEditingController();

    showDialog(
        context: context,
    builder: (context){
        return  AlertDialog(
          title: Text('New band name:'),
          content: TextField(
            controller: textController,
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('Add'),
              elevation: 5,
              textColor: Colors.blue,
              onPressed: () => addBandToList( textController.text)
            )
          ],
        );
      },
    );
  }
  
    void addBandToList( String name) {
    print(name);
    if( name.length > 1){
      this.bands.add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
    }
}
