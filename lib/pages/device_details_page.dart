import 'package:flutter/material.dart';

import '../utils/contract_tile.dart';
import '../utils/device_info_tile.dart';

class DeviceDetailsScreen extends StatelessWidget {
  const DeviceDetailsScreen({
    super.key,
    required this.imagePath,
    required this.name,
    required this.manufacturer,
    required this.modelNo,
    required this.serialNo,
    required this.warrantyTill,
    required this.warrantyType,
    required this.lastServiceDate,
    required this.maintenanceCycle,
  });

  final String imagePath;
  final String name;
  final String manufacturer;
  final String modelNo;
  final String serialNo;
  final String warrantyTill;
  final String warrantyType;
  final String lastServiceDate;
  final String maintenanceCycle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BottomNavigationBar(fixedColor: Colors.deepPurple, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.devices), label: 'My Devices'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined), label: 'Schedule'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
      ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                    ),
                  ),
                  const Text(
                    'Device Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'DEVICE INFO',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    DeviceInfoTile(
                      imagePath: imagePath,
                      name: name,
                      manufacturer: manufacturer,
                      modelNo: modelNo,
                      serialNo: serialNo,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Contracts and certifications'.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Icon(
                          Icons.edit,
                          color: Colors.deepPurple,
                          size: 20,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const ContractTile(
                      title: 'Warranty',
                      value: 'Yes',
                    ),
                    const ContractTile(
                      title: 'Insurance',
                      value: 'No',
                    ),
                    const ContractTile(
                      title: 'Additional Certificates',
                      value: 'Yes',
                    ),
                    ContractTile(
                      title: 'AMC/DMC',
                      value: warrantyType,
                    ),
                    ContractTile(
                      title: 'Last Service Date',
                      value: lastServiceDate,
                    ),
                    ContractTile(
                      title: 'Maintenance Cycle',
                      value: maintenanceCycle,
                    ),
                    const ContractTile(
                      title: 'Next Service Date',
                      value: '20 May 2021',
                    ),
                    Text(
                      'Service History'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const ServiceTile(),
                    const ServiceTile(),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple,
                      ),
                      child: const Center(
                        child: Text(
                          'Troubleshoot',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  const ServiceTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '01 Jan 2021',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: Colors.purple),
            child: const Text(
              'View Report',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
