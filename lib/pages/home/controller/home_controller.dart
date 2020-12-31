import 'package:converter_currency/services/services.dart';
import 'package:currency_input_formatters/currency_input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Services _services = Services();

  final currencyFormatter = CurrencyFormatter(decimal: 3);

  var _dollar = RxDouble();
  set setDollar(double value) => _dollar.value = value;
  double get getDollar => _dollar.value;

  var _euro = RxDouble();
  set setEuro(double value) => _euro.value = value;
  double get getEuro => _euro.value;

  var _yen = RxDouble();
  set setYen(double value) => _yen.value = value;
  double get getYen => _yen.value;

  var _argPeso = RxDouble();
  set setArgPeso(double value) => _argPeso.value = value;
  double get getArgPeso => _argPeso.value;

  var _info = RxString();
  set setInfo(String value) => _info.value = value;
  String get getInfo => _info.value;

  Rx<GlobalKey<FormState>> _formKey = GlobalKey<FormState>().obs;
  Key get formKey => _formKey.value;

  Rx<TextEditingController> _coinController = TextEditingController().obs;
  TextEditingController get coinController => _coinController.value;
  set coinController(value) => _coinController.value.text = value;

  @override
  void onInit() {
    super.onInit();
  }

  getAll() {
    return _services.getData();
  }
}
