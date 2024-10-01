import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seeflix_flutter/core/costant/constant.dart';
import 'package:seeflix_flutter/data/datasources/movie_datasource.dart';
import 'package:seeflix_flutter/data/mapper/movie_mapper.dart';
import 'package:seeflix_flutter/data/models/movie.dart';

class MovieDatasourceImpl implements MovieDatasource {
  final http.Client client;

  MovieDatasourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<MovieModel> movieList = data['results'];

      return MovieMapper.fromJsonList(movieList);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<MovieModel> movieList = data['results'];

      return MovieMapper.fromJsonList(movieList);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<MovieModel> movieList = data['results'];

      return MovieMapper.fromJsonList(movieList);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<List<MovieModel>> getUpcoming() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<MovieModel> movieList = data['results'];

      return MovieMapper.fromJsonList(movieList);
    } else {
      throw Exception('Failed to load movies');
    }
  }
  
}