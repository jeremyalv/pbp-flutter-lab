import 'package:counter_7/widgets/budget_card.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/widgets/hamburger.dart';
import '../models/budget_item.dart';

class ViewBudget extends StatelessWidget {
  final List<Budget> budgetData;
  const ViewBudget({super.key, required this.budgetData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("View Budgets"),
        ),
        drawer: Hamburger(
          budgetData: budgetData,
        ),
        body: Center(
            child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 16),
          reverse: false,
          itemCount: budgetData.length,
          itemBuilder: (context, index) =>
              BudgetCard(budgets: budgetData[budgetData.length - (index + 1)]),
        )));
  }
}
