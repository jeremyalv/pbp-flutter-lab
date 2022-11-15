import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/budget_item.dart';
import '../widgets/hamburger.dart';

/* Reference
1. https://stackoverflow.com/questions/52727535/what-is-the-correct-way-to-add-date-picker-in-flutter-app
2. https://www.fluttercampus.com/guide/39/how-to-show-date-picker-on-textfield-tap-and-get-formatted-date/
*/

class CreateBudget extends StatefulWidget {
  final List<Budget> budgetData;
  const CreateBudget({super.key, required this.budgetData});
  // const CreateBudget({Key? key, required this.budgetData}) : super(key: key);

  @override
  State<CreateBudget> createState() => _CreateBudgetState();
}

class _CreateBudgetState extends State<CreateBudget> {
  final _formKey = GlobalKey<FormState>();

  // Create default values for form fields
  String _title = '';
  int _amount = 0;
  String? _type;
  final List<String> _typeList = ['Expense', 'Income'];
  DateTime _date = DateTime.now();
  TextEditingController _dateInput = TextEditingController();

  bool _dropdownIsValid = true;

  @override
  void initState() {
    _title = "";
    _amount = 0;
    _dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Budget'),
      ),
      drawer: Hamburger(
        budgetData: widget.budgetData,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nasi Uduk",
                      labelText: "Name",
                      icon: const Icon(Icons.edit),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Title cannot be empty!";
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "11000",
                      labelText: "Amount",
                      icon: const Icon(Icons.attach_money_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Amount cannot be empty!";
                      }

                      if (double.tryParse(value) == null) {
                        return "Amount must be a number!";
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _dateInput,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: "Enter date",
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('dd MMM yyyy').format(pickedDate);

                        setState(() {
                          _dateInput.text = formattedDate;
                          _date = pickedDate;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text("Type"),
                  trailing: DropdownButton(
                    value: _type,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    hint: const Text("Choose"),
                    items: _typeList.map((String t) {
                      return DropdownMenuItem(value: t, child: Text(t));
                    }).toList(),
                    onChanged: (String? newType) {
                      setState(() {
                        _type = newType!;
                      });
                    },
                  ),
                ),
                _dropdownIsValid
                    ? const Text("")
                    : const Text("Choose a type!"),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextButton(
                    child: const Text(
                      "Create Entry",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green[800]),
                    ),
                    onPressed: () {
                      if (_type == null) {
                        _dropdownIsValid = false;
                        setState(() {});
                      } else {
                        _dropdownIsValid = true;
                      }

                      if (_formKey.currentState!.validate() && _type != null) {
                        Budget entry = Budget(
                          title: _title,
                          amount: _amount,
                          date: _date,
                          type: _type!,
                        );

                        setState(() {});

                        // Add entry to budgetData
                        widget.budgetData.add(entry);

                        // Reset form data
                        _formKey.currentState?.reset();

                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 30),
                                shrinkWrap: true,
                                children: <Widget>[
                                  const Center(
                                      child: Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Text("Created new entry!"),
                                  )),
                                  const SizedBox(height: 10),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Back",
                                        style: TextStyle(fontSize: 16),
                                      )),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
