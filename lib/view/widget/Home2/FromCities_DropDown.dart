import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/Home/AddNewTrip_Controller.dart';

class FromCitiesDropDown extends StatelessWidget {
  final String labelText;
  final RxInt controller;

  const FromCitiesDropDown({
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
        width: 90.w,
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
                        '${addNewTripController.cities.isEmpty ? 'لا يوجد محافظات' : addNewTripController.selectedFromCity == 0.obs ? 'اختر المحافظة' : addNewTripController.cities[addNewTripController.selectedFromCityId.toInt()]['name']}',
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.grey,
                          fontSize: 16,
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

  for (int index = 0; index < addNewTripController.cities.length; index++) {
    var cities = addNewTripController.cities[index];
    popupMenuItems.add(
      PopupMenuItem(
        value: index,
        child: Text(
          cities['name'],
          style: TextStyle(
            color: Colors.black,
            height: 0.2.h,
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
    // Set the width of the dropdown menu to the width of the container
    //width: containerWidth,
    position: RelativeRect.fromLTRB(
      position.dx - 10.w, // left
      position.dy + 10.h, // top
      containerWidth - position.dx - buttonRect.size.width, // right
      MediaQuery.of(context).size.height - position.dy, // bottom
    ),
    items: popupMenuItems,
    //initialValue: dropdownController.selectedItem.value,
  ).then((value) {
    var cities = addNewTripController.cities[value];
    if (value != null) {
      addNewTripController.updateSelectedFromCity(
        cities['id'],
      );
      addNewTripController.updateSelectedFromCityId(
        value,
      );
      //print('city id ${addNewTripController.selectedFromCity.value}');
    }
  });
}
