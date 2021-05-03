import 'package:flutter/material.dart';
import 'package:pab_dompet/home_page.dart';

import 'ExpansionTile_alt.dart';

class Budget extends StatefulWidget {
  @override
  _BudgetState createState() => _BudgetState();
}

class Cash {
  Cash(this._nomBudget, this._ketBudget, this._symBudget);

  int _nomBudget;
  String _ketBudget;
  String _symBudget;
}

class _BudgetState extends State<Budget> {
  List<Cash> _budgetDaily = [];
  List<Cash> _budgetWeekly = [];
  List<Cash> _budgetMonthly = [];
  String _valueChoose;
  List _periode = ["Daily", "Weekly", "Monthly"];

  _edit(String period, BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Edit Budget"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Nominal',
                    ),
                    onChanged: (String value) {
                      plus = int.parse(value);
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Keterangan',
                    ),
                    onChanged: (String value2) {
                      ket = value2;
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text("Simpan"),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (period == "Daily") {
                    _budgetDaily[index]._nomBudget = plus;
                    _budgetDaily[index]._ketBudget = ket;
                  }
                  //  budgetDaily.add(Cash(plus, ket, "+"));
                  else if (period == "Weekly") {
                    _budgetWeekly[index]._nomBudget = plus;
                    _budgetWeekly[index]._ketBudget = ket;
                  } else if (period == "Monthly") {
                    _budgetMonthly[index]._nomBudget = plus;
                    _budgetMonthly[index]._ketBudget = ket;
                  }
                  setState(() {
                    plus = null;
                    ket = null;
                  });
                },
              )
            ],
          );
        });
  }

  _deleteDaily(int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Anda yakin ingin menghapus?"),
            actions: <Widget>[
              Row(
                children: <Widget>[
                  MaterialButton(
                    child: Text("Tidak",
                    style: TextStyle(
                      color: Colors.teal[700],
                    ),),
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    child: Text("Iya",
                    style: TextStyle(
                      color: Colors.red[700],
                    ),),
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      _budgetDaily.removeAt(index);
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        }
    );
  }

  _deleteWeekly(int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Anda yakin ingin menghapus?"),
            actions: <Widget>[
              Row(
                children: <Widget>[
                  MaterialButton(
                    child: Text("Tidak",
                      style: TextStyle(
                        color: Colors.teal[700],
                      ),),
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    child: Text("Iya",
                      style: TextStyle(
                        color: Colors.red[700],
                      ),),
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      _budgetWeekly.removeAt(index);
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        }
    );
  }

  _deleteMonthly(int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Anda yakin ingin menghapus?"),
            actions: <Widget>[
              Row(
                children: <Widget>[
                  MaterialButton(
                    child: Text("Tidak",
                      style: TextStyle(
                        color: Colors.teal[700],
                      ),),
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    child: Text("Iya",
                      style: TextStyle(
                        color: Colors.red[700],
                      ),),
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      _budgetMonthly.removeAt(index);
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        }
    );
  }

  inputIncomePeriodly(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Masukan Jumlah Pemasukan"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Pemasukan',
                    ),
                    onChanged: (String value) {
                      plus = int.parse(value);
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Keterangan',
                    ),
                    onChanged: (String value2) {
                      ket = value2;
                    },
                  ),
                  DropdownButtonFormField(
                    hint: Text("Periode"),
                    value: _valueChoose,
                    onChanged: (newValue) {
                      setState(() {
                        _valueChoose = newValue;
                      });
                    },
                    items: _periode.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text("Simpan"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    if (_valueChoose == "Daily")
                      _budgetDaily.add(Cash(plus, ket, "+"));
                    else if (_valueChoose == "Weekly")
                      _budgetWeekly.add(Cash(plus, ket, "+"));
                    else if (_valueChoose == "Monthly")
                      _budgetMonthly.add(Cash(plus, ket, "+"));

                    plus = null;
                    ket = null;
                  });
                },
              )
            ],
          );
        });
  }

  inputOutcomePeriodly(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Masukan Budget Pengeluaran"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Pengeluaran',
                    ),
                    onChanged: (String value) {
                      plus = int.parse(value);
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Keterangan',
                    ),
                    onChanged: (String value2) {
                      ket = value2;
                    },
                  ),
                  DropdownButtonFormField(
                    hint: Text("Periode"),
                    value: _valueChoose,
                    onChanged: (newValue) {
                      setState(() {
                        _valueChoose = newValue;
                      });
                    },
                    items: _periode.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text("Simpan"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    if (_valueChoose == "Daily")
                      _budgetDaily.add(Cash(plus, ket, "-"));
                    else if (_valueChoose == "Weekly")
                      _budgetWeekly.add(Cash(plus, ket, "-"));
                    else if (_valueChoose == "Monthly")
                      _budgetMonthly.add(Cash(plus, ket, "-"));

                    plus = null;
                    ket = null;
                  });
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomPadding : false,
        appBar: AppBar(
            leading: Icon(Icons.calculate_outlined),
            title: Text("Budget"),
            backgroundColor: Colors.teal[700]),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Row(
            children: <Widget>[
              Flexible(
                  flex: 2,
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        inputIncomePeriodly(context);
                        print(_budgetDaily[0]._nomBudget);
                      },
                      child: Text(
                        "+",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      color: Colors.teal[700],
                    ),
                  )),
              Flexible(
                  flex: 2,
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        inputOutcomePeriodly(context);
                      },
                      child: Text(
                        "-",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      color: Colors.red[900],
                    ),
                  )),
            ],
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 2.0, color: Colors.grey)),
            ),
            child: Column(children: <Widget>[
              MyExpansionTile(
                title: Text(
                  "Daily",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                ),
                children: <Widget>[
                  ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      //   reverse: true,
                      itemCount: _budgetDaily.length,
                      itemBuilder: (context, index) {
                        int newIndex = _budgetDaily.length - 1 - index;
                        String period = "Daily";
                        return Column(
                          children: <Widget>[
                            MyExpansionTile(
                              title: Text(
                                "${_budgetDaily[newIndex]._symBudget} ${_budgetDaily[newIndex]._nomBudget} ${_budgetDaily[newIndex]._ketBudget}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        _budgetDaily[newIndex]._symBudget == "+"
                                            ? Colors.teal[700]
                                            : Colors.red[700]),
                              ),
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                        flex: 2,
                                        child: ButtonTheme(
                                          minWidth: double.infinity,
                                          height: 50,
                                          child: RaisedButton(
                                            onPressed: () {
                                              _deleteDaily(newIndex);
                                            },
                                            child: Icon(Icons.delete,
                                                color: Colors.white),
                                            color: Colors.red[700],
                                          ),
                                        )),
                                    Flexible(
                                        flex: 2,
                                        child: ButtonTheme(
                                          minWidth: double.infinity,
                                          height: 50,
                                          child: RaisedButton(
                                            onPressed: () {
                                              _edit(
                                                  period, context, newIndex);
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                            ),
                                            color: Colors.teal[700],
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ],
              )
            ]),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 2.0, color: Colors.grey)),
            ),
            child: Column(children: <Widget>[
              MyExpansionTile(
                title: Text(
                  "Weekly",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                ),
                children: <Widget>[
                  ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      //   reverse: true,
                      itemCount: _budgetWeekly.length,
                      itemBuilder: (context, index) {
                        int newIndex = _budgetWeekly.length - 1 - index;
                        String period = "Weekly";
                        return Column(
                          children: <Widget>[
                            MyExpansionTile(
                              title: Text(
                                "${_budgetWeekly[newIndex]._symBudget} ${_budgetWeekly[newIndex]._nomBudget} ${_budgetWeekly[newIndex]._ketBudget}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        _budgetWeekly[newIndex]._symBudget == "+"
                                            ? Colors.teal[700]
                                            : Colors.red[700]),
                              ),
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                        flex: 2,
                                        child: ButtonTheme(
                                          minWidth: double.infinity,
                                          height: 50,
                                          child: RaisedButton(
                                            onPressed: () {
                                              _deleteWeekly(newIndex);
                                            },
                                            child: Icon(Icons.delete,
                                                color: Colors.white),
                                            color: Colors.red[700],
                                          ),
                                        )),
                                    Flexible(
                                        flex: 2,
                                        child: ButtonTheme(
                                          minWidth: double.infinity,
                                          height: 50,
                                          child: RaisedButton(
                                            onPressed: () {
                                              _edit(
                                                  period, context, newIndex);
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                            ),
                                            color: Colors.teal[700],
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ],
              )
            ]),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border:
              Border(bottom: BorderSide(width: 2.0, color: Colors.grey)),
            ),
            child: Column(children: <Widget>[
              MyExpansionTile(
                title: Text(
                  "Monthly",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                ),
                children: <Widget>[
                  ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      //   reverse: true,
                      itemCount: _budgetMonthly.length,
                      itemBuilder: (context, index) {
                        int newIndex = _budgetMonthly.length - 1 - index;
                        String period = "Monthly";
                        return Column(
                          children: <Widget>[
                            MyExpansionTile(
                              title: Text(
                                "${_budgetMonthly[newIndex]._symBudget} ${_budgetMonthly[newIndex]._nomBudget} ${_budgetMonthly[newIndex]._ketBudget}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color:
                                    _budgetMonthly[newIndex]._symBudget == "+"
                                        ? Colors.teal[700]
                                        : Colors.red[700]),
                              ),
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                        flex: 2,
                                        child: ButtonTheme(
                                          minWidth: double.infinity,
                                          height: 50,
                                          child: RaisedButton(
                                            onPressed: () {
                                              _deleteMonthly(newIndex);
                                            },
                                            child: Icon(Icons.delete,
                                                color: Colors.white),
                                            color: Colors.red[700],
                                          ),
                                        )),
                                    Flexible(
                                        flex: 2,
                                        child: ButtonTheme(
                                          minWidth: double.infinity,
                                          height: 50,
                                          child: RaisedButton(
                                            onPressed: () {
                                              _edit(
                                                  period, context, newIndex);
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                            ),
                                            color: Colors.teal[700],
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ],
              )
            ]),
          ),
        ])));
  }
}