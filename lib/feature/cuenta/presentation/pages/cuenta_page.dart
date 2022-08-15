import 'dart:async';

import 'package:clean_arqui_base/feature/cuenta/domain/entities/cuenta.dart';
import 'package:clean_arqui_base/feature/cuenta/presentation/bloc/cuenta_bloc.dart';
import 'package:clean_arqui_base/feature/cuenta/presentation/bloc/cuenta_bloc.dart';
import 'package:clean_arqui_base/feature/cuenta/presentation/widgets/cuenta_list_widget.dart';
import 'package:clean_arqui_base/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      ),
      body: BlocConsumer<CuentaBloc, CuentaState>(
        listener: (context, state) {
          if (state is LoadingState) {}
          if (state is ListedState) {
            _list = state.listCuenta;
          }
          if (state is ErrorState) {
            SnackBar(content: Text(state.message));
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: Text('Cargando...'),
            );
          } else {
            return CuentaListWidget(listCuenta: _list);
          }
        },
      ),
    );
  }
}
