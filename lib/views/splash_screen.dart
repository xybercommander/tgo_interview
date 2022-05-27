import 'package:flutter/material.dart';
import 'package:interview/data/helper/shared_preferences.dart';
import 'package:interview/views/home_page.dart';
import 'package:interview/views/sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {  

  initLoading() async {
    bool? isUserLoggedIn = await SharedPref.getLogin();
    Future.delayed(Duration(seconds: 2), () {
      if(isUserLoggedIn == false || isUserLoggedIn == null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage(),));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      }
    });
  }

  @override
  void initState() {
    initLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}