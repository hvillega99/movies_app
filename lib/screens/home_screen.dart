import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Películas en cines'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              MovieSlider(
                title: 'Populares',
                movies: moviesProvider.popularMovies,
                onNextPage: () => moviesProvider.getPopularMovies(),
              )
            ],
          ),
        ));
  }
}
