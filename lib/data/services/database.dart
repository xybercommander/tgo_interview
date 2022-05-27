import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getRecipes() {
    return FirebaseFirestore.instance.collection('recipes').get();
  }
}