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
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Movie Detail State"), Text("Movie Detail State")],
        ),
      ),
    );
  }
}
