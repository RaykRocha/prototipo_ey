import 'package:flutter/material.dart';
import 'package:prototipo_ey/models/colaborador.dart';

class CardInfo {
  final String? title, info;
  final IconData? icon;
  final Color? color;

  CardInfo({
    this.icon,
    this.title,
    this.info,
    this.color,
  });
}

List demoMyFiles = [
  CardInfo(
    title: "Salário Médio dos Colaboradores",
    icon: Icons.attach_money,
    info: calculaSalarioBase(),
    color: Colors.green,
  ),
  CardInfo(
    title: "Quantidade de colaboradores",
    icon: Icons.people,
    info: demoColaborador.length.toString(),
    color: const Color(0xFFFFA113),
  ),
];
