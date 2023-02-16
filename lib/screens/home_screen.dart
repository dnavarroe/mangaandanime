
import 'package:animes_and_manga/providers/anime_providers.dart';
import 'package:animes_and_manga/search/search_delegate.dart';
import 'package:animes_and_manga/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final animesProviders = Provider.of<AnimesProviders>(context);

    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Animes & Manga'),),
        actions: [
          IconButton(
            onPressed: ()=> showSearch(context: context, delegate: AnimeSearchDelegate()), 
            icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  [ 
            CardSwiper(animes: animesProviders.onDisplayAnimes,),
            AnimeSlider(categoria: 'Top Animes', animes: animesProviders.onTopAnimes, onNextPage: ()=> animesProviders.getTopAnimes(),),
            AnimeSlider(categoria: 'Top Mangas', animes: animesProviders.onTopMangas, onNextPage: ()=> animesProviders.getTopMangas()),
            AnimeSlider(categoria: 'Top Manhwa', animes: animesProviders.onTopManhwas, onNextPage: ()=> animesProviders.getTopManhwas()),
            AnimeSlider(categoria: 'Top Doujin', animes: animesProviders.onTopDoujin, onNextPage: ()=> animesProviders.getTopDoujin())
          ],
        ),
      ),
    );
  }
}