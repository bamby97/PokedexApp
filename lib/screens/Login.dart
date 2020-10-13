import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/screens/DisplayPokemonsScreen.dart';

class Login  extends StatefulWidget{
  _LoginState createState() => _LoginState();
}

class _LoginState  extends State<Login>{

  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _email,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.email,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: _password,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.lock,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          _emailLogin(
              email: _email.text, password: _password.text, context: context);
        },
        padding: EdgeInsets.all(12),
        color: Colors.cyan,
        child: Text('SIGN IN', style: TextStyle(color: Colors.white)),
      ),
    );
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(

              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.lightBlueAccent,
                        Colors.tealAccent,
                        Colors.greenAccent,
                        Colors.limeAccent[100],

                      ]
                  )
              ),
              child: Column(

                children: [
                  SizedBox(height: 60),
                  Hero(
                      tag: "logo",
                      child: Image.asset("assets/PokemonLogo.png",height: 90,),),
                  SizedBox(height: 30),
                  Card(

                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    elevation: 10.0,
                    child: Container(
                      padding: EdgeInsets.only(left:20,right:20),
                      child: Column(
                        children: [
                          Image.asset("assets/pokeball-png.png",height: 90,width: 90,),
                          email,
                          SizedBox(height: 10,),
                          password,
                          SizedBox(height: 20,),
                          loginButton
                        ],
                      ),
                    )
                  )
                ],
              )
          ),
        )
    );
  }

  _emailLogin({String email, String password, BuildContext context}){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayPokemon(),
      ),
    );
  }
}