import "package:flutter/material.dart";
import "card-class.dart";

class Collection extends StatefulWidget {
  Collection({Key key}) : super(key: key);

  @override
  _Collection createState() => _Collection();
}

class _Collection extends State<Collection> {

  // List<CardClass> allCards = new List<CardClass>().add(CardClass(cardID: 123, cardText: "hi", isDefault: true, isFavorite: false));
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Collection"),
      ),
      body: Center(
        child: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/images/noleaves2.png'),
            ),
          ),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
