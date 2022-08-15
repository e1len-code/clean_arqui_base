import 'package:clean_arqui_base/feature/cuenta/domain/entities/cuenta.dart';
import 'package:flutter/material.dart';

class CuentaItemWidget extends StatelessWidget {
  final Cuenta item;
  final int index;
  const CuentaItemWidget({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.codCuenta,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).errorColor.withOpacity(0.25),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        (index + 1).toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
            Text(
              item.denominacionCuenta,
            ),
            Text(item.tipoCuenta),
            Text(item.obsCuenta)
          ],
        ),
      ),
    );
  }
}
