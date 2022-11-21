import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      // width: double.maxFinite,
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  movie.title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Released ${movie.releaseDate}"),
                    movie.watched
                        ? const Text("Watched")
                        : const Text("Not watched"),
                  ],
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // TODO replace as checkbox
                  movie.watched
                      ? Icon(
                          Icons.check,
                          size: 30,
                          color: Colors.green[700],
                        )
                      : Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.red[700],
                        )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Text("\"${movie.review}\""),
            ),
          ],
        ),
      ),
    );
  }
}
