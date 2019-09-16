import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;
  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: _screensize.height * 0.29,
        child: PageView.builder(
          //children: _tarjetas(context),
          pageSnapping: false,
          controller: _pageController,
          itemCount: peliculas.length,
          itemBuilder: (BuildContext context, index) =>
              _tarjeta(context, peliculas[index]),
        ),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula) {

    pelicula.uniqueId='${pelicula.id}-poster';

    final peliculaTarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
            tag: pelicula.uniqueId
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );

    return GestureDetector(
      child: peliculaTarjeta,
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((pelicula) {}).toList();
  }
}
