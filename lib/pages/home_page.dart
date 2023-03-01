import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:medqcx/models/details_model.dart';
import 'package:medqcx/utils/shimmer_device_tile.dart';
import 'package:intl/intl.dart';
import '../models/data_model.dart';
import '../utils/device_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> deviceList = [];
  List<Map<String, String>> deviceInfoList = List.generate(100, (index) => {});
  bool _isLoading = true;
  int itemCount = 5;

  Future<List<DeviceInfo>> getDeviceInfo() async {
    _isLoading = true;
    try {
      setState(() {
        itemCount = 5;
      });
      final apiUri = Uri.parse('https://jsonblob.com/api/1079326132867973120');
      final deviceApiUri =
          Uri.parse('https://jsonblob.com/api/1079330676414889984');
      final response = await http.get(apiUri);
      final deviceResponse = await http.get(deviceApiUri);
      if (response.statusCode != 200) {
        // TODO: Additional Error Handling
      }

      final List<dynamic> body = jsonDecode(response.body)['list'];
      _isLoading = false;
      setState(() {
        itemCount = body.map((e) => DeviceInfo.fromJson(e)).toList().length;
      });
      DetailModel detailModel =
          DetailModel.fromJson(json.decode(deviceResponse.body));
      var dateTime =
          DateFormat('yyyy-MM-dd').parse(detailModel.warrantyTill.toString());
      var warrantyDate = DateFormat('dd MMM yyyy').format(dateTime);
      for (int i = 0; i < itemCount; i++) {
        deviceInfoList[i].addAll({
          'createdById': detailModel.createdById,
          'deviceModel': detailModel.deviceModel.toString(),
          'imageUrls': detailModel.imageUrls,
          'insertedAt': detailModel.insertedAt.toString(),
          'lastServiceDate': warrantyDate.toString(),
          'maintenanceCycle': detailModel.maintenanceCycle.toString(),
          'manufacturer': detailModel.manufacturer.toString(),
          'name': detailModel.name.toString(),
          'serialNumber': detailModel.serialNumber.toString(),
          'updatedAt': detailModel.updatedAt.toString(),
          'updatedById': detailModel.updatedById,
          'warrantyTill': warrantyDate.toString(),
          'warrantyType': detailModel.warrantyType.toString(),
        });
      }
      return deviceList = body.map((e) => DeviceInfo.fromJson(e)).toList();
    } catch (_) {
      // TODO: Error handling
      return [];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getDeviceInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 20,
            right: 20,
          ),
          child: RefreshIndicator(
            onRefresh: () async {
              getDeviceInfo();
            },
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        getDeviceInfo();
                      },
                      child: Image.asset(
                        'assets/logo.jpeg',
                        height: 70,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'My Devices',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (context, index) => _isLoading
                        ? const ShimmerDeviceTile()
                        : DeviceTile(
                            imageURL: deviceList[index].imageUrl,
                            deviceName: deviceList[index].name,
                            manufacturer: deviceList[index].manufacturer,
                            modelNo: deviceList[index].model,
                            serialNo: deviceList[index].serialNumber,
                            warrantyTill: deviceInfoList[index]["warrantyTilll"]
                                .toString(),
                            warrantyType: deviceInfoList[index]["warrantyType"]
                                .toString(),
                            lastServiceDate: deviceInfoList[index]
                                    ["lastServiceDate"]
                                .toString(),
                            maintenanceCycle: deviceInfoList[index]
                                    ["maintenanceCycle"]
                                .toString(),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
