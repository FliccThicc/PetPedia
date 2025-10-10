// lib/services/database_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // The user's unique ID, like their membership number.
  // We need this to know who owns which pet.
  final String uid;
  DatabaseService({required this.uid});

  // A reference to our 'pets' collection in the database.
  // Think of this as the main drawer in our filing cabinet labeled "Pets".
  final CollectionReference petCollection = FirebaseFirestore.instance.collection('pets');

  // Add a new pet's information to the filing cabinet.
  Future<void> addPet(String name, String breed, int age) async {
    // We create a new document (a file) inside the "Pets" drawer.
    return await petCollection.add({
      'name': name,
      'breed': breed,
      'age': age,
      'owner_uid': uid, // IMPORTANT: We label the file with the owner's ID!
    });
  }

  // This will be used later to get a list of pets for the logged-in user.
  Stream<QuerySnapshot> get pets {
    return petCollection.where('owner_uid', isEqualTo: uid).snapshots();
  }
}