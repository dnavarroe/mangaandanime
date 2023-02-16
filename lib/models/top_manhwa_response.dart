

import 'dart:convert';
import 'models.dart';

class TopManhwaResponse {
    TopManhwaResponse({
        required this.results,
    });

    List<Datum> results;

    factory TopManhwaResponse.fromJson(String str) => TopManhwaResponse.fromMap(json.decode(str));

    factory TopManhwaResponse.fromMap(Map<String, dynamic> json) => TopManhwaResponse(
        results: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );
}

