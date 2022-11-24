import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../models/budget_item.dart';
import 'package:counter_7/widgets/hamburger.dart';
import '../api/watchlist_api.dart';
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
  late WatchlistAPI _watchlistAPI = WatchlistAPI();
  late Future<List<Movie>> _watchlist = _watchlistAPI.fetchMovies();

  // @override
  // void initState() {
  //   _watchlistAPI = WatchlistAPI();
  //   _watchlist = _watchlistAPI.fetchMovies();

  //   super.initState();
  // }

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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetail(
                                  budgetData: widget.budgetData,
                                  movie: snapshot.data[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      // width: double.maxFinite,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: snapshot.data[index].watched
                                    ? Colors.green
                                    : Colors.red,
                                width: 1.5)),
                        elevation: 4.0,
                        child: Column(
                          children: [
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  snapshot.data[index].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Released ${snapshot.data[index].releaseDate}"),
                                    snapshot.data[index].watched
                                        ? const Text("Watched")
                                        : const Text("Not watched"),
                                  ],
                                ),
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Checkbox(
                                      value: snapshot.data[index].watched,
                                      activeColor: Colors.green,
                                      onChanged: (newValue) {
                                        setState(() {
                                          snapshot.data[index].watched =
                                              !snapshot.data[index].watched;
                                        });
                                      }),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.centerLeft,
                              child: Text("\"${snapshot.data[index].review}\""),
                            ),
                          ],
                        ),
                      ),
                    ),
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
