import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String imgUrl;

  const Movie({required this.id, required this.imgUrl});
  
  @override
  List<Object?> get props => [
    id,
    imgUrl
  ];
}
