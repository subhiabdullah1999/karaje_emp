class Reservation {
  int? id;
  String? status;
  String? name;
  String? mobile;
  String? idNumber;
  int? totalPrice;
  List<int>? numChairs;

  Reservation(
      {this.id,
      this.status,
      this.name,
      this.mobile,
      this.idNumber,
      this.totalPrice,
      this.numChairs});

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    mobile = json['mobile'];
    idNumber = json['idNumber'];
    totalPrice = json['totalPrice'];
    numChairs = json['NumChairs'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['idNumber'] = this.idNumber;
    data['totalPrice'] = this.totalPrice;
    data['NumChairs'] = this.numChairs;
    return data;
  }
}