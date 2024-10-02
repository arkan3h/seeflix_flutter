import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeflix_flutter/domain/entities/movie.dart';
import 'package:seeflix_flutter/presentation/bloc/popular/popular_bloc.dart';
import 'package:seeflix_flutter/presentation/bloc/popular/popular_state.dart';
import 'package:seeflix_flutter/presentation/widgets/movie_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Popular'),
          BlocBuilder<PopularBloc, PopularState>(
            builder: (context, state) {
              if (state is PopularLoading) {
                return CircularProgressIndicator();
              } else if (state is PopularSuccess) {
                return ListPopular(movies: state.movie);
              } else if (state is PopularError) {
                return Text(state.message);
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}

class ListPopular extends StatelessWidget {
  const ListPopular({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) => MovieItem(movie: movies[index])
      ),
    );
  }
}
