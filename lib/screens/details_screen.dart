
import 'package:flutter/material.dart';

import '../models/models.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Anime anime = ModalRoute.of(context)!.settings.arguments as Anime;
    print(anime.title);


    return    Scaffold(
      body: CustomScrollView(
        slivers: [

          _AppbarMov(anime: anime,),

          SliverList(delegate: SliverChildListDelegate([
            _TitleAndPoster(anime: anime,),
            _Sipnosis(anime: anime,),
          ])),        
        ],
      )
    );
  }
}





class _TitleAndPoster extends StatelessWidget {

  final Anime anime;
  const _TitleAndPoster({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    String imagen = 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png';
    if (anime.fullPosterImg){
    imagen = anime.mainPicture!['large']!;
    }
    final size = MediaQuery.of(context).size;
    return Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                    child: Hero(
                      tag: anime.heroId!,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/loading.gif'), 
                          image: NetworkImage(imagen),
                          height: 150,),
                      ),
                    ),
                  ),
              
                  SizedBox(width: 20,),
              
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: size.width*0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(anime.title, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline5),
                        Text(anime.alternativeTitles.ja, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.subtitle1),
                        Row(
                          children: [
                            const Icon(Icons.star_border_purple500_sharp),
                            const SizedBox(width: 5,),
                            Text('${anime.mean}')
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
  }
}

class _Sipnosis extends StatelessWidget {
  final Anime anime;
  const _Sipnosis({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: double.infinity,
              child: Text(anime.synopsis, 
                  textAlign: TextAlign.justify),
    );
  }
}

class _AppbarMov extends StatelessWidget {
  final Anime anime;
  const _AppbarMov({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {

    String imagen = 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png';
    if (anime.fullPosterImg){
    imagen = anime.mainPicture!['large']!;
    }
    return  SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(vertical: 10),
              //title: Text(anime.title, style:  TextStyle(backgroundColor: Colors.amber ,color:Colors.cyanAccent[100] ,fontWeight: FontWeight.bold ),textAlign: TextAlign.center,),
              centerTitle: true,
              background: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'), 
                image: NetworkImage(imagen),
                fit: BoxFit.cover,),
            ),
          );
  }
}