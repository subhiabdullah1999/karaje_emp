import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class TableForPassenger extends StatelessWidget {
  final List data;
  const TableForPassenger({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.only(left: 3.w),
      child: DataTable2(
          dataRowHeight: 5.h,
          headingRowHeight: 4.h,
          columnSpacing: 0,
          horizontalMargin: 3.w,
          minWidth: 145.w,
          headingRowDecoration: const BoxDecoration(
              color: Color(0xff669AD4),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          columns: [
            DataColumn2(
              label: Center(
                child: Text(
                  'الحالة',
                  style: TextStyle(
                      fontSize: 10.sp, color: const Color(0xff454545)),
                ),
              ),
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: Center(
                child: Text(
                  'رقم التذكرة',
                  style: TextStyle(
                      fontSize: 10.sp, color: const Color(0xff454545)),
                ),
              ),
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: Center(
                child: Text(
                  'رقم الهاتف',
                  style: TextStyle(
                      fontSize: 10.sp, color: const Color(0xff454545)),
                ),
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Center(
                  child: Text(
                'الرقم الوطني',
                style:
                    TextStyle(fontSize: 10.sp, color: const Color(0xff454545)),
              )),
              size: ColumnSize.M,
            ),
            DataColumn2(
                label: Center(
                    child: Text('الاسم الثلاثي',
                        style: TextStyle(
                            fontSize: 10.sp, color: const Color(0xff454545)))),
                size: ColumnSize.L),
            DataColumn2(
              label: Center(
                  child: Text(
                'رقم المقعد',
                style:
                    TextStyle(fontSize: 10.sp, color: const Color(0xff454545)),
              )),
              size: ColumnSize.S,
            ),
          ],
          rows: List<DataRow>.generate(
              data.length,
              (index) => DataRow(cells: [
                    DataCell(Checkbox(
                      onChanged: (value) {},
                      value: true,
                      activeColor:
                          true ? AppColor.primaryColor : Colors.black26,
                    )),
                    DataCell(Center(
                        child: Text(
                      data[index]['numberTicket'].toString(),
                      style: const TextStyle(color: Color(0xff454545)),
                    ))),
                    DataCell(Text(
                      data[index]['phone'],
                      style: const TextStyle(color: Color(0xff454545)),
                    )),
                    DataCell(Text(
                      data[index]['idCountry'],
                      style: TextStyle(
                          fontSize: 10.sp, color: const Color(0xff454545)),
                    )),
                    DataCell(Text(
                      data[index]['name'],
                      style: TextStyle(
                          fontSize: 9.sp, color: const Color(0xff454545)),
                    )),
                    DataCell(Center(
                        child: Text(
                      data[index]['numberChair'],
                      style: const TextStyle(color: Color(0xff454545)),
                    ))),
                  ]))),
    );
  }
}
