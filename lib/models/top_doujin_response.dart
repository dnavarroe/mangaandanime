

import 'dart:convert';
import 'models.dart';

class TopDoujinResponse {
    TopDoujinResponse({
        required this.results,
    });

    List<Datum> results;

    factory TopDoujinResponse.fromJson(String str) => TopDoujinResponse.fromMap(json.decode(str));

    factory TopDoujinResponse.fromMap(Map<String, dynamic> json) => TopDoujinResponse(
        results: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );
}