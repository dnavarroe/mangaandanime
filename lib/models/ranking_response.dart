

import 'dart:convert';
import 'anime.dart';

class RankingResponse {
    RankingResponse({
        required this.results,
    });

    List<Datum> results;

    factory RankingResponse.fromJson(String str) => RankingResponse.fromMap(json.decode(str));

    factory RankingResponse.fromMap(Map<String, dynamic> json) => RankingResponse(
        results: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );
}

class Datum {
    Datum({
        required this.node,
    });

    Anime node;

    factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        node: Anime.fromMap(json["node"]),
    );
}











