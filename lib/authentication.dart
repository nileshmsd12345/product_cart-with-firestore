import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_another_app/allOperations.dart';
import 'home_screen.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.black,
        title: Text('Google Sign-in'),
        centerTitle: true,
      ),

      body: Center(
        child: FlatButton(
          onPressed: () {
            Provider.of<AllOperation>(context, listen: false).signinWithGoogle();
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeScreen()));
          },
          child: Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            child: Center(child: Text("Sign-in with Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
          ),
        ),
      ),
    );
  }
}
