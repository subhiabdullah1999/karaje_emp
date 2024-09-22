import 'package:flutter/material.dart';

import 'package:get/get.dart';

Container bannerForTermsAndConditions(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.3,
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage('assets/images/logo.png'))),
    child: Container(
      color: Colors.black.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Spacer(),
                // GestureDetector(
                //     child: Container(
                //         height: 40,
                //         width: 40,
                //         padding: EdgeInsets.all(8.0),
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10.0),
                //             color: Colors.transparent),
                //         child: Padding(
                //           padding: const EdgeInsets.all(0.0),
                //           child: Image.asset(
                //             'assets/images/logo.png',
                //             color: Colors.white,
                //             height: 20,
                //           ),
                //         )),
                //     onTap: () {
                //       Navigator.pushNamed(context, 'Location');
                //     }),
                // GestureDetector(
                //     child: Container(
                //         height: 40,
                //         width: 40,
                //         padding: EdgeInsets.all(8.0),
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10.0),
                //             color: Colors.transparent),
                //         child: Padding(
                //           padding: const EdgeInsets.all(0.0),
                //           child: Image.asset(
                //             'assets/images/vip.png',
                //             color: Colors.white,
                //           ),
                //         )),
                //     onTap: () {
                //       Navigator.pushNamed(context, 'Notifications');
                //     }),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  'الخصوصية وسياسة الاستخدام',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
