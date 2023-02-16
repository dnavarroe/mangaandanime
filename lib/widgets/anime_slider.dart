

import 'package:flutter/material.dart';
import '../models/models.dart';

class AnimeSlider extends StatefulWidget {
  final List<Datum> animes;
  final String categoria;
  final Function onNextPage;
  const AnimeSlider({super.key, required this.categoria, required this.animes, required this.onNextPage});

  @override
  State<AnimeSlider> createState() => _AnimeSliderState();
}

class _AnimeSliderState extends State<AnimeSlider> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels>=scrollController.position.maxScrollExtent-800){
        widget.onNextPage();
      }
    });

  }

  @override
  void dispose() {






    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [

          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(widget.categoria, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),

          const SizedBox(height: 5,),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.animes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final anime = widget.animes[index];
                return _AnimeSliderImg(anime: anime, heroId: '${anime.node.title}-${index}-${anime.node.id}',);
              }
            ),
          )
        ],

      ),
    );
  }
}

class _AnimeSliderImg extends StatelessWidget {
  final Datum anime;
  final String heroId;
  const _AnimeSliderImg({required this.anime, required this.heroId});

  
  @override
  Widget build(BuildContext context) {

    anime.node.heroId = heroId;
    
    String imagen = 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png';
    if (anime.node.fullPosterImg){
    imagen = anime.node.mainPicture!['large']!;
    }
    String titulo = anime.node.title;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 190,
      width: 130,
      child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'details', arguments: anime.node),
                  child: Hero(
                    tag: anime.node.heroId!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                        placeholder: const AssetImage('assets/loading.gif'), 
                        image: NetworkImage(imagen),
                        fit: BoxFit.cover,
                        height: 190,
                        width: 130,
                      ),
                    ),
                  ),
                ),
                Text(titulo, overflow: TextOverflow.ellipsis,)
              ],
      ),
    );
  }
}