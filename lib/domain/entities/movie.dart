import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String id;
  final String imgUrl;

  const Movie({required this.id, required this.imgUrl});
  
  @override
  List<Object?> get props => [
    id,
    imgUrl
  ];
}
