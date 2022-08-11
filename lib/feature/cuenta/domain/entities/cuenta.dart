class Cuenta {
  String codCuenta;
  String denominacionCuenta;
  String tipoCuenta;
  String obsCuenta;
  bool flagActivo;
  String tipoCuentaCorriente;
  int nivel;
  Cuenta(
      {this.codCuenta = '',
      this.denominacionCuenta = '',
      this.tipoCuenta = '',
      this.obsCuenta = '',
      this.flagActivo = true,
      this.tipoCuentaCorriente = '',
      this.nivel = 0});

  factory Cuenta.fromJson(Map<String, dynamic> json) {
    return Cuenta(
      codCuenta: json["Cod_Cuenta"] ?? '',
      denominacionCuenta: json["Denominacion_Cuenta"] ?? '',
      tipoCuenta: json["Tipo_Cuenta"] ?? '',
      flagActivo: json["flagActivo"],
      obsCuenta: json["Obs_Cuenta"] ?? '',
      tipoCuentaCorriente: json["Tipo_Cta_Corriente"] == "\u0000" ||
              json["Tipo_Cta_Corriente"] == " "
          ? ''
          : json["Tipo_Cta_Corriente"],
      nivel: json["Nivel"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Cod_Cuenta": codCuenta,
      "Denominacion_Cuenta": denominacionCuenta,
      "Tipo_Cuenta": tipoCuenta,
      "flagActivo": flagActivo,
      "Obs_Cuenta": obsCuenta,
      "Tipo_Cta_Corriente": tipoCuentaCorriente,
      "Nivel": nivel
    };
  }
}
