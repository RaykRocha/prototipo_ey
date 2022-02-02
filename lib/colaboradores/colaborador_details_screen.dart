import 'package:flutter/material.dart';
import 'package:prototipo_ey/constants.dart';
import 'package:prototipo_ey/dashboard/components/header.dart';
import 'package:prototipo_ey/models/colaborador.dart';

class ColaboradorDetails extends StatefulWidget {
  final Colaborador colaborador;
  const ColaboradorDetails({Key? key, required this.colaborador})
      : super(key: key);

  @override
  _ColaboradorDetailsState createState() => _ColaboradorDetailsState();
}

class _ColaboradorDetailsState extends State<ColaboradorDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Text(widget.colaborador.nome!),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
