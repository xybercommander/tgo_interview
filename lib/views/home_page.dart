import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:interview/data/helper/shared_preferences.dart';
import 'package:interview/data/services/auth.dart';
import 'package:interview/data/services/database.dart';
import 'package:interview/views/sign_in_page.dart';
import 'package:provider/provider.dart';

import '../data/providers/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AuthMethods authMethods = AuthMethods();
  DatabaseMethods databaseMethods = DatabaseMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Recipes'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              authMethods.signOut();
              SharedPref.saveLogin(false);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage(),));
            }, 
            icon: Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: databaseMethods.getRecipes(),
          builder: (context, snapshot) {
            
            if(!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: ListTile(                           
                      contentPadding: EdgeInsets.all(8),             
                      // leading: CircleAvatar(
                      //   backgroundColor: Colors.white,
                      //   backgroundImage: NetworkImage((snapshot.data! as QuerySnapshot).docs[index]['image_url']),
                      //   radius: 30,
                      // ),
                      // leading: Image.network((snapshot.data! as QuerySnapshot).docs[index]['image_url']),
                      title: Text((snapshot.data! as QuerySnapshot).docs[index]['title'].toString()),
                      // subtitle: Text("Calories: ${(snapshot.data! as QuerySnapshot).docs[index]['calories']}"),
                    ),
                  );
                },
              );
            }            
          }
        ),
      ),
    );
  }
}