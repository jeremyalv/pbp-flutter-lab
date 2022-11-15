import 'package:flutter/material.dart';
import '../models/budget_item.dart';
import '../widgets/hamburger.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, required this.title, required this.budgetData});

  final String title;
  final List<Budget> budgetData;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  bool _isOdd = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _isOdd = _counter % 2 == 0 ? false : true;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _isOdd = _counter % 2 == 0 ? false : true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Hamburger(
        budgetData: widget.budgetData,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _isOdd ? 'GANJIL' : 'GENAP',
              style: TextStyle(color: _isOdd ? Colors.blue : Colors.red),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: _counter > 0
            ? Stack(children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                )
              ])
            : Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: _incrementCounter,
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
