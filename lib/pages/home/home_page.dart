import 'package:converter_currency/pages/home/controller/home_controller.dart';

import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
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
          body: FutureBuilder<Map>(
            future: controller.getAll(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: Text(
                      "Carregando dados...",
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    print(snapshot.data);
                    return Center(
                      child: Text(
                        "Erro ao carregar os dados...",
                        style: TextStyle(color: Colors.amber, fontSize: 25.0),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    controller.setDollar =
                        snapshot.data["results"]["currencies"]["USD"]["buy"];
                    controller.setEuro =
                        snapshot.data["results"]["currencies"]["EUR"]["buy"];
                    controller.setYen =
                        snapshot.data["results"]["currencies"]["JPY"]["buy"];
                    controller.setArgPeso =
                        snapshot.data["results"]["currencies"]["ARS"]["buy"];

                    return Padding(
                      padding: EdgeInsets.only(
                          top: Get.width * 0.3, right: 32, left: 32),
                      child: Center(
                        child: Column(
                          children: [
                            Obx(
                              () => Form(
                                key: controller.formKey,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: controller.coinController,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.calculate),
                                    labelText: 'Valor em real',
                                    hintText: 'Valor em real',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value.length < 3)
                                      return 'Valor muito curto';
                                    if (value.length > 30)
                                      return 'valor muito longo';
                                    return null;
                                  },
                                  inputFormatters: [
                                    controller.currencyFormatter
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            FindDropdown(
                              constraints: BoxConstraints(maxHeight: 200),
                              showSearchBox: false,
                              items: [
                                'Dolar',
                                'Peso Argentino',
                                'Euro',
                                'Iene',
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
                    );
                  }
              }
            },
          ),
        )
      ],
    );
  }
}
