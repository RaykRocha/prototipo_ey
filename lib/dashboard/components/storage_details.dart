import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Chart(),
          StorageInfoCard(
              color: Colors.blue, title: "Need to Progress", qtda: "2"),
          StorageInfoCard(
              color: Colors.amber, title: "Strategic Impact", qtda: "3"),
          StorageInfoCard(color: Colors.green, title: "Progressing", qtda: "5"),
          StorageInfoCard(
              color: Colors.purple, title: "Differentiating", qtda: "1"),
        ],
      ),
    );
  }
}
