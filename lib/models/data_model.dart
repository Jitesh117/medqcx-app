
class DeviceInfo {
  final String id;
  final String model;
  final String manufacturer;
  final String name;
  final String serialNumber;
  final int health;
  final String status;
  final String imageUrl;

  DeviceInfo({
    required this.id,
    required this.model,
    required this.manufacturer,
    required this.name,
    required this.serialNumber,
    required this.health,
    required this.status,
    required this.imageUrl,
  });

  static DeviceInfo fromJson(Map<String, dynamic> json) => DeviceInfo(
        id: json['id'],
        model: json['device_model'],
        manufacturer: json['manufacturer'],
        name: json['name'],
        serialNumber: json['serial_number'],
        health: json['health'],
        status: json['status'],
        imageUrl: json['image_url'],
      );
}