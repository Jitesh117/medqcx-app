import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DeviceInfoTile extends StatelessWidget {
  const DeviceInfoTile({
    Key? key,
    required this.imagePath,
    required this.name,
     required this.manufacturer,
     required this.modelNo,
     required this.serialNo,
  }) : super(key: key);

  final String imagePath;
  final String name;
  final String manufacturer;
  final String modelNo;
  final String serialNo;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          'https://marketing.webassets.siemens-healthineers.com/2a94d46f344cf4fc/ba997d636633/v/77a8ec27432e/siemens-healthineers_CT_SOMATOM_X.ceed.png',
          height: 100,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
             Text(manufacturer),
            Row(
              children:  [
                Text(
                  'Model: ',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(modelNo),
              ],
            ),
            Row(
              children:  [
                Text(
                  'Serial No: ',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  serialNo,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: const [
            Icon(
              CupertinoIcons.heart_fill,
              color: Colors.red,
            ),
            Icon(
              CupertinoIcons.heart_fill,
              color: Colors.red,
            ),
            Icon(
              CupertinoIcons.heart,
              color: Colors.red,
            ),
          ],
        ),
      ],
    );
  }
}
