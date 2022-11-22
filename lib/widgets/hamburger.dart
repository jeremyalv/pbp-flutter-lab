import 'package:counter_7/pages/watchlist.dart';
import 'package:flutter/material.dart';
import '../models/budget_item.dart';

import '../pages/counter.dart';
import '../pages/create_budget.dart';
import '../pages/view_budget.dart';

class Hamburger extends StatelessWidget {
  final List<Budget> budgetData;
  const Hamburger({super.key, required this.budgetData});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Column(
          children: [
            //  Tambahkan clickable menu
            ListTile(
              title: const Text("Counter Page"),
              onTap: () {
                //  Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Counter(
                            title: "Counter",
                            budgetData: budgetData,
                          )),
                );
              },
            ),
            Container(height: 1, color: Colors.grey[300]),
            ListTile(
              title: const Text("Create New Budget"),
              onTap: () {
                //  Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreateBudget(budgetData: budgetData)),
                );
              },
            ),
            Container(height: 1, color: Colors.grey[300]),
            ListTile(
              title: const Text("View Budgets"),
              onTap: () {
                //  Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewBudget(
                            budgetData: budgetData,
                            // budgetData: budgetData,
                          )),
                );
              },
            ),
            Container(height: 1, color: Colors.grey[300]),
            ListTile(
              title: const Text("My Watchlist"),
              onTap: () {
                //  Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Watchlist(budgetData: budgetData)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
