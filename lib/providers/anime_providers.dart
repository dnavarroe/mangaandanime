

import 'dart:async';

import 'package:animes_and_manga/helpers/debouncer.dart';
import 'package:animes_and_manga/models/models.dart';
import 'package:animes_and_manga/models/search_response.dart';
import 'package:animes_and_manga/models/top_doujin_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnimesProviders extends ChangeNotifier{

  final String _xmalclienteid    = '6fefc7fd411e7eccc44070406648b3d5';
  final String _baseurl   = 'api.myanimelist.net';
  final String _fields    = 'id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics';

  List<Datum> onDisplayAnimes = [];
  List<Datum> onTopAnimes = [];
  List<Datum> onTopMangas = [];
  List<Datum> onTopManhwas = [];
  List<Datum> onTopDoujin = [];

  int _topManganum = 10;
  int _topAnimenum = 10;
  int _topManhwanum = 10;
  int _topDoujinnum = 10;

  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
  );

  final StreamController<List<Datum>> _suggestionStreamController = StreamController();
  Stream<List<Datum>> get suggestionStream => _suggestionStreamController.stream;



  AnimesProviders(){

    getOnDisplayAnimes();
    getTopAnimes();
    getTopMangas();
    getTopManhwas();
    getTopDoujin();

  }

  Future<String> _getJsonData(String endpoint,String type, [int limit=10]) async{
    final url = Uri.https(_baseurl, endpoint, 
    {'ranking_type': type,
     'limit': '$limit',
     'fields' : _fields
    });

    final response = await http.get(url, headers: {'X-MAL-CLIENT-ID':_xmalclienteid});
    return response.body;
  }

  getOnDisplayAnimes() async{
    final jsonData = await _getJsonData('v2/anime/ranking','all');
    final ranking = RankingResponse.fromJson(jsonData);
    
    onDisplayAnimes = ranking.results;
    notifyListeners();
  }

  getTopAnimes() async{
    _topAnimenum++;
    final jsonData = await _getJsonData('v2/anime/ranking','favorite',_topAnimenum);
    final topAnimes = TopAnimeResponse.fromJson(jsonData);
    
    onTopAnimes = [ ...onTopAnimes, ...topAnimes.results ];
    notifyListeners();
  }

  getTopMangas() async{
    _topManganum++;
    final jsonData = await _getJsonData('v2/manga/ranking','manga',_topManganum);
    final topMangas = TopMangaResponse.fromJson(jsonData);
    
    onTopMangas = [ ...onTopMangas, ...topMangas.results ];
    notifyListeners();

  }

  getTopManhwas() async{
    _topManhwanum++;
    final jsonData = await _getJsonData('v2/manga/ranking','manhwa',_topManhwanum);
    final topManhwas = TopMangaResponse.fromJson(jsonData);
    
    onTopManhwas = [ ...onTopManhwas, ...topManhwas.results ];
    notifyListeners();
  }

  getTopDoujin() async{
    _topDoujinnum++;
    final jsonData = await _getJsonData('v2/manga/ranking','doujin',_topDoujinnum);
    final topDoujin = TopDoujinResponse.fromJson(jsonData);
    
    onTopDoujin = [ ...onTopDoujin, ...topDoujin.results ];
    notifyListeners();
  }

  Future<List<Datum>> searchAnimes(String query) async{
    final url = Uri.https(_baseurl, 'v2/anime', 
    {
     'q': query,
     'fields' : _fields
    });
    final response = await http.get(url, headers: {'X-MAL-CLIENT-ID':_xmalclienteid});
    final searchResponse = SearchResponse.fromJson( response.body);
    return searchResponse.results;

  }

  void getSuggestionByQuery( String searchTerm){

    debouncer.value='';
    debouncer.onValue= (value) async{
      final results = await searchAnimes(value);
      _suggestionStreamController.add(results);
    };
    final timer = Timer.periodic(Duration(milliseconds: 300), (_) { 
      debouncer.value=searchTerm;
    });

    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());

  }
}