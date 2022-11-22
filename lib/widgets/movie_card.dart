import 'package:flutter/material.dart';
import '../models/movie.dart';

// REFERENCES
// 1. https://stackoverflow.com/questions/52814039/how-to-implement-checkbox-in-flutter

class MovieCard extends StatefulWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool watchedValue = false;

  @override
  void initState() {
    watchedValue = widget.movie.watched;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      // width: double.maxFinite,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
                color: watchedValue ? Colors.green : Colors.red, width: 1.5)),
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  widget.movie.title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Released ${widget.movie.releaseDate}"),
                    watchedValue
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
                  // widget.movie.watched
                  //     ? Icon(
                  //         Icons.check_box,
                  //         size: 30,
                  //         color: Colors.green[700],
                  //       )
                  //     : Icon(
                  //         Icons.check_box_outline_blank,
                  //         size: 30,
                  //         color: Colors.red[700],
                  //       ),
                  Checkbox(
                      value: watchedValue,
                      activeColor: Colors.green,
                      onChanged: (newValue) {
                        setState(() {
                          watchedValue = newValue!;
                        });
                      }),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Text("\"${widget.movie.review}\""),
            ),
          ],
        ),
      ),
    );
  }
}
