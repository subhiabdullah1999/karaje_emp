import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:karajeapp/core/functions/changeFormatTime.dart';
import 'package:open_file/open_file.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import '../../core/class/statusrequest.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/tripsData.dart';
import '../../data/model/rerservationModel.dart';
import '../../linkapi.dart';

class PassengerController extends GetxController {
  List listTimes = [];

  var isSelectTime;
  int index = 0;
  DateTime date2 = DateTime.now();
  TextEditingController? date;
  String? lastDate;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  TripsData tripsData = TripsData(Get.find());
  // SearchData searchData = SearchData(Get.find());
  List header = [
    'رقم التذكرة',
    'رقم الهاتف',
    'الرقم الوطني',
    'الاسم الثلاثي',
    'رقم المقعد'
  ];

  List data = [];
  @override
  void onInit() async {
    // TODO: implement onInit
    date = TextEditingController(text: changeFormatDate(date2).toString());
    lastDate = changeFormatDate(date2).toString();
    await search();
    print(data);
    super.onInit();
  }

  selectTime(val) {
    isSelectTime = val;
    index = val['index'];
    print(index);
    update();
  }

  showCalender(context) {
    showDatePicker(
            context: context,
            initialDate: date2,
            firstDate: DateTime.now().subtract(const Duration(days: 1000)),
            lastDate: DateTime.now().add(const Duration(days: 60)))
        .then((DateTime? value) {
      if (value != null) {
        date = TextEditingController(text: changeFormatDate(value).toString());
        date2 = DateTime.utc(
            int.parse(date!.text.split('/')[0]),
            int.parse(date!.text.split('/')[1]),
            int.parse(date!.text.split('/')[2]));
        if (date!.text != lastDate) {
          lastDate = date!.text;
          print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
          print(data);
          print(date2);
          print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

          search();
        }
        update();
      }
    });
  }

  Future<void> generatePDF(index) async {
    final pdf = pw.Document();
    var arabicFont =
        pw.Font.ttf(await rootBundle.load("assets/Fonts/Amiri-Bold.ttf"));
    pdf.addPage(pw.Page(
      build: (context) {
        return pw.Column(children: [
          pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Text(AppLink.companyName,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold, font: arabicFont)),
          ),
          pw.SizedBox(height: 1.h),
          pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Text('جدول المسافرين ${listTimes[index]['اتجاه الرحلة']}',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold, font: arabicFont)),
          ),
          pw.SizedBox(height: 1.h),
          pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            //changeFormatDateForBackEnd(DateTime.now())
            child: pw.Text(
                'تاريخ الرحلة ${changeFormatDateForBackEnd(DateTime.now())}',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold, font: arabicFont)),
          ),
          pw.SizedBox(height: 3.h),
          pw.Table(
            border: pw.TableBorder.all(),
            children: [
              pw.TableRow(
                  children: List.generate(
                header.length,
                (index) => pw.Directionality(
                  textDirection: pw.TextDirection.rtl,
                  child: pw.Text(header[index],
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, font: arabicFont)),
                ),
              )),
              for (Map row in data[index])
                pw.TableRow(
                    children: row.entries.map((e) {
                  return pw.Directionality(
                    textDirection: pw.TextDirection.rtl,
                    child: pw.Text(e.value.toString(),
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, font: arabicFont)),
                  );
                }).toList()),
            ],
          )
        ]);
      },
    ));
    // Save the PDF file
    final output = await getTemporaryDirectory();
    final file = File(
        '${output.path}/${AppLink.companyName} ${changeFormatDateForBackEnd(DateTime.now())}.pdf');
    await file.writeAsBytes(await pdf.save());
    print('File stored at: ${file.path}');
    await OpenFile.open(file.path);
  }

  search() async {
    data = [];
    listTimes = [];

    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await tripsData.searchForDayData(
          '${date!.text.split('/')[0]}-${date!.text.split('/')[1]}-${date!.text.split('/')[2]}');
      print("=============================== response $response ");
      print(
          '${date!.text.split('/')[0]}-${date!.text.split('/')[1]}-${date!.text.split('/')[2]}');
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        print("dateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        print(data);
        print("dateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");

        print(data['status']);
        if (data['status'] == true) {
          for (int i = 0; i < data['data']['Trips'].length; i++) {
            this.data.add([]);
            listTimes.add({
              'اتجاه الرحلة':
                  // ignore: prefer_interpolation_to_compose_strings
                  '${'من ' + data['data']['Trips'][i]['Start_City']['name']} الى ' +
                      data['data']['Trips'][i]['End_City']['name'],
              'انطلاق الرحلة': DateFormat('HH:mm').format(DateTime.parse(
                  "2023-01-01 ${data['data']['Trips'][i]['Start_Time']}")),
              'index': i,
            });
            print("timeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
            print(listTimes);
            print("timeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");

            for (int j = 0;
                j < data['data']['Trips'][i]['Reservations'].length;
                j++) {
              this.data[i].add(
                {
                  'numberTicket': j + 1,
                  'phone': Reservation.fromJson(
                          data['data']['Trips'][i]['Reservations'][j])
                      .mobile,
                  'idCountry': Reservation.fromJson(
                          data['data']['Trips'][i]['Reservations'][j])
                      .idNumber,
                  'name': Reservation.fromJson(
                          data['data']['Trips'][i]['Reservations'][j])
                      .name,
                  'numberChair': Reservation.fromJson(
                          data['data']['Trips'][i]['Reservations'][j])
                      .numChairs!
                      .join(', ')
                      .toString(),
                },
              );
            }
          }
          if (listTimes.isNotEmpty) {
            isSelectTime = listTimes[0];
          }

          // print(Reservation.fromJson(this.data[1]['Reservations'][0]).client.mobile);
        } else {
          return Get.snackbar("فشل", 'لا يوجد رحلات متوفرة في هذا اليوم',
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("فشل", "تحقق من الاتصال بالانترنت");
      }
    }
  }
}
