import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';
import '../../../controller/Home/AddNewReservation_Controller.dart';


class Ecash extends StatefulWidget {
  final String price;

   Ecash({super.key, required this.price});

  @override
  State<Ecash> createState() => _EcashState();


}

class _EcashState extends State<Ecash> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  // Function to generate MD5 hash
  String generateMD5(
      String merchantKey, String salt, String price, String orderRef) {
    String data = merchantKey + salt + price + orderRef;
    var bytes = utf8.encode(data);
    var md5Hash = md5.convert(bytes);
    print('md5 hash${md5Hash.toString().toUpperCase()}');
    return md5Hash.toString().toUpperCase();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final AddNewReservationControllerImp addNewReservationController =
    Get.put(AddNewReservationControllerImp());
    //PaymantController paymantController = Get.put(PaymantController());

    // Replace these values with your actual merchant key and salt
    String merchantKey = '8W1X5X';
    String salt =
        'GMD15WMR7UQJZA8FE83LPBJ81JY0C9FWCFXR9PWYDJ03O1H6G2G05G0QLSCTT5HO';
    String orderRef = Uuid().v4().toString();

    // Generate MD5 hash
    String md5Hash = generateMD5(merchantKey, salt, widget.price, orderRef);

    final webviewcontroller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {

          },
          onPageFinished: (String url) {

            if (isLoading) {
              isLoading = false;
              setState(() {});
            }
            // Add any onPageFinished logic here.
          },
          onWebResourceError: (WebResourceError error) {
            // Handle web resource errors.
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {

              addNewReservationController.addNewReservationecash(context);

              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://checkout.ecash-pay.co/Checkout/Card/0IUYSF/8W1X5X/$md5Hash/SYP/${widget.price}/AR/$orderRef/https%3A%2F%2Fwww.google.com%2F/'));

    final webviewcontroller2 = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {

          },
          onPageFinished: (String url) {

            if (isLoading) {
              isLoading = false;
              setState(() {});
            }
            // Add any onPageFinished logic here.
          },
          onWebResourceError: (WebResourceError error) {
            // Handle web resource errors.
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {

              addNewReservationController.addNewReservation(context);

              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://checkout.ecash-pay.co/Checkout/QR/0IUYSF/8W1X5X/$md5Hash/SYP/${widget.price}/AR/$orderRef/https%3A%2F%2Fwww.google.com%2F/'));


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'QR'),
            Tab(text: 'Card'),
          ],
        ),
        leading: const SizedBox(),
        title: Text(
          'إي-كاش',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
            fontFamily: 'Cairo',
          ),
        ),
        centerTitle: true,
      ),
      body: TabBarView(
        controller: _tabController,
       children: [
         Stack(
           children: [
             WebViewWidget(
               controller: webviewcontroller2,
             ),
             isLoading
                 ? Center(
               child: CircularProgressIndicator(),
             )
                 : Container(),
           ],
         ),
         Stack(
           children: [
             WebViewWidget(
               controller: webviewcontroller,
             ),
             isLoading
                 ? Center(
               child: CircularProgressIndicator(),
             )
                 : Container(),
           ],
         ),
       ],
      ),
    );
  }
}
