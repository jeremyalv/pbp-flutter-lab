import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/budget_item.dart';

// Reference

class BudgetCard extends StatelessWidget {
  final Budget budgetItemData;
  // final List<Budget> budgetData;
  const BudgetCard({
    super.key,
    required this.budgetItemData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        // width: double.maxFinite,
        child: Card(
          elevation: 4.0,
          child: Column(
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(budgetItemData.title),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(budgetItemData.type),
                      Text(DateFormat.yMMMEd().format(budgetItemData.date)),
                    ],
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    budgetItemData.type == 'Expense'
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
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: budgetItemData.type == 'Expense'
                    ? Text("You spent Rp${budgetItemData.amount.toString()}",
                        style: TextStyle(color: Colors.red[700]))
                    : Text(
                        "You received Rp${budgetItemData.amount.toString()}",
                        style: TextStyle(color: Colors.green[700]),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
