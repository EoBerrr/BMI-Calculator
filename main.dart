import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController () ;
  TextEditingController heightController = TextEditingController () ;
  String _infoText = "Informe seus dados";
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void _resetFields(){
    _formkey = GlobalKey<FormState>();
    weightController .text = "";
    heightController .text = "";
    setState ((){
      _infoText = "Infome seus dados";
    });
  }

  void _calculate(){
    setState (() {
      double weight = double.parse(weightController .text);
      double height = double.parse(heightController .text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6){
        _infoText = "Você está abaixo do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9){
        _infoText = "Você está no peso normal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 25 && imc < 29.9){
        _infoText = "Você está com sobrepeso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 30 && imc < 34.9){
        _infoText = "Você está com Obesidade grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 35 && imc < 39.9){
        _infoText = "Você está com Obesidade grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc > 40){
        _infoText = "Você está com Obesidade grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: <Widget> [
          IconButton(icon: const Icon(Icons.refresh),
            onPressed: _resetFields),
        ],
      ),
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              const Icon(Icons.personal_injury, size: 120, color: Colors.red),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Peso (Kg)",
                      labelStyle: TextStyle(color: Colors.cyanAccent),
                      fillColor: Colors.white12,
                      filled: true,
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.lightGreenAccent, fontSize: 30.0),
                    controller: weightController,
                    validator: (value){
                      if (value.toString().isEmpty){
                        return "Insira o peso";
                      }
                      if (double.parse(value.toString()) > 500){
                        return "Digite um valor válido";
                      }
                      if (double.parse(value.toString()) < 0){
                        return "Digite um valor válido";
                      }
                      if (num.tryParse(value.toString()) == null){
                        return "Digite um valor válido";
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.cyanAccent),
                      fillColor: Colors.white12,
                      filled: true,
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.lightGreenAccent, fontSize: 30.0),
                    controller: heightController,
                    validator: (value) {
                      if (value
                          .toString()
                          .isEmpty) {
                        return "Insira a altura";
                      }
                      if (double.parse(value.toString()) > 300) {
                        return "Digite um valor válido";
                      }
                      if (double.parse(value.toString()) < 0) {
                        return "Digite um valor válido";
                      }
                      if (num.tryParse(value.toString()) == null) {
                        return "Digite um valor válido";
                      }
                    }
                  ),
                ),
              ),
              Padding (padding: EdgeInsets.only(top:10, bottom: 10),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 20,
                      shadowColor: Colors.indigo,
                    ),
                    child: const Text('Calcular IMC'),
                    onPressed: (){
                      if (_formkey.currentState!.validate())
                        _calculate();
                    },
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(top:10, bottom: 10),
                child: Container(
                  height: 100,
                  child: Text(
                    _infoText,
                    style: const TextStyle(color: Colors.lightGreenAccent, fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),

    ),
    );
  }
}
