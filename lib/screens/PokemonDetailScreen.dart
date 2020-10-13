import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/PokemonDetail.dart';
import 'package:pokedex/services/ServiceLocator.dart';
import 'package:pokedex/viewmodels/PokemonDetailViewModel.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonDetailScreen  extends StatefulWidget{
  PokemonDetailScreen(this.id,{this.pokemon});
  final id;
  final PokemonDetail pokemon;
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState  extends State<PokemonDetailScreen>{


  PokemonDetailViewModel model = serviceLocator<PokemonDetailViewModel>();



  @override
  void initState() {
    super.initState();
    model.loadPokemonDetail(widget.id);
  }

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
          child: Center(
            child: Stack(
            children: [
              Image.asset("assets/pokeball-png.png",height: 110,width: 70,),
              Card(
                margin: EdgeInsets.only(left: 10,right: 10,bottom: 10,top:200),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                elevation: 10.0,
                child:SingleChildScrollView(
                  child:Column(
                    children: [
                      _buildDetails(model)
                    ],
                ),
              )
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    SizedBox(height: 100,),
                    CachedNetworkImage(
                      imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.id}.png",
                      height: 250,
                    )]),
            ],
          ),
          ),
        ),

    );
  }

  _buildDetails(PokemonDetailViewModel viewModel){
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<PokemonDetailViewModel>(
        builder: (context,model, child)=> SingleChildScrollView(
          child:  Column(
              children: model.pokemonDetail.types==null? [
                Container(width:MediaQuery.of(context).size.width, height: 200,
                    child: Center(
                        child:CircularProgressIndicator()))] :_buildWidgets(model),
            ) ,
        ),
      ),
    );
  }

  _buildWidgets(PokemonDetailViewModel model){
    List<Widget> widgets=[];
    widgets.add(SizedBox(height: 40,));
    widgets.add(Text(model.pokemonDetail.name??" ", style: TextStyle(
        color: Colors.grey[800],
        fontWeight: FontWeight.bold,
        fontSize: 30),));
    widgets.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Height: ${model.pokemonDetail.height}", style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.normal,
            fontSize: 20),),
        SizedBox(width: 15,),
        Text("Weight: ${model.pokemonDetail.weight}", style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.normal,
            fontSize: 20),),
      ],));
    widgets.add(Text("Abilities:",textAlign: TextAlign.start, style: TextStyle(
        color: Colors.grey[800],
        fontWeight: FontWeight.bold,
        fontSize: 22),),);
     List<Widget> abilities=[];
   model.pokemonDetail.abilities?.forEach((e) {
     abilities.add(Text(
       "*${e.ability.name}", textAlign: TextAlign.start, style: TextStyle(
         color: Colors.grey[800],
         fontWeight: FontWeight.normal,
         fontSize: 20),));
   });
   widgets.add(Wrap(
     children: abilities??Container(),
   ));
   List<Widget> moves =[];
   widgets.add(Text("Moves:",textAlign: TextAlign.start, style: TextStyle(
       color: Colors.grey[800],
       fontWeight: FontWeight.bold,
       fontSize: 22),));
    model.pokemonDetail.moves?.forEach((e) => moves.add(Text("*${e.move.name}",textAlign: TextAlign.start, style: TextStyle(
        color: Colors.grey[800],
        fontWeight: FontWeight.normal,
        fontSize: 20),)));
    widgets.add(Wrap(
      children: moves??Container(),
    ));
    List<Widget> types =[];
    widgets.add(Text("Types:",textAlign: TextAlign.start, style: TextStyle(
        color: Colors.grey[800],
        fontWeight: FontWeight.bold,
        fontSize: 22),));
    model.pokemonDetail.types?.forEach((e) => types.add(Text("*${e.type.name}",textAlign: TextAlign.start, style: TextStyle(
        color: Colors.grey[800],
        fontWeight: FontWeight.normal,
        fontSize: 20),)));
    widgets.add(Wrap(
      children: types??Container(),
    ));
    return widgets;
  }
}