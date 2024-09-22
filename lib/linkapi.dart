class AppLink {
  static const String server = "https://ac.ka-ad.sy/api";
  static const String imagesServer = "https://ac.ka-ad.sy/uploads/";
//================================================================
  static String token = '';
  static String logo = '';
  static String companyName = '';

  static const String searchForCompany = "$server/employee/searchForCompany";
  static const String tripForCompany = "$server/trip/Company";
  static const String myReservation = "$server/client/pendingRes";
  static const String searchOnIdOrMobile =
      "$server/employee/getReservationsForClient";
  static const String getTripForEmployeeToday =
      "$server/trip/getTripForEmployeeToday";
  static const String getTripForEmployeeByday =
      "$server/employee/getTripForEmployeeByDay";
  static const String getTripForEmployeeBydayy =
      "$server/employee/searchForTravelers";
  static const String canceledTrip = "$server/employee/canceledTrip";
  static const String canceledReservation = "$server/reservation/Canceled";
  static const String addReservation = "$server/reservation/Create";

  static const String getcity = "$server/city/get";
// ================================= Auth ========================== //
  static const String signIn = "$server/employee/login";
  static const String updateApp = "$server/get-version";
// ================================= AddNewReservation ========================== //
  static const String addreservation = "$server/reservation/createWithOutAuth";
  static const String addnotification = "$server/notification/store";
  static const String completedRes = "$server/reservation/Completed";
  static const String Payment = "$server/reservation/Payment";
  static const String gettrips = "$server/trip/getTripForEmployee";
  // static const String gettripss = "$server/trip/getTripForEmployee";

// ================================= AddNewTrip ========================== //
  static const String addnewtrip = "$server/trip/Create";
  static const String getdrivers = "$server/driver/get";
  static const String getcities = "$server/city/get";
// ================================= QRCodeScanner ========================== //
  static const String getReservation = "$server/reservation";
  static const String getversion = "$server/get-version";
}
