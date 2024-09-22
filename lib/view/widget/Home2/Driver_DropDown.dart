import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Home/AddNewTrip_Controller.dart';

class DriverDropDown extends StatelessWidget {
  final String labelText;
  final RxInt controller;

  const DriverDropDown({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final AddNewTripControllerImp addNewTripController =
        Get.put(AddNewTripControllerImp());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 13.h,
        width: 88.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelText,
              style: TextStyle(
                color: Colors.black,
                height: 0.2.h,
                fontSize: 13.sp,
                fontFamily: 'Cairo',
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              height: 7.h,
              width: 90.w,
              child: InkWell(
                onTap: () {
                  _showDropdownMenu(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${addNewTripController.drivers.isEmpty ? 'لا يوجد سائقين' : addNewTripController.selectedDriverId == 0.obs ? 'اختر السائق' : addNewTripController.drivers[controller.toInt()]['PersonName']}',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        onPressed: () => _showDropdownMenu(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showDropdownMenu(BuildContext context) {
  final AddNewTripControllerImp addNewTripController =
      Get.put(AddNewTripControllerImp());
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  final buttonRect = context.findRenderObject() as RenderBox;
  final Offset position =
      buttonRect.localToGlobal(Offset.zero, ancestor: overlay);
  final containerWidth = MediaQuery.of(context).size.width;

  List<PopupMenuItem<dynamic>> popupMenuItems = [];

  for (int index = 0; index < addNewTripController.drivers.length; index++) {
    var driver = addNewTripController.drivers[index];
    popupMenuItems.add(
      PopupMenuItem(
        value: index,
        child: Text(
          driver['PersonName'],
          style: TextStyle(
            color: Colors.black,
            height: 0.20.h,
            fontSize: 13.sp,
            fontFamily: 'Cairo',
            letterSpacing: 1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  showMenu(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.sp),
    ),
    context: context,
    position: RelativeRect.fromLTRB(
      position.dx - 10.w, // left
      position.dy + 10.h, // top
      containerWidth - position.dx - buttonRect.size.width, // right
      MediaQuery.of(context).size.height - position.dy, // bottom
    ),
    items: popupMenuItems,
  ).then((value) {
    if (value != null) {
      addNewTripController.updateSelectedDriverId(
          int.parse('${addNewTripController.drivers[value]['id']}'));
      addNewTripController.updateSelectedDriverName(
        value,
      );
    }
    print(addNewTripController.drivers[value]['id']);
  });
}
