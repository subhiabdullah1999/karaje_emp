class ReservationByIDorMobile {
  int id;
  String status;
  String name;
  int totalPrice;
  List<int> numChairs;
  Client client;

  ReservationByIDorMobile({
    required this.id,
    required this.status,
    required this.name,
    required this.totalPrice,
    required this.numChairs,
    required this.client,
  });

  factory ReservationByIDorMobile.fromJson(Map<String, dynamic> json) {
    return ReservationByIDorMobile(
      id: json['id'],
      status: json['status'],
      name: json['name'],
      totalPrice: json['totalPrice'],
      numChairs: List<int>.from(json['NumChairs']),
      client: Client.fromJson(json['Client']),
    );
  }
}

class Client {
  int id;
  String name;
  DateTime? dateOfBirth;
  String mobile;
  String idNumber;
  int? typeId;

  Client({
    required this.id,
    required this.name,
    this.dateOfBirth,
    required this.mobile,
    required this.idNumber,
    this.typeId,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      name: json['name'],
      dateOfBirth: json['date_birth'] != null
          ? DateTime.parse(json['date_birth'])
          : null,
      mobile: json['mobile'],
      idNumber: json['idNumber'],
      typeId: json['type_id'] ?? 1,
    );
  }
}
