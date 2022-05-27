import 'package:flutter/material.dart';
import 'package:interview/data/helper/shared_preferences.dart';
import 'package:interview/data/providers/user_provider.dart';
import 'package:interview/data/services/auth.dart';
import 'package:interview/views/home_page.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  //------ VARIABLES ------//
  AuthMethods authMethods = AuthMethods();

  //------ METHODS ------//
  void googleSignIn() {
    authMethods.signInWithGoogle()
      .then((value) {
        Provider.of<UserProvider>(context, listen: false).setEmail(value!.additionalUserInfo!.profile!['email']);
        Provider.of<UserProvider>(context, listen: false).setUsername(value.additionalUserInfo!.profile!['given_name']);
        Provider.of<UserProvider>(context, listen: false).setImgUrl(value.additionalUserInfo!.profile!['picture']);

        SharedPref.saveLogin(true);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      });
  }

  //------ UI ------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: MaterialButton(
            onPressed: () => googleSignIn(),
            child: Text("Google Sign In", style: TextStyle(color: Colors.white),),
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}