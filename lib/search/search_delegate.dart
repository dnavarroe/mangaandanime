
import 'package:animes_and_manga/models/models.dart';
import 'package:animes_and_manga/providers/anime_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeSearchDelegate extends SearchDelegate{

  @override
  String get searchFieldLabel => 'Buscar Anime';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query='';
      }, 
      icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){close(context, null);}, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('hola mundo');
  }

  Widget _emptyContainer(){
    return Container(
        child: const Center(child: Icon(Icons.local_movies, color: Colors.black38, size: 130,)),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return _emptyContainer();
    }

    final animeProvider = Provider.of<AnimesProviders>(context, listen: false);
    animeProvider.getSuggestionByQuery(query);

    return StreamBuilder(
      builder: (_, AsyncSnapshot<List<Datum>> snapshot) {
        if (snapshot.hasData) return _emptyContainer();
        final animes = snapshot.data;
        if (animes==null) return _emptyContainer();
        return ListView.builder(
          itemCount: animes.length,
          itemBuilder: (_, index) => _AnimeItem(anime: animes[index])
        );
      },
      stream: animeProvider.suggestionStream
    );
  }

}

class _AnimeItem extends StatelessWidget {
  final Datum anime;
  const _AnimeItem({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {

    String imagen = 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png';
    if (anime.node.fullPosterImg){
    imagen = anime.node.mainPicture!['large']!;
    }

    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage('assets/loading.gif'),
        image: NetworkImage(imagen),
        width: 50,
        fit: BoxFit.contain,
      ),
    );
  }
}