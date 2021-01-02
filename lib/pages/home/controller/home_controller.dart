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

  var _info = RxDouble();
  set setInfo(double value) => _info.value = value;
  double get getInfo => _info.value;

  var _item = RxString();
  set setItem(String value) => _item.value = value;
  String get getItem => _item.value;

  Rx<GlobalKey<FormState>> _formKey = GlobalKey<FormState>().obs;
  Key get formKey => _formKey.value;

  Rx<TextEditingController> _coinController = TextEditingController().obs;
  TextEditingController get coinController => _coinController.value;
  set coinController(value) => _coinController.value.text = value;

  Rx<TextEditingController> _infoController = TextEditingController().obs;
  TextEditingController get infoController => _infoController.value;
  set infoController(value) => _infoController.value.text = value;

  @override
  void onInit() {
    super.onInit();
    validate();
  }

  void validate() {
    if (infoController == null || getInfo == null) {
      setInfo = 0.00;
    }
  }

  getAll() {
    return _services.getData();
  }

  void converterCurrency(getItem) {
    print('entrando aqui');
    double coin;
    double value;
    if (getItem == null) {
      print('item nullo');
      return null;
    }

    if (getItem == 'Dolar') {
      print('dollar');
      coin = double.parse(coinController.text);
      value = getDollar;
      setInfo = (coin / value);
      infoController = (getInfo).toString();
      setItem = null;
    }
    if (getItem == 'Peso Argentino') {
      print('peso');
      coin = double.parse(coinController.text);
      value = getArgPeso;
      setInfo = (coin / value);
      infoController = (getInfo).toString();
      setItem = null;
    }
    if (getItem == 'Euro') {
      print('euro');
      coin = double.parse(coinController.text);
      value = getEuro;
      setInfo = (coin / value);
      infoController = (getInfo).toString();
      setItem = null;
    }
    if (getItem == 'Iene') {
      print('iene');
      coin = double.parse(coinController.text);
      value = getYen;
      setInfo = (coin / value);
      infoController = (getInfo).toString();
      setItem = null;
    }
  }
}
