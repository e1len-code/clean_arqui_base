import 'package:clean_arqui_base/feature/cuenta/domain/entities/cuenta.dart';
import 'package:flutter/material.dart';

class CuentaFormPage extends StatefulWidget {
  final Cuenta cuenta;
  CuentaFormPage({Key? key, required this.cuenta}) : super(key: key);

  @override
  State<CuentaFormPage> createState() => _CuentaFormPageState();
}

class _CuentaFormPageState extends State<CuentaFormPage> {
  late Cuenta _cuenta;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cuenta = widget.cuenta;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Text(_cuenta.codCuenta));
  }
}
