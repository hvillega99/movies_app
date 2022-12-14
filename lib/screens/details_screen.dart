import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(slivers: [
      const _CustomAppBar(),
      SliverList(
          delegate: SliverChildListDelegate(
              const [_PosterAndTitle(), _OverView(), CastingCards()]))
    ]));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 200,
        pinned: true,
        floating: false,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: const EdgeInsets.all(0),
          title: Container(
              child: const Text('Movie title'),
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 10),
              color: Colors.black12),
          background: const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('https://via.placeholder.com/500x300'),
              fit: BoxFit.cover),
        ));
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage('https://via.placeholder.com/200x300'),
                height: 150),
          ),
          const SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Movie title',
                style: textTheme.headline5, overflow: TextOverflow.ellipsis),
            Text('Movie original title',
                style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),
            Row(children: [
              const Icon(Icons.star_outline, size: 15, color: Colors.grey),
              const SizedBox(width: 5),
              Text('Movie avg vote',
                  style: textTheme.caption, overflow: TextOverflow.ellipsis)
            ])
          ])
        ]));
  }
}

class _OverView extends StatelessWidget {
  const _OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra ipsum tincidunt consectetur dignissim. Donec ac nisl scelerisque, suscipit ante ac, fringilla neque. Mauris ut dui at libero euismod malesuada et quis eros. Morbi maximus vel diam a dictum. Donec sagittis pellentesque vulputate. Aenean tortor neque, ultrices a odio a, congue suscipit sapien. Phasellus vitae tellus eget velit bibendum posuere at sed ipsum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc fermentum velit hendrerit, laoreet risus eu, sollicitudin nunc. Nunc nisi massa, tincidunt sodales fringilla sed, efficitur nec turpis. Sed id mattis felis, et ultrices augue. Morbi gravida diam sed neque venenatis pellentesque. Nunc et eleifend mauris. Praesent vulputate pretium erat, sit amet bibendum lorem venenatis ultrices.',
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.justify),
    );
  }
}
