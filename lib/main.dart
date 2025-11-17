import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const NeoCalculatorApp());
}

class NeoCalculatorApp extends StatelessWidget {
  const NeoCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Neo Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE6E9EF),
      ),
      home: const NeoCalculator(),
    );
  }
}

class NeoCalculator extends StatefulWidget {
  const NeoCalculator({super.key});

  @override
  State<NeoCalculator> createState() => _NeoCalculatorState();
}

class _NeoCalculatorState extends State<NeoCalculator> {
  String display = "0";
  double? n1, n2;
  String op = "";
  bool justEqual = false;

  void numClick(String v) {
    setState(() {
      if (justEqual) {
        display = "0";
        justEqual = false;
      }
      if (display == "0" && v != ".") {
        display = v;
      } else {
        if (v == "." && display.contains(".")) return;
        display += v;
      }
    });
  }

  void clear() => setState(() => display = "0");

  void toggleSign() => setState(() {
    if (display.startsWith("-")) {
      display = display.substring(1);
    } else if (display != "0") {
      display = "-$display";
    }
  });

  void percent() => setState(() {
    double x = double.tryParse(display) ?? 0;
    display = (x / 100).toString();
  });

  void setOp(String o) => setState(() {
    n1 = double.tryParse(display);
    op = o;
    display = "0";
  });

  void equal() => setState(() {
    n2 = double.tryParse(display);
    if (n1 == null || n2 == null) return;

    double result = 0;
    if (op == "+") result = n1! + n2!;
    if (op == "-") result = n1! - n2!;
    if (op == "×") result = n1! * n2!;
    if (op == "÷") {
      if (n2 == 0) {
        display = "Error";
        return;
      }
      result = n1! / n2!;
    }

    display = result.toString();
    justEqual = true;
  });

  Widget button(
      {required String text,
        Color bg = const Color(0xFFE6E9EF),
        double size = 24,
        bool isOp = false,
        Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFA8B0C0),
              offset: Offset(4, 4),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: isOp ? Colors.deepOrange : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Display
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(30),
                alignment: Alignment.bottomRight,
                child: Text(
                  display,
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            // Buttons grid
            Expanded(
              flex: 7,
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisCount: 4,
                children: [
                  button(text: "C", isOp: true, onTap: clear),
                  button(text: "±", isOp: true, onTap: toggleSign),
                  button(text: "%", isOp: true, onTap: percent),
                  button(text: "÷", isOp: true, onTap: () => setOp("÷")),

                  button(text: "7", onTap: () => numClick("7")),
                  button(text: "8", onTap: () => numClick("8")),
                  button(text: "9", onTap: () => numClick("9")),
                  button(text: "×", isOp: true, onTap: () => setOp("×")),

                  button(text: "4", onTap: () => numClick("4")),
                  button(text: "5", onTap: () => numClick("5")),
                  button(text: "6", onTap: () => numClick("6")),
                  button(text: "-", isOp: true, onTap: () => setOp("-")),

                  button(text: "1", onTap: () => numClick("1")),
                  button(text: "2", onTap: () => numClick("2")),
                  button(text: "3", onTap: () => numClick("3")),
                  button(text: "+", isOp: true, onTap: () => setOp("+")),

                  button(text: "0", onTap: () => numClick("0")),
                  button(text: ".", onTap: () => numClick(".")),
                  button(text: "=", isOp: true, bg: Colors.deepOrange.shade200, onTap: equal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
