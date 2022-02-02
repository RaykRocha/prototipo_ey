import 'dart:convert';
import 'package:http/http.dart' as http;

class Colaborador {
  Colaborador({
    this.nome,
    this.gender,
    this.gpn,
    this.rankAtual,
    this.empStatus,
    this.office,
    this.sl,
    this.subSL,
    this.smuName,
    this.lead,
    this.sb,
    this.hiringDate,
    this.avatar,
  });

  String? nome;
  String? gender;
  String? gpn;
  String? rankAtual;
  String? empStatus;
  String? office;
  String? sl;
  String? subSL;
  String? smuName;
  String? lead;
  String? sb;
  String? hiringDate;
  String? avatar;

  factory Colaborador.fromJson(Map<String, dynamic> json) => Colaborador(
        nome: json["Nome"],
        gender: json["Gender"],
        gpn: json["GPN"],
        rankAtual: json["Rank Atual"],
        empStatus: json["Employee Status"],
        sl: json["SL"],
        subSL: json["SUBSL"],
        smuName: json["SMUName"],
        lead: json["LEAD"],
        sb: json["SB"],
        hiringDate: json["HiringDate"],
        avatar: json["Avatar"],
      );

  Map<String, dynamic> toJson() => {
        "Nome": nome,
        "Gender": gender,
        "GPN": gpn,
        "Rank Atual": rankAtual,
        "Employee Status": empStatus,
        "SL": sl,
        "SUBSL": subSL,
        "SMUName": smuName,
        "LEAD": lead,
        "SB": sb,
        "HiringDate": hiringDate,
        "Avatar": avatar,
      };
}

Future<List<Colaborador>> getAllColaboradores() async {
  final response =
      await http.get(Uri.parse('http://127.0.0.1/ey_service/read.php'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Colaborador.fromJson(data)).toList();
  } else {
    throw Exception('Falha ao carregar os colaboradores');
  }
}

calculaSalarioBase() {
  var sb = 0;
  for (var item in demoColaborador) {
    sb += int.parse(item.sb!);
  }
  sb = (sb / demoColaborador.length) as int;
  return "R\$" + sb.toString();
}

List<Colaborador> demoColaborador = [
  Colaborador(
    nome: "Muriel Sancher",
    avatar: "assets/icons/avatar-svgrepo-com (1).svg",
    gpn: "BROKEWOKEOWK",
    rankAtual: "Manager",
    hiringDate: "1/03/2021",
    lead: "N",
    sb: "5884",
    empStatus: "Active",
    gender: "F",
    office: "São Paulo",
    sl: "Advisory",
    smuName: "PI-Enterprise Intelligence",
    subSL: "PI",
  ),
  Colaborador(
    nome: "Flavia Hara",
    avatar: "assets/icons/avatar-svgrepo-com (2).svg",
    gpn: "BR1252646990",
    rankAtual: "Staff/Assistant",
    hiringDate: "01/04/2018",
    lead: "N",
    sb: "5359",
    empStatus: "Active",
    gender: "F",
    office: "Campinas",
    sl: "Advisory",
    smuName: "INFORMATION SECURITY",
    subSL: "Risk",
  ),
  Colaborador(
    nome: "Cinthia Rosa",
    avatar: "assets/icons/avatar-svgrepo-com (3).svg",
    gpn: "BR1388541610",
    rankAtual: "Manager",
    hiringDate: "01/10/2016",
    lead: "D",
    sb: "4305",
    empStatus: "Active",
    gender: "F",
    office: "Brasilia - Ass",
    sl: "Advisory",
    smuName: "Risk",
    subSL: "Risk",
  ),
  Colaborador(
    nome: "José Carlos",
    avatar: "assets/icons/avatar-svgrepo-com (4).svg",
    gpn: "BR1147827550",
    rankAtual: "Senior Manager",
    hiringDate: "01/10/2014",
    lead: "P",
    sb: "7309",
    empStatus: "Active",
    gender: "M",
    office: "Salvador",
    sl: "Advisory",
    smuName: "SUPPLY CHAIN & OPERATIONS",
    subSL: "PI",
  ),
  Colaborador(
    nome: "Leticia Santos",
    avatar: "assets/icons/avatar-svgrepo-com (5).svg",
    gpn: "BR1186575320",
    rankAtual: "Manager",
    hiringDate: "01/09/2019",
    lead: "S",
    sb: "4305",
    empStatus: "Active",
    gender: "F",
    office: "Campinas",
    sl: "Advisory",
    smuName: "SUPPLY CHAIN & OPERATIONS",
    subSL: "PI",
  ),
  Colaborador(
    nome: "Roberto Ferreira",
    avatar: "assets/icons/avatar-svgrepo-com (6).svg",
    gpn: "BR1163717990",
    rankAtual: "Staff/Assistant",
    hiringDate: "01/05/2014",
    lead: "N",
    sb: "5359",
    empStatus: "Active",
    gender: "M",
    office: "Campinas",
    sl: "Advisory",
    smuName: "INFORMATION SECURITY",
    subSL: "Risk",
  ),
  Colaborador(
    nome: "Danielle Silva",
    avatar: "assets/icons/avatar-svgrepo-com (7).svg",
    gpn: "BR1126257290",
    rankAtual: "Senior",
    hiringDate: "01/05/2020",
    lead: "D",
    sb: "7202",
    empStatus: "Active",
    gender: "F",
    office: "Rio de Janeiro",
    sl: "Advisory",
    smuName: "PI-STRATEGY",
    subSL: "PI",
  ),
  Colaborador(
    nome: "Fernando Alvares",
    avatar: "assets/icons/avatar-svgrepo-com (8).svg",
    gpn: "BR1318917170",
    rankAtual: "Staff/Assistant",
    hiringDate: "01/12/2016",
    lead: "D",
    sb: "3141",
    empStatus: "Active",
    gender: "M",
    office: "Porto Alegre",
    sl: "Advisory",
    smuName: "RISK TRANSFORMATION",
    subSL: "Risk",
  ),
  Colaborador(
    nome: "Gabriel Monteiro",
    avatar: "assets/icons/avatar-svgrepo-com (9).svg",
    gpn: "BR1025935650",
    rankAtual: "Staff/Assistant",
    hiringDate: "01/01/2020",
    lead: "N",
    sb: "4026",
    empStatus: "Active",
    gender: "M",
    office: "Campinas",
    sl: "Advisory",
    smuName: "PI-Enterprise Intelligence",
    subSL: "PI",
  ),
];
