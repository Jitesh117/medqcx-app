class DetailModel {
  dynamic createdById;
  String? deviceModel;
  dynamic imageUrls;
  String? insertedAt;
  String? lastServiceDate;
  int? maintenanceCycle;
  String? manufacturer;
  String? name;
  String? serialNumber;
  String? updatedAt;
  dynamic updatedById;
  String? warrantyTill;
  String? warrantyType;
  List<ServiceHistory>? serviceHistory;

  DetailModel(
      {this.createdById,
      this.deviceModel,
      this.imageUrls,
      this.insertedAt,
      this.lastServiceDate,
      this.maintenanceCycle,
      this.manufacturer,
      this.name,
      this.serialNumber,
      this.updatedAt,
      this.updatedById,
      this.warrantyTill,
      this.warrantyType,
      this.serviceHistory});

  DetailModel.fromJson(Map<String, dynamic> json) {
    createdById = json["created_by_id"];
    if (json["device_model"] is String) {
      deviceModel = json["device_model"];
    }
    imageUrls = json["image_urls"];
    if (json["inserted_at"] is String) {
      insertedAt = json["inserted_at"];
    }
    if (json["last_service_date"] is String) {
      lastServiceDate = json["last_service_date"];
    }
    if (json["maintenance_cycle"] is int) {
      maintenanceCycle = json["maintenance_cycle"];
    }
    if (json["manufacturer"] is String) {
      manufacturer = json["manufacturer"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["serial_number"] is String) {
      serialNumber = json["serial_number"];
    }
    if (json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    updatedById = json["updated_by_id"];
    if (json["warranty_till"] is String) {
      warrantyTill = json["warranty_till"];
    }
    if (json["warranty_type"] is String) {
      warrantyType = json["warranty_type"];
    }
    if (json["service_history"] is List) {
      serviceHistory = json["service_history"] == null
          ? null
          : (json["service_history"] as List)
              .map((e) => ServiceHistory.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["created_by_id"] = createdById;
    data["device_model"] = deviceModel;
    data["image_urls"] = imageUrls;
    data["inserted_at"] = insertedAt;
    data["last_service_date"] = lastServiceDate;
    data["maintenance_cycle"] = maintenanceCycle;
    data["manufacturer"] = manufacturer;
    data["name"] = name;
    data["serial_number"] = serialNumber;
    data["updated_at"] = updatedAt;
    data["updated_by_id"] = updatedById;
    data["warranty_till"] = warrantyTill;
    data["warranty_type"] = warrantyType;
    if (serviceHistory != null) {
      data["service_history"] = serviceHistory?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class ServiceHistory {
  int? id;
  String? serviceType;

  ServiceHistory({this.id, this.serviceType});

  ServiceHistory.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["service_type"] is String) {
      serviceType = json["service_type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["service_type"] = serviceType;
    return data;
  }
}
