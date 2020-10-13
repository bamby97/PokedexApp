
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/screens/PokemonDetailScreen.dart';
import 'package:pokedex/services/ServiceLocator.dart';
import 'package:pokedex/viewmodels/DisplayPokemonsViewModel.dart';
import 'package:pokedex/viewmodels/PokemonDetailViewModel.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
class DisplayPokemon  extends StatefulWidget{
  _DisplayPokemonState createState() => _DisplayPokemonState();
}

class _DisplayPokemonState  extends State<DisplayPokemon>{
  ScrollController scrollController;
  DisplayPokemonsViewModel model = serviceLocator<DisplayPokemonsViewModel>();

  @override
  void initState() {
      model.loadPokemons();
      scrollController= new ScrollController()..addListener(() {
        if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          model.loadPokemons();
        }
      });
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
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
              SizedBox(height: 30,),
              Hero(
                tag: "logo",
                child: Image.asset("assets/PokemonLogo.png",height: 50,),),
              Expanded(
                  child:buildGrid(model)
              )

            ],
          )//buildGrid(model),
        ),
      ),
    );
  }

  Widget buildGrid(DisplayPokemonsViewModel viewModel){
    return ChangeNotifierProvider(
        create: (context) => viewModel,
      child: Consumer<DisplayPokemonsViewModel>(
        builder: (context,model, child)=> GridView.builder(
          controller: scrollController,
            itemCount: model.pokemons.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:  2 ),
            itemBuilder: (context, index) {
              return new Card(
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                elevation: 10.0,
                child: GestureDetector(
                  child: Center(
                    child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${model.pokemons[index].id}.png",
                            height: 150,
                          ),
                          Text(model.pokemons[index].name, style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                        ]
                    ),
                  ),
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>PokemonDetailScreen(model.pokemons[index].id))),
                )
              );
            }),
      ),
    );
  }
}