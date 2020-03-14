import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'detect2.dart';

class Login extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }

}

class LoginState extends State<Login>
{
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  String _welcomeString = "";

  void _erase()
  {
    setState(() {
      _userController.clear();
      _passController.clear();
    });
  }

  void _showWelcome()
  {
    setState(() {
      if(_userController.text.isNotEmpty
          && _passController.text.isNotEmpty) {

        _welcomeString = _userController.text;
      }
      else
      {
        _welcomeString = "Nothing!";
      }
    });
  }

  final logo = Hero(
    tag: 'Vet My Pet',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 48.0,
      child: Image.asset('images/login.png',width: 200.0,),
    ),
  );

  final email = TextFormField(
    keyboardType: TextInputType.emailAddress,
    style: new TextStyle(color: Colors.white),
    autofocus: false,
    initialValue: "",
    cursorColor: Colors.white,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.email,color: Colors.white,),
      prefixStyle: const TextStyle(color: Colors.white),
      suffixStyle: const TextStyle(color: Colors.white),
      hintText: 'johnsmith@mail.com',
      hintStyle: TextStyle(color: Colors.white),
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
          borderSide: new BorderSide(color: Colors.white)),
    ),
  );

  final password = TextFormField(
    style: new TextStyle(color: Colors.white),
    autofocus: false,
    initialValue: '',
    cursorColor: Colors.white,
    obscureText: true,
    decoration: InputDecoration(
      focusColor: Colors.white,
      prefixIcon: Icon(Icons.lock,color: Colors.white),
      prefixStyle: const TextStyle(color: Colors.white),
      suffixStyle: const TextStyle(color: Colors.white),
      hintText: 'Password',
      hintStyle: TextStyle(color: Colors.white),
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
          borderSide: new BorderSide(color: Colors.white)),
    ),
  );

  final forgot = FlatButton(
    child: Text(
      'Forgot Password?',
      style: TextStyle(color: Colors.white),
    ),
    onPressed: () {},
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF217872),
                  Color(0xFF176F84),
                ]
            )
        ),

        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 18.0,),
            forgot,

              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/vet');
                },
                padding: EdgeInsets.all(12),
                color: Colors.white,
                child: Text('Sign In', style: TextStyle(color: Color(0xFF176F84))),
              ),
          FlatButton(
            child: Text(
              'New to Vet My Pet? Sign Up',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/signUp');
            },
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/vet');
            },
            child: Text(
              'Skip & Continue to Vet My Pet',
              style: TextStyle(color: Colors.white),
            ),

          ),
          ],
        ),
      ),
    );
  }

}