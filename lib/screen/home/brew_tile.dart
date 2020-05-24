import 'package:flutter/material.dart';
import 'package:brew_crew/models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;

  BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    var listTile = ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.pink[brew.noOfScoops],
          ),
          title: Text(brew.name),
         // if(brew.mixture>0) ? brew.mixture : 0; 
          subtitle: Text('Want Flavour ${brew.favour} and mixture ${brew.mixture}'),
        );
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: listTile,
      ),
    );
  }
}
