import 'package:flutter/material.dart';
import 'package:prototipo_ey/constants.dart';
import 'package:prototipo_ey/dashboard/components/header.dart';
import 'package:prototipo_ey/models/colaborador.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  late Future<List<Colaborador>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getAllColaboradores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Header(),
          const SizedBox(height: defaultPadding),
          Expanded(
            child: FutureBuilder<List<Colaborador>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Colaborador> data = snapshot.data!;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 75,
                          color: Colors.white,
                          child: Center(
                            child: Text(data[index].nome!),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    ));
  }
}
