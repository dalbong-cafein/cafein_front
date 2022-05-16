import 'package:cafein_front/Map/SearchScreen.dart';
import 'dart:convert';
class SearchCafe{
  final int storeId;
  final String storeName;
  SearchCafe({required this.storeId, required this.storeName});
  factory SearchCafe.fromJson(Map<String, dynamic> json){
    return new SearchCafe(
      storeId: json['id'],
      storeName: json['storeName']
    );
  }
}
class SearchCafeList{
  final List<SearchCafe> SearchCafes;
  SearchCafeList({required this.SearchCafes});
  factory SearchCafeList.fromJson(List<dynamic> parsedJson){
    List<SearchCafe> SearchCafes = <SearchCafe>[];
    return new SearchCafeList(SearchCafes: SearchCafes);
  }
}