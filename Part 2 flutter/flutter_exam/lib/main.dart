import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedColor = 0;
  int _selectedResult = 0;
  int _selectedTransition = 0;

  void _generateRandomSelection() {
    setState(() {
      _selectedColor = Random().nextInt(3);
      _selectedResult = Random().nextInt(2);
      _selectedTransition = Random().nextInt(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Приложение настройки"),
      ),
      body: Column(
        children: [
          Text("Основной цвет"),
          ToggleButtons(
            children: [Text("Розовый"), Text("Желтый"), Text("Зеленый")],
            isSelected: List.generate(3, (index) => index == _selectedColor),
            onPressed: (int index) {
              setState(() {
                _selectedColor = index;
              });
            },
          ),
          Text("Показ результата"),
          ToggleButtons(
            children: [Text("Dialog"), Text("SnackBar")],
            isSelected: List.generate(2, (index) => index == _selectedResult),
            onPressed: (int index) {
              setState(() {
                _selectedResult = index;
              });
            },
          ),
          Text("Переход между экранами"),
          ToggleButtons(
            children: [Text("Снизу Вверх"), Text("Сверху Вниз"), Text("Справо Налево")],
            isSelected: List.generate(3, (index) => index == _selectedTransition),
            onPressed: (int index) {
              setState(() {
                _selectedTransition = index;
              });
            },
          ),
          ElevatedButton(
            onPressed: _generateRandomSelection,
            child: Text("Подобрать вариант"),
          ),
        ],
      ),
    );
  }
}
