import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future<void> updateUserData(String favour, String name, int noOfscoop,int mixture) async {
    return await brewCollection.document(uid).setData({
      'favour': favour,
      'name': name,
      'noOfscoop': noOfscoop,
      'mixture' :mixture,
    });
  }
//get brews stream

Stream<QuerySnapshot> get brews{
  return brewCollection.snapshots();
}
}