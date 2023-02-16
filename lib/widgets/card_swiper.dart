
import 'package:animes_and_manga/models/models.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';


class CardSwiper extends StatelessWidget {

  final List<Datum> animes;

  const CardSwiper({super.key, required this.animes});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if (animes.isEmpty){
      return SizedBox(
        width: double.infinity,
        height: size.height*0.5,
        child: const Center(child: CircularProgressIndicator()),

      );
    }

    return SizedBox(
          height: size.height*0.5,
          width: double.infinity,
          child: Swiper(
            itemCount: animes.length,
            itemHeight: size.height*0.4,
            itemWidth: size.width*0.6,
            layout: SwiperLayout.STACK,
            itemBuilder: (_, index) {

              final anime = animes[index].node;
              String imagen = 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png';
              if (anime.fullPosterImg){
              imagen = anime.mainPicture!['large']!;
              }
              


              return  GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'details', arguments: anime),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:   FadeInImage(
                    placeholder: const AssetImage('assets/loading.gif'), 
                    image: NetworkImage(imagen),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            ),
        );
  }
}