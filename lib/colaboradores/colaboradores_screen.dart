import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prototipo_ey/constants.dart';
import 'package:prototipo_ey/controllers/menu_controller.dart';
import 'package:prototipo_ey/controllers/orcamento.dart';
import 'package:prototipo_ey/dashboard/components/header.dart';
import 'package:prototipo_ey/models/colaborador.dart';
import 'package:prototipo_ey/responsive.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class ColaboradorScreen extends StatefulWidget {
  const ColaboradorScreen({Key? key}) : super(key: key);

  @override
  _ColaboradorScreenState createState() => _ColaboradorScreenState();
}

class _ColaboradorScreenState extends State<ColaboradorScreen> {
  // ignore: prefer_typing_uninitialized_variables
  late var selectedScreen;
  final MyService _myService = MyService();
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void initState() {
    selectedScreen = colaboradoresList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              children: [
                if (!Responsive.isDesktop(context))
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: context.read<MenuController>().controlMenu,
                  ),
                // if (!Responsive.isMobile(context))
                //   Text(
                //     "Dashboard",
                //     style: Theme.of(context).textTheme.headline6,
                //   ),
                if (!Responsive.isMobile(context))
                  Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(left: defaultPadding),
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding / 2,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        child: Text(
                          "Orçamento",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(defaultPadding * 0.75),
                        margin: const EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text('${_myService.myVariable}'),
                      ),
                    ],
                  ),
                )),
                const ProfileCard()
              ],
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [selectedScreen],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget colaboradoresList() {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Colaboradores EY",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              dividerThickness: 3,
              showCheckboxColumn: false,
              columnSpacing: 22,
              minWidth: 600,
              columns: const [
                DataColumn(
                  label: Text("Nome e GPN"),
                ),
                DataColumn(
                  label: Text("Office"),
                ),
                DataColumn(
                  label: Text("Rank Atual"),
                ),
                DataColumn(
                  label: Text("Data contratação"),
                ),
                DataColumn(
                  label: Text("LEAD"),
                ),
              ],
              rows: List.generate(
                demoColaborador.length,
                (index) => colaboradorDataRow(demoColaborador[index], context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow colaboradorDataRow(Colaborador colaborador, BuildContext context) {
    return DataRow(
      onSelectChanged: (b) {
        setState(() {
          selectedScreen = colaboradorDetails(colaborador);
        });
      },
      cells: [
        DataCell(avatarGpn(colaborador)),
        DataCell(Text(colaborador.office!)),
        DataCell(Text(colaborador.rankAtual!)),
        DataCell(Text(colaborador.hiringDate!)),
        DataCell(lead(colaborador.lead!)),
      ],
    );
  }

  avatarGpn(Colaborador colaborador) => Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          ClipOval(
            child: SvgPicture.asset(
              colaborador.avatar!,
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(width: 10),
          Column(children: [
            Text(colaborador.nome!),
            Text(
              colaborador.gpn!,
              style: const TextStyle(color: Colors.black54, fontSize: 12),
            )
          ])
        ],
      ));

  lead(String l) {
    leadButton(String text, Color cor) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: cor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ));

    switch (l) {
      case "N":
        return leadButton("Need to Progress", Colors.blue);

      case "S":
        return leadButton("Strategic Impact", Colors.amber);

      case "P":
        return leadButton("Progressing", Colors.green);

      case "D":
        return leadButton("Differentiating ", Colors.purple);
    }
  }

  demanda(String l) {
    leadButton(String text, Color cor) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: cor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ));

    switch (l) {
      case "A":
        return leadButton("Alta", Colors.red);

      case "M":
        return leadButton("Moderada", Colors.yellow);

      case "B":
        return leadButton("Baixa", Colors.blue);
    }
  }

  colaboradorDetails(Colaborador colaborador) {
    const Divider divider =
        Divider(indent: 10, endIndent: 10, color: Colors.black12, height: 1);
    const TextStyle title = TextStyle(color: Colors.grey, fontSize: 16);

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          selectedScreen = colaboradoresList();
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      )),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: SvgPicture.asset(
                                  colaborador.avatar!,
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(children: [
                                Text(
                                  colaborador.nome!,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(colaborador.gpn!, style: title)
                              ])
                            ],
                          ),
                        ),
                        divider,
                        const Text("Rank Atual", style: title),
                        Text(colaborador.rankAtual!),
                        divider,
                        const Text("Data de contratação", style: title),
                        Text(colaborador.hiringDate!),
                        divider,
                        const Text("Salário Base FY Atual", style: title),
                        Text(colaborador.sb!),
                        divider,
                        const Text("LEAD", style: title),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
                          child: lead(colaborador.lead!),
                        ),
                        divider,
                        const Text("Office", style: title),
                        Text(colaborador.office!),
                        divider,
                        const Text("Exp Level Futuro", style: title),
                        Text(colaborador.sl!),
                        divider,
                        const Text("Gênero", style: title),
                        Text(colaborador.gender!),
                        divider,
                        const Text("SMU", style: title),
                        Text(colaborador.smuName!),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: 100),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Form(
                  child: Column(children: [
                    const Text("Salário Base FY Atual", style: title),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextFormField(
                          controller: myController,
                          // initialValue: colaborador.sb!,
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.add,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 18.0),
                                iconSize: 32.0,
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  setState(() {
                                    _myService.dencrementMyVariable();
                                    myController.text =
                                        (int.parse(colaborador.sb!) + 50)
                                            .toString();
                                  });
                                },
                              ),
                              prefixIcon: IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 18.0),
                                iconSize: 32.0,
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  setState(() {
                                    _myService.incrementMyVariable();
                                    myController.text =
                                        (int.parse(colaborador.sb!) - 50)
                                            .toString();
                                  });
                                },
                              ),
                              border: InputBorder.none,
                              hintText: colaborador.sb!,
                              hintStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              )),
                          // enabled: false,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Text("Bonificação", style: title),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextFormField(
                          controller: myController2,
                          // initialValue: colaborador.sb!,
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.add,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 18.0),
                                iconSize: 32.0,
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  setState(() {
                                    _myService.dencrementMyVariable();
                                    myController2.text = (0 + 50).toString();
                                  });
                                },
                              ),
                              prefixIcon: IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 18.0),
                                iconSize: 32.0,
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  setState(() {
                                    _myService.incrementMyVariable();
                                    myController2.text = (0 - 50).toString();
                                  });
                                },
                              ),
                              border: InputBorder.none,
                              hintText: "0",
                              hintStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              )),
                          // enabled: false,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(defaultPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                          "Comparação do perfil com os profissionais do Mercado",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      const Text("Demanda do Mercado", style: title),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 90, vertical: 5),
                          child: demanda("B")),
                      divider,
                      const Text("Pesquisa pelo profissional no mercado",
                          style: title),
                      const Text("20"),
                      divider,
                      const Text("Salário Médio", style: title),
                      const Text("R\$5325"),
                      divider,
                      const Text("Quantidade de vagas abertas", style: title),
                      const Text("25"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
