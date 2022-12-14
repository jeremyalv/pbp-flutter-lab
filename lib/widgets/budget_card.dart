import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/budget_item.dart';

// Reference

class BudgetCard extends StatelessWidget {
  final Budget budgets;

  const BudgetCard({
    super.key,
    required this.budgets,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      // width: double.maxFinite,
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  budgets.title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(budgets.type),
                    Text(DateFormat.yMMMEd().format(budgets.date)),
                  ],
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  budgets.type == 'Expense'
                      ? Icon(
                          Icons.remove,
                          size: 30,
                          color: Colors.red[700],
                        )
                      : Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.green[700],
                        )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: budgets.type == 'Expense'
                  ? Text("You spent Rp${budgets.amount.toString()}",
                      style: TextStyle(color: Colors.red[700]))
                  : Text(
                      "You received Rp${budgets.amount.toString()}",
                      style: TextStyle(color: Colors.green[700]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
