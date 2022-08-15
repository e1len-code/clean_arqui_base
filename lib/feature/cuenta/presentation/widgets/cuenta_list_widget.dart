import 'package:clean_arqui_base/feature/cuenta/domain/entities/cuenta.dart';
import 'package:clean_arqui_base/feature/cuenta/presentation/widgets/cuenta_item_widget.dart';
import 'package:flutter/material.dart';

class CuentaListWidget extends StatelessWidget {
  final List<Cuenta> listCuenta;
  const CuentaListWidget({Key? key, required this.listCuenta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          itemCount: listCuenta.length,
          itemBuilder: (context, index) {
            return CuentaItemWidget(
              item: listCuenta[index],
              index: index,
            );
          }),
    );
  }
}
