class Data{
  String? nombre;
  bool? gustoflutter;
  int? caliFlutter;
  String? movilDev;
  bool? web;
  bool? emulador;
  bool? smartphone;

  Data({required String nomb, required bool gusto, required int calif, required String movil, required bool nav, required bool emul, required bool phone}){
    nombre = nomb;
    gustoflutter = gusto;
    caliFlutter = calif;
    movilDev = movil;
    web = nav;
    emulador = emul;
    smartphone = phone;
  }
}