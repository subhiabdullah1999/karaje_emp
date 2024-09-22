// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import '../../../controller/Home/AddNewTrip_Controller.dart';

// class NumChairsDropDown extends StatelessWidget {
//   final String labelText;

//   const NumChairsDropDown({
//     super.key,
//     required this.labelText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final AddNewTripControllerImp addNewTripController =
//         Get.put(AddNewTripControllerImp());

//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: SizedBox(
//         height: 15.h,
//         width: 90.w,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               labelText,
//               style: TextStyle(
//                 color: Colors.black,
//                 height: 0.2.h,
//                 fontSize: 13.sp,
//                 fontFamily: 'Cairo',
//                 letterSpacing: 1,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(
//               height: 1.h,
//             ),
//             SizedBox(
//               height: 7.h,
//               width: 90.w,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Obx(
//                       () => Text(
//                         addNewTripController.selectedNumChairs == '0'.obs
//                             ? 'اختر عدد المقاعد'
//                             : addNewTripController.selectedNumChairs.value,
//                         style: const TextStyle(
//                           fontFamily: 'Cairo',
//                           color: Colors.grey,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.arrow_drop_down),
//                       onPressed: () => _showDropdownMenu(context),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void _showDropdownMenu(BuildContext context) {
//   final AddNewTripControllerImp addNewTripController =
//       Get.put(AddNewTripControllerImp());
//   final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
//   final buttonRect = context.findRenderObject() as RenderBox;
//   final Offset position =
//       buttonRect.localToGlobal(Offset.zero, ancestor: overlay);
//   final containerWidth = MediaQuery.of(context).size.width;

//   showMenu(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.sp),
//     ),
//     context: context,
//     position: RelativeRect.fromLTRB(
//       containerWidth - position.dx - buttonRect.size.width,
//       position.dy + 20.h,
//       containerWidth - position.dx - buttonRect.size.width,
//       MediaQuery.of(context).size.height - position.dy,
//     ),
//     items: [
//       PopupMenuItem(
//         textStyle: TextStyle(
//           height: 0.2.h,
//           fontSize: 11.sp,
//           fontFamily: 'Cairo',
//           letterSpacing: 1,
//         ),
//         value: '34',
//         child: Text(
//           '34',
//           style: TextStyle(
//             color: Colors.black,
//             height: 0.2.h,
//             fontSize: 13.sp,
//             fontFamily: 'Cairo',
//             letterSpacing: 1,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       PopupMenuItem(
//         textStyle: TextStyle(
//           height: 0.2.h,
//           fontSize: 11.sp,
//           fontFamily: 'Cairo',
//           letterSpacing: 1,
//         ),
//         value: '25',
//         child: Text(
//           '25',
//           style: TextStyle(
//             color: Colors.black,
//             height: 0.2.h,
//             fontSize: 13.sp,
//             fontFamily: 'Cairo',
//             letterSpacing: 1,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     ],
//     initialValue: addNewTripController.selectedNumChairs.value,
//   ).then((value) {
//     if (value != null) {
//       addNewTripController.updateSelectedNumChairs(value);
//     }
//   });
// }
