import 'package:flutter/material.dart';
import 'ExpansionTile_alt.dart';
import 'home_page.dart';

class Debt extends StatefulWidget {
  @override
  _DebtState createState() => _DebtState();
}

class Debts {
  Debts(this._nama, this._nominal, this._jenis);

  String _nama;
  int _nominal;
  String _jenis;
}

class _DebtState extends State<Debt> {
  List<Debts> _debt = [];

  inputPiutangSaya(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Masukan Jumlah Piutang"),
            content: Column(
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
                    labelText: 'Nama',
                  ),
                  onChanged: (String value2) {
                    ket = value2;
                  },
                ),
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text("Simpan"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                  _debt.add(Debts(ket, plus, "+"));

                  plus = null;
                  ket = null;
                  });
                },
              )
            ],
          );
        });
  }

  inputHutangSaya(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Masukan Jumlah Hutang"),
            content: Column(
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
                    labelText: 'Nama',
                  ),
                  onChanged: (String value2) {
                    ket = value2;
                  },
                ),
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text("Simpan"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _debt.add(Debts(ket, plus, "-"));

                    plus = null;
                    ket = null;
                  });
                },
              )
            ],
          );
        });
  }

  _deleteDebts(index){
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Anda yakin sudah selesai?"),
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
                      _debt.removeAt(index);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.monetization_on_outlined ),
            title: Text("Debt"), backgroundColor: Colors.teal[700]),
        body: Column(children: <Widget>[
      Row(
        children: <Widget>[
          Flexible(
              flex: 2,
              child: ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    inputPiutangSaya(context);
                  },
                  child: Text("Piutang",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),),
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
                    inputHutangSaya(context);
                  },
                  child: Text("Hutang",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),),
                  color: Colors.red[900],
                ),
              )),
        ],
      ),
      Flexible(
        flex: 1,
        child: Container(
          child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                //   reverse: true,
                itemCount: _debt.length,
                itemBuilder: (context, index) {
                  int newIndex = _debt.length - 1 - index;
                  // String period = "Daily";
                  return Column(
                    children: <Widget>[
                      MyExpansionTile(
                        title: Text(
                          "${_debt[newIndex]._jenis} ${_debt[newIndex]._nominal} ${_debt[newIndex]._nama}",
                          style: TextStyle(
                              fontSize: 20,
                              color:
                              _debt[newIndex]._jenis == "+"
                                  ? Colors.teal[700]
                                  : Colors.red[700]),
                        ),
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Flexible(
                                  flex: 1,
                                  child: ButtonTheme(
                                    minWidth: double.infinity,
                                    height: 50,
                                    child: RaisedButton(
                                      onPressed: () {
                                        _deleteDebts(newIndex);
                                      },
                                      child: Text("Selesai",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),),
                                      color: Colors.red[700],
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                }),
        ),
      )
    ]));
  }
}