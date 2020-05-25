import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future<void> updateUserData(
      String favour, String name, int noOfscoop, int mixture) async {
    return await brewCollection.document(uid).setData({
      'favour': favour,
      'name': name,
      'noOfscoop': noOfscoop,
      'mixture': mixture,
    });
  }

//brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        favour: doc.data['favour'] ?? '',
        mixture: doc.data['mixture'] ?? 100,
        noOfScoops: doc.data['noOfscoop'] ?? 100,
        name: doc.data['name'] ?? '',
      );
    }).toList();
  }
  //userdata from Snapshot

UserData _userDatafromSnapshot(DocumentSnapshot snapshot)
{
  return UserData(
    uid: uid,
    name:snapshot.data['name'],
    falvour: snapshot.data['falvour'],
    noOfscoop: snapshot.data['noOfscoop'],
    mixture: snapshot.data['mixture'],
  );
}


//get brews stream

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }



  //get user doc system

  Stream<UserData> get userData{
    return brewCollection.document(uid).snapshots().map(_userDatafromSnapshot);
  }
}
