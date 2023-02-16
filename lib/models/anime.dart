

import 'dart:convert';

class Anime {
  Map<String, dynamic> errormoment = {
      "medium": "https://api-cdn.myanimelist.net/images/manga/3/100065.jpg",
      "large": "https://api-cdn.myanimelist.net/images/manga/3/100065l.jpg"
    };
    Anime({
        required this.id,
        required this.title,
        this.mainPicture,
        required this.alternativeTitles,
        //required this.startDate,
        //required this.endDate,
        required this.synopsis,
        required this.mean,
        //required this.rank,
        required this.popularity,
        required this.numListUsers,
        required this.numScoringUsers,
        required this.nsfw,
        //required this.createdAt,
        //required this.updatedAt,
        required this.mediaType,
        required this.status,
        //required this.genres,
        //required this.numEpisodes,
        //required this.startSeason,
        //this.broadcast,
        //required this.source,
        //required this.averageEpisodeDuration,
        //required this.rating,
        //required this.studios,
    });

    int id;
    String title;
    Map<String, dynamic>? mainPicture;
    AlternativeTitles alternativeTitles;
    //DateTime startDate;
    //DateTime endDate;
    String synopsis;
    double mean;
    //int rank;
    int popularity;
    int numListUsers;
    int numScoringUsers;
    String nsfw;
    //DateTime createdAt;
    //DateTime updatedAt;
    String mediaType;
    String status;
    //List<String> genres;
    //int numEpisodes;
    //String startSeason;
    //String? broadcast;
    //String source;
    //int averageEpisodeDuration;
    //String rating;
    //List<String> studios;
    
    get fullPosterImg{
      if ( mainPicture != null) {
        return true;
      }
      return false;
    }
    
    factory Anime.fromJson(String str) => Anime.fromMap(json.decode(str));

    factory Anime.fromMap(Map<String, dynamic> json) => Anime(
        id            : json["id"],
        title         : json["title"],
        mainPicture   : json["main_picture"],
        alternativeTitles : AlternativeTitles.fromMap(json["alternative_titles"]),
        //startDate         : DateTime.parse(json["start_date"]),
        //endDate           : DateTime.parse(json["end_date"]),
        synopsis          : json["synopsis"],
        mean: json["mean"]?.toDouble(),
        //rank: json["rank"],
        popularity  : json["popularity"],
        numListUsers: json["num_list_users"],
        numScoringUsers: json["num_scoring_users"],
        nsfw           : json["nsfw"]!,
        //createdAt      : DateTime.parse(json["created_at"]),
        //updatedAt      : DateTime.parse(json["updated_at"]),
        mediaType      : json["media_type"]!,
        status         : json["status"]!,
        //genres       : List<String>.from(json["genres"]),
        //numEpisodes    : json["num_episodes"],
        //startSeason  : json["start_season"],
        //broadcast    : json["broadcast"] ,
        //source         : json["source"]!,
        //averageEpisodeDuration: json["average_episode_duration"],
        //rating                : json["rating"]!,
        //studios             : List<String>.from(json["studios"]),
    );
}

class AlternativeTitles {
    AlternativeTitles({
        required this.synonyms,
        required this.en,
        required this.ja,
    });

    List<String> synonyms;
    String en;
    String ja;

    factory AlternativeTitles.fromJson(String str) => AlternativeTitles.fromMap(json.decode(str));

    factory AlternativeTitles.fromMap(Map<String, dynamic> json) => AlternativeTitles(
        synonyms: List<String>.from(json["synonyms"].map((x) => x)),
        en: json["en"],
        ja: json["ja"],
    );
}


//class MainPicture {
//    MainPicture({
//        required this.medium,
//        required this.large,
//    });
//
//    String medium;
//    String large;
//
//    factory MainPicture.fromJson(String str) => MainPicture.fromMap(json.decode(str));
//
//    factory MainPicture.fromMap(Map<String, dynamic> json) => MainPicture(
//        medium: json["medium"],
//        large: json["large"],
//    );
//}