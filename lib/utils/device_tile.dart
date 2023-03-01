import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medqcx/main.dart';
import 'package:medqcx/pages/device_details_page.dart';
import 'package:medqcx/utils/tile_button.dart';

class DeviceTile extends StatelessWidget {
  const DeviceTile({
    Key? key,
    required this.imageURL,
    required this.deviceName,
    required this.manufacturer,
    required this.modelNo,
    required this.serialNo,
    required this.warrantyTill,
    required this.warrantyType,
    required this.lastServiceDate,
    required this.maintenanceCycle,
  }) : super(key: key);
  final String imageURL;
  final String deviceName;
  final String manufacturer;
  final String modelNo;
  final String serialNo;

//                             warranty_till
//                              warranty_type
//                              last_service_date
//                        o      maintenance_cycle
  final String warrantyTill;
  final String warrantyType;
  final String lastServiceDate;
  final String maintenanceCycle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                imageURL,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deviceName,
                    style: const TextStyle(),
                  ),
                  Text(manufacturer),
                  Row(
                    children: [
                      const Text(
                        'Model: ',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(modelNo),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Serial No: ',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        serialNo,
                        style: const TextStyle(fontSize: 12),
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
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: TileButton(
                  title: 'Raise Complaint',
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeviceDetailsScreen(
                                imagePath: imageURL,
                                name: deviceName,
                                manufacturer: manufacturer,
                                modelNo: modelNo,
                                serialNo: serialNo,
                                warrantyTill: warrantyTill,
                                warrantyType: warrantyType,
                                lastServiceDate: lastServiceDate,
                                maintenanceCycle: maintenanceCycle,
                              )),
                    );
                  },
                  child: TileButton(
                    title: 'View Details',
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
