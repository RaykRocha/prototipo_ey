import 'package:flutter/material.dart';
import 'package:prototipo_ey/constants.dart';
import 'package:prototipo_ey/models/my_files.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CardInfo info;

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding * 0.75),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: info.color!.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(
                  info.icon!,
                  size: 40,
                ),
              ),
            ],
          ),
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.black, fontSize: 18),
          ),
          Text(
            info.info!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.black, fontSize: 22),
          )
        ],
      ),
    );
  }
}
