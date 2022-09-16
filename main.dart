import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contado os alunos", home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _num_alunos = 0;
  String _mensagem = "Limite de pessoas suportadas no LAB não foi atingido";

  void _change(int increment) {
    setState(() {
      if (increment == -1) {
        if (_num_alunos > 0) {
          _num_alunos--;
        }
      } else if (increment == 1) {
        _num_alunos++;
      }
      checkAlunos(_num_alunos);
    });
  }

  void checkAlunos(int quantAlunos) {
    setState(() {
      if (quantAlunos == 36) {
        _mensagem = "Limite de pessoas suportadas no LAB foi atingido";
      } else if (quantAlunos < 36) {
        _mensagem = "Limite de pessoas suportadas no LAB não foi atingido";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Alunos: $_num_alunos",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.10),
            child: TextButton(
              child: Text(
                "-1",
                style: TextStyle(fontSize: 40, color: Colors.greenAccent),
              ),
              onPressed: () {
                _change(-1);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.10),
            child: TextButton(
              child: Text(
                "+1",
                style: TextStyle(fontSize: 40, color: Colors.greenAccent),
              ),
              onPressed: () {
                _change(1);
              },
            ),
          ),
        ]),
        Text(
          "$_mensagem",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
