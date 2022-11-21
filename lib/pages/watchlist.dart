import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../models/budget_item.dart';
import 'package:counter_7/widgets/hamburger.dart';
import '../api/watchlist_api.dart';
import '../widgets/movie_card.dart';
import '../pages/movie_detail.dart';

/* TODO
1. Movie Details Page
2. Bonuses
3. README
*/

class Watchlist extends StatefulWidget {
  final List<Budget> budgetData;

  const Watchlist({super.key, required this.budgetData});

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  late Future<List<Movie>> _watchlist;
  late WatchlistAPI _watchlistAPI;

  @override
  void initState() {
    _watchlistAPI = WatchlistAPI();
    _watchlist = _watchlistAPI.fetchMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Movies"),
      ),
      drawer: Hamburger(
        budgetData: widget.budgetData,
      ),
      body: Center(
          child: FutureBuilder(
        future: _watchlist,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Movie list is empty :(",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                // padding: const EdgeInsets.only(bottom: 10),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetail(
                                budgetData: widget.budgetData,
                                movie: snapshot.data[index]))),
                    child: MovieCard(movie: snapshot.data[index]),
                  ),
                ),
              );
            }
          }
        },
      )),
    );
  }
}
