class TripModel {
  final int id;
  final String status;
  final String name;
  final String mobile;
  final String idNumber;
  final String date;
  final double totalPrice;
  final List<int> numChairs;
  final TripDetails trip;

  TripModel({
    required this.id,
    required this.status,
    required this.name,
    required this.mobile,
    required this.idNumber,
    required this.date,
    required this.totalPrice,
    required this.numChairs,
    required this.trip,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      status: json['status'],
      name: json['name'],
      mobile: json['mobile'],
      idNumber: json['idNumber'],
      date: json['date'],
      totalPrice: json['totalPrice'].toDouble(),
      numChairs: List<int>.from(json['NumChairs']),
      trip: TripDetails.fromJson(json['Trip']),
    );
  }
}

class TripDetails {
  final int id;
  final String status;
  final double price;
  final Employee employee;
  final City startCity;
  final City endCity;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;

  TripDetails({
    required this.id,
    required this.status,
    required this.price,
    required this.employee,
    required this.startCity,
    required this.endCity,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
  });

  factory TripDetails.fromJson(Map<String, dynamic> json) {
    return TripDetails(
      id: json['id'],
      status: json['Status'],
      price: json['Price'].toDouble(),
      employee: Employee.fromJson(json['Employee']),
      startCity: City.fromJson(json['Start_City']),
      endCity: City.fromJson(json['End_City']),
      startDate: json['Start_Date'],
      endDate: json['End_date'] ?? "",
      startTime: json['Start_Time'],
      endTime: json['End_Time'],
    );
  }
}

class Employee {
  final int id;
  final String mobile;
  final String personName;

  Employee({
    required this.id,
    required this.mobile,
    required this.personName,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      mobile: json['mobile'],
      personName: json['PersonName'],
    );
  }
}

class Driver {
  final int id;
  final String mobile;
  final String personName;

  Driver({
    required this.id,
    required this.mobile,
    required this.personName,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'],
      mobile: json['mobile'],
      personName: json['PersonName'],
    );
  }
}

class City {
  	final int id;
  	final String name;

  	City({
    	required this.id,
    	required this.name,
  	});

  	factory City.fromJson(Map<String, dynamic> json) {
    	return City(
      		id: json['id'],
      		name: json['name'],
    	);
  	}
}