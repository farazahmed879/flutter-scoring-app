import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AnimeService {
  final Dio _dio = Dio();
  final String _baseRoute = 'https://anime-facts-rest-api.herokuapp.com/api/v1';
  late Response<dynamic> _response;

  Future<List<dynamic>> getAllAnimes() async {
    List<dynamic> _animes = [];
    try {
      _response = await _dio.get(_baseRoute);

      if (_response.data['success'] == true) {
        _animes = _response.data['data'].map<dynamic>((anime) => anime).toList();
      }
    } catch (error, trace) {
      if (kDebugMode) {
        print('Error caught while getting anime list: $trace');
      }
    }
    return _animes;
  }
}