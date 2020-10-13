import 'package:flutter/material.dart';
import 'package:pokedex/screens/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WelcomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
        child: Container(
          margin: EdgeInsets.all(50),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              GestureDetector(
                child: Text("Lets Start!!--->", style: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),),
                onTap: ()=> _goToLogin(context),
              ),
              Center(
                child: Column(
                  children: [
                    Text("All your Pokemon in an app!!", style: TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 30),),
                    SizedBox(height: 150,),
                    Image.asset("assets/pokemon-pokedex.png"),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  _goToLogin(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
  }
}