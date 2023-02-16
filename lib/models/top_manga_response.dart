

import 'dart:convert';
import 'models.dart';

class TopMangaResponse {
    TopMangaResponse({
        required this.results,
    });

    List<Datum> results;

    factory TopMangaResponse.fromJson(String str) => TopMangaResponse.fromMap(json.decode(str));

    factory TopMangaResponse.fromMap(Map<String, dynamic> json) => TopMangaResponse(
        results: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );
}

