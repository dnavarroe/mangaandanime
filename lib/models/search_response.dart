
import 'dart:convert';
import 'package:animes_and_manga/models/models.dart';

class SearchResponse {
    SearchResponse({
        required this.results,
    });

    List<Datum> results;

    factory SearchResponse.fromJson(String str) => SearchResponse.fromMap(json.decode(str));

    factory SearchResponse.fromMap(Map<String, dynamic> json) => SearchResponse(
        results: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );
}

