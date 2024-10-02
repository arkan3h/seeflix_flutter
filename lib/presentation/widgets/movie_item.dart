import 'package:flutter/material.dart';
import 'package:seeflix_flutter/domain/entities/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: SizedBox(
        width: 120,
        child: Ink.image(
          image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.imgUrl}'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}