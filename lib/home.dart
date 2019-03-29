import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Color dark = Colors.black;
Color light = Colors.white;
Color bdark = Colors.black;
Color blight = Colors.white;

class _MyHomePageState extends State<Calc> {
  Widget button(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        highlightedBorderColor: Colors.green,
        child: Text(
          buttonText,
          style: TextStyle(
              color: blight, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  Widget obutton(String buttonText) {
    return Expanded(
      child: RaisedButton(
        padding: EdgeInsets.all(23.6),
        color: Colors.orange,
        highlightColor: Colors.green,
        elevation: 33.0,
        child: Text(
          buttonText,
          style: TextStyle(
              color: blight, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  Widget rbutton(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        highlightedBorderColor: Colors.red,
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.redAccent,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Container(
        color: dark,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 180,
            ),
            Container(
                alignment: Alignment.centerRight,
                child: Text(output,
                    style: TextStyle(
                      fontSize: 60.0,
                      color: blight,
                    ))),
            Expanded(
              child: Divider(
                color: blight,
              ),
            ),
            Column(children: [
              Row(children: [
                Container(
                  width: 200.0,
                  child: OutlineButton(
                    child: Text(
                      'Dark',
                      style: TextStyle(color: blight),
                    ),
                    onPressed: () {
                      setState(() {
                        dark = Colors.black;
                        blight = Colors.white;
                      });
                    },
                  ),
                ),
                Container(
                  width: 189.0,
                  child: OutlineButton(
                    child: Text(
                      'Light',
                      style: TextStyle(color: blight),
                    ),
                    onPressed: () {
                      setState(() {
                        dark = light;
                        blight = bdark;
                      });
                    },
                  ),
                )
              ]),
              Row(children: [
                obutton("/"),
                button("7"),
                button("8"),
                button("9"),
              ]),
              Row(children: [
                obutton("X"),
                button("4"),
                button("5"),
                button("6"),
              ]),
              Row(children: [
                obutton("-"),
                button("1"),
                button("2"),
                button("3"),
              ]),
              Row(children: [
                obutton("+"),
                button("0"),
                button("."),
                rbutton("C"),
              ]),
              Row(children: [
                obutton("%"),
                rbutton("AC"),
                button("="),
                button("ANS"),
              ])
            ])
          ],
        ),
      ),
    );
  }

  buttonPressed(String buttonText) {
    if (buttonText == "AC" || buttonText == "C") {
      solution = "0";
      x = 0.0;
      y = 0.0;
      operator = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X" ||
        buttonText == "%") {
      x = double.parse(output);

      operator = buttonText;

      solution = "0";
    } else if (buttonText == ".") {
      if (solution.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        solution = solution + buttonText;
      }
    } else if (buttonText == "=" || buttonText == "ANS") {
      y = double.parse(output);

      if (operator == "+") {
        solution = (x + y).toString();
      }
      if (operator == "-") {
        solution = (x - y).toString();
      }
      if (operator == "X") {
        solution = (x * y).toString();
      }
      if (operator == "/") {
        solution = (x / y).toString();
      }
      if (operator == "%") {
        solution = (x % y).toString();
      }

      x = 0.0;
      y = 0.0;
      operator = "";
    } else {
      solution = solution + buttonText;
    }

    print(solution);

    setState(() {
      output = double.parse(solution).toStringAsFixed(4);
    });
  }

  String output = "0";
  String solution = "0";
  double x = 0.0;
  double y = 0.0;
  String operator = "";
}
