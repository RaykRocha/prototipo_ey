class RecentFile {
  final String? icon, nome, date, valor;

  RecentFile({this.icon, this.nome, this.date, this.valor});
}

List demoRecentFiles = [
  RecentFile(
    icon: "assets/icons/avatar-svgrepo-com (1).svg",
    nome: "Fernando Alvares",
    date: "01/03/2021",
    valor: "R\$300",
  ),
  RecentFile(
    icon: "assets/icons/avatar-svgrepo-com (2).svg",
    nome: "Gabriel Monteiro",
    date: "27/02/2021",
    valor: "R\$250",
  ),
  RecentFile(
    icon: "assets/icons/avatar-svgrepo-com (5).svg",
    nome: "Danielle Silva",
    date: "23/02/2021",
    valor: "R\$550",
  ),
  RecentFile(
    icon: "assets/icons/avatar-svgrepo-com (4).svg",
    nome: "Rayk Rocha",
    date: "21/02/2021",
    valor: "R\$100",
  ),
  RecentFile(
    icon: "assets/icons/avatar-svgrepo-com (6).svg",
    nome: "Marcos Farias",
    date: "23/02/2021",
    valor: "R\$800",
  ),
  RecentFile(
    icon: "assets/icons/avatar-svgrepo-com (3).svg",
    nome: "Leticia Santos",
    date: "25/02/2021",
    valor: "R\$150",
  ),
];
