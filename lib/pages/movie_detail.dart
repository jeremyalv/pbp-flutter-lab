import 'package:flutter/material.dart';
import 'package:counter_7/models/movie.dart';
import '../widgets/hamburger.dart';
import '../models/budget_item.dart';

class MovieDetail extends StatefulWidget {
  final List<Budget> budgetData;
  final Movie movie;

  const MovieDetail({super.key, required this.budgetData, required this.movie});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Details"),
      ),
      drawer: Hamburger(
        budgetData: widget.budgetData,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(widget.movie.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24)),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                decoration: BoxDecoration(
                                    color: widget.movie.rating >= 4
                                        ? Colors.green
                                        : widget.movie.rating > 2.5
                                            ? Colors.orange
                                            : Colors.red,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: Text(
                                          widget.movie.rating.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: Icon(
                                        widget.movie.watched
                                            ? Icons.check
                                            : Icons.close,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                        widget.movie.watched
                                            ? "Watched"
                                            : "Not Watched",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Released on ${widget.movie.releaseDate}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("\"${widget.movie.review}\"",
                                style: const TextStyle(fontSize: 16))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Back to My Watchlist"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
