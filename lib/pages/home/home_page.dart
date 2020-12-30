import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Conversor de Moedas'),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: Get.width * 0.3, right: 32, left: 32),
            child: Center(
              child: Column(
                children: [
                  FindDropdown(
                    constraints: BoxConstraints(maxHeight: 200),
                    showSearchBox: false,
                    items: [
                      'Dolar',
                      'Iene',
                      'Real',
                    ],
                    label: 'Escolha a sua moeda:',
                    onChanged: (String item) => print(item),
                    selectedItem: 'Escolha uma moeda',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  FindDropdown(
                    constraints: BoxConstraints(maxHeight: 200),
                    showSearchBox: false,
                    items: [
                      'Dolar',
                      'Iene',
                      'Real',
                    ],
                    label: 'Escolha a moeda para converção:',
                    onChanged: (String item) => print(item),
                    selectedItem: 'Escolha uma moeda',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    color: Colors.green,
                    child: Text(
                      'Resultado da converção: 0.000',
                      softWrap: true,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
