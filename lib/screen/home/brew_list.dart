import 'package:flutter/material.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    //print(brews.documents);
    brews.forEach((brew) {
      print(brew.favour);
      print(brew.mixture);
      print(brew.name);
      print(brew.noOfScoops);
    });
    return Container();
  }
}
