



import 'dart:convert';
import 'models.dart';

class TopAnimeResponse {
    TopAnimeResponse({
        required this.results,
    });

    List<Datum> results;

    factory TopAnimeResponse.fromJson(String str) => TopAnimeResponse.fromMap(json.decode(str));

    factory TopAnimeResponse.fromMap(Map<String, dynamic> json) => TopAnimeResponse(
        results: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );

}