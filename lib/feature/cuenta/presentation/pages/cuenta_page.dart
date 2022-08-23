import 'package:clean_arqui_base/core/global/size_constants.dart';
import 'package:clean_arqui_base/core/widgets/snackbar_widget.dart';
import 'package:clean_arqui_base/feature/cuenta/domain/entities/cuenta.dart';
import 'package:clean_arqui_base/feature/cuenta/presentation/bloc/cuenta_bloc.dart';
import 'package:clean_arqui_base/feature/cuenta/presentation/widgets/cuenta_list_widget.dart';
import 'package:clean_arqui_base/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CuentaPage extends StatefulWidget {
  CuentaPage({Key? key}) : super(key: key);

  @override
  State<CuentaPage> createState() => _CuentaPageState();
}

class _CuentaPageState extends State<CuentaPage> {
  late List<Cuenta> _list = [];
  late final CuentaBloc cuentaBloc;
  @override
  void initState() {
    super.initState();
    cuentaBloc = BlocProvider.of<CuentaBloc>(context);
    cuentaBloc.add(ListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cuentas',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: hspaceM, vertical: vspaceL),
            child: Container(child: Text('')),
          )
        ],
      ),
      body: BlocConsumer<CuentaBloc, CuentaState>(
        listener: (context, state) {
          if (state is LoadingState) {
            EasyLoading.show();
          }
          if (state is ListedState) {
            EasyLoading.dismiss();
            SnackWidget.showMessage(context, 'Recuperado Correctamente!!!',
                'Todas las cuentas se ha recuperado exitosamente',
                typeMessage: TypeMessage.success);
            _list = state.listCuenta;
          }
          if (state is ErrorState) {
            EasyLoading.dismiss();
            SnackWidget.showMessage(
                context, 'Ups!!', 'Ha ocurrido un error. ${state.message}',
                typeMessage: TypeMessage.danger);
          }
        },
        builder: (context, state) {
          if (state is! LoadingState) {
            return CuentaListWidget(listCuenta: _list);
          } else {
            return SizedBox(
              width: 0,
            );
          }
        },
      ),
    );
  }
}
