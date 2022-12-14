import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return Container(
          width: double.infinity,
          height: _screenSize.height * 0.5,
          child: const Center(
            child: CircularProgressIndicator(),
          ));
    }

    return Container(
        width: double.infinity,
        height: _screenSize.height * 0.5,
        child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.50,
          itemBuilder: (_, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'details', arguments: 'movie');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  image: NetworkImage(movies[index].fullPosterImg),
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ));
  }
}
