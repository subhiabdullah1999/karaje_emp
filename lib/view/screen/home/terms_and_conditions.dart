import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karajeapp/controller/terms_and_conditions_controler.dart/terms_and_conditions_controler.dart';
import 'package:karajeapp/view/widget/home/terms_and_conditions_comp.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(TermsAndConditionsControllerImp());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bannerForTermsAndConditions(context),
              Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GetBuilder<TermsAndConditionsControllerImp>(
                    builder: (controller) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.isSelect = 0;
                                controller.updateUi();
                              },
                              child: Container(
                                height: 45,
                                width: 90,
                                child: Center(
                                  child: Text(
                                    "العربية",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: controller.isSelect == 1
                                        ? Colors.black26
                                        : Colors.orange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.isSelect = 1;
                                controller.updateUi();
                              },
                              child: Container(
                                height: 45,
                                width: 90,
                                child: Center(
                                  child: Text(
                                    "English",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: controller.isSelect == 0
                                        ? Colors.black26
                                        : Colors.orange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        controller.isSelect == 0
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "سياسية الخصوصية وشروط الاستخدام الخاصة بتطبيق كراجي"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        height: 2),
                                  ),
                                  SizedBox(height: 5),
                                  // Text(
                                  //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ',
                                  //   style: TextStyle(color: Colors.black54),
                                  // ),
                                  SizedBox(height: 15),
                                  Text(
                                    "توضح هذه الوثيقة البيانات الشخصية التي نجمعها، وكيفية استخدامها ومشاركتها، بالاضافة إلى الخيارات المتوفرة أمامك بشأن هذه البيانات. ونوصيك بقراءة هذه الوثيقة والتي تتناول النقاط الرئيسية لممارسات الخصوصية، الرجاء قراءة هذه الشروط قبل تفعيل الحساب، وفي حال وجود أي استفسارات يمكنك التواصل على الرقم 0983022226"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "تعريف بالتطبيق :".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "تطبيق كراجي )ويشار اليه ”التطبيق“( هو تطبيق إلكتروني لحجز رحلات نقل )بولمن(في الجمهورية العربية السورية، حيث يعمل التطبيق على أجهزة الهاتف الجوال وتعمل الشركة على تطويره وإضافة الخدمات لضمان  الاستمرار والاعتماد عليه. تطبيق العمالء: يتم استخدامه من قبل شريحة من المجتمع التي تحتاج وسيلة لحجز تذكرة سفر للصعود في رحلة نقل )بولمن(. تطبيق الموظف: يتم استخدامه من قبل الموظفين التابعين لشركات النقل المتعاقدين معهم والمسموح لهم بتقديم الخدمات عبر التطبيق."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "الجهة المسؤولة عن التطبيق:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "شركة ستوري لينك link story المحدودة المسؤولية مسجلة في السجل التجاري بدمشق تحت رقم: 20251 بتاريخ 8 في الجمهورية العربية السورية."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "الفئات المستهدفة:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "الركاب: هم الاشخاص الذين يقومون بطلب للحصول على تذكرة صعود حافلة )بولمان(. \n الشركات: هم الشركات التي نقوم بالتعاقد معهم الذين يقومون بتقديم خدمة رحلات عبر التطبيق "
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "توصيف عمل التطبيق:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "هو تطبيق للمستخدم لحجز تذكرة حافلة)بولمن( في سورية وبأي وقت وكيفية استخدام التطبيق يجب الاطلاع على التفاصيل التالية: \n الحساب: عند فتح التطبيق لاول مرة يطلب من العميل إدخال رقم الهاتف ليصل كود التفعيل الخاص به المكون من خمس أرقام لفتح التطبيق وعند التأكد من صحة الكود يطلب منه إدخال الاسم والكنية والرقم الوطني والمواليد وإرفاق صورة الهوية وبطاقة جامعة اذا وجدت."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "عمل التطبيق:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "بولمان نقل: \n يسمح بالتنقل بين مناطق المحافظة السورية حيث يجب تحديد نقطة بداية الرحلة ونهايتها إما لوجهة معينة أو اختيار الرحلة مفتوحة الوجهة واختيار ليتم إظهار تفاصيل الرحلة المتوقعة من مدة وتكلفة حيث جميع القيم الظاهرة هي قيم تقريبية يمكن أن تتغير عند نهاية الرحلة تبعا للمسافة الفعلية المقطوعة وزمن الرحلة الفعلي المحتسبة من قبل تطبيق الموظف، وعند طلب الرحلة سيتم حجز التذكرة سيصل اشعار إليه بمعلومات الرحلة وتذكرة. \n آلية الدفع والتحصيل: \n يمكن للعميل أن يدفع للسائق مبلغ الرحلة بشكل كامل بشكل مباشر )كاش(فقط عند حجز بلكراج، وفي حال أراد راكب دفع  \n تطبيق مستخدم يستطيع دفع إلكتروني عبر خدمة وشركة )سيريتيل كاش ,اي كاش , كاش موبايل( \n الالغاء: \n يحق للعميل إلغاء طلب الرحلة خلال المدة التي حددتها الشركة )5 دقائق ( وفي حال إلغاء الرحلة بعد انتهاء المدة المحددة ترتب على العميل دفع غرامة تحدد قيمتها من قبل الشركة. "
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "ميزات أخرى:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "• - السرعة: حيث يوفر التطبيق الرحلة التي سوف تنطلق قريبا. \n • - الامان: من خلال التعامل مع أفضل شركات النقل في سورية. \n • - تقنيات متطورة: تم استخدام أفضل التقنيات البرمجية الحديثة لتسهيل عملية الاستخدام. \n • - الخصوصية"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "خدمات إضافية:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "• -استعلام العميل عن كافة التذكرات التي قام بها وإظهار كافة التفاصيل . \n • -إمكانية تقديم اقتراحات للشركة والتواصل معها."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "صلاحيات الوصول:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "يمكن للتطبيق الوصول إلى الملفات لاختيار صورة لك و حفظ تذكرة في جهازك. \n صلاحية قراءة رسالة sms كود التفعيل \n صلاحية الهاتف لتتمكن من اتصال مع الدعم الفني"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "الشكاوي:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "إمكانية تقديم شكوى بشكل فوري بعد دفع مبلغ الرحلة، أو في وقت لاحق حيث يمكنك اختيار الرحلة التي ترغب في تقديم شكوى حولها يمكن التواصل بشكل مباشر عن طريق معلومات التواصل الخاصة بالشركة."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "الاقتراحات:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "إمكانية تقديم ملاحظات واقتراحات وشكاوى حول التطبيق وسيتم الرد من قبل الشركة بأقرب وقت ممكن، وفي حال لم تكن راضيا عن الرد أو تعتقد أن معالجة معلوماتك لا تتوافق مع قانون تنظيم التواصل على الشبكة ومكافحة الجريمة المعلوماتية يمكنك التواصل معنا عبر الاتصال بالرقم 0983022226 او عن طريق البريد اإللكتروني sy.storylink@i"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "حقوق المستخدم ومسؤولياته وآليات الحماية والخصوصية لمعلوماته:"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "• - يحق للعميل إلغاء الطلب خلال المدة التي تحددها الشركة. \n • - على العميل دفع تكلفة الرحلة كاملة, وفي حال عدم الدفع يقوم الموظف بتبليغ الشركة عن طريق التطبيق )لم يتم الدفع(. \n • - يحق للشركة حظر حسابات المستخدمين الذين يسيئون استعمال الخدمة.\n • - يجوز للشركة الاحتفاظ ببيانات معينة للمستخدم بعد تلقي طلب بحذف الحساب، والبيانات المتعلقة بالامتثال للمتطلبات القانونية، وذلك إذا لزم الامر."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "حقوق الجهة المسؤولة عن التطبيق وواجباتها:"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "تحتفظ الشركة ببيانات الملف التعريفي للمستخدم، ومعامالته وبيانات الاستخدامات والبيانات الشخصية الاخرى مادام المستخدم محتفظاً بحسابه في الشركة، وتتحدد فترة الاحتفاظ بهذه المعلومات اعتمادا على عوامل النزاعات المحتملة، والارشادات الصادرة عن الهيئة الوطنية لخدمات  تقانة المعلومات والهيئات الحكومية الاخرى وسيتم نقل المعلومات التي نجمعها عنك وتخزينها على خوادمنا الموجودة داخل الجمهورية العربية السورية فنحن حريصون وشفافة للغاية بشأن ما تتم مشاركة معلوماتك معه. كما أنه يمكن الكشف عن معلوماتك أو نقلها في حال الدخول في مشروع مشترك مع كيان تجاري آخر، أو تم شراؤه أو بيعه لكيان تجاري آخر"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "التسويق:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "يتضمن التسويق عن خدمات الشركة، وميزاتها، وعروضها الترويجية والدراسات القائمة، واستطلاعات الرأي، والاخبار والتحديثات والفعاليات على وسائل التواصل الخاصة بالمستخدمين."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "الاجراءات التي ستتخذها الجهة في حال مخالفة المستخدم لسياسة الاستحدام:"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "يجوز لنا استخدام البيانات الشخصية ) رقم الهاتف( التي نجمعها للتحقيق في المطالبات أو النزاعات المتعلقة باستخدام خدمات الشركة وحلها، أو وفقا لما يسمح به القانون، أو بناء على طلب جهات التنظيم، والجهات الحكومية، والاستفسارات الرسمية. \n يجوز للشركة مشاركة بيانات المستخدمين الشخصية المذكورة سابقا إذا اعتقدنا أنها مطلوبة بموجب القانون، أو الاجراءات القانونية السارية أو الطلبات الحكومية، أو حيث ما يكون الكشف عن هذه البيانات ملائمة بسبب أمور تمس السلامة أو مخاوف مشابهة. \n ويتضمن ذلك مشاركة البيانات الشخصية مع مسؤولي تنفيذ القانون، لحماية حقوق الشركة أو ممتلكاتها أو حقوق الاخرين أو سلامتهم أو ممتلكاتهم، أو في حال وجود مطالبة أو نزاع يتعلق باستخدام خدماتنا. \n يجوز للشركة مشاركة بيانات المستخدم الشخصية بخالف ما هو موضح في هذه الوثيقة إذا أبلغنا المستخدم ووافق على المشاركة."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "تعديل سياسة الاستخدام".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "يجوز لنا تحديث هذه الوثيقة من حين الى اخر واعلامك بتغييرها عبر مواقع التواصل الاجتماعي، وخدمة العملاء ويعد استخدام خدماتنا بعد تحديثها موافقة على الاشعار المحدث"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  // SizedBox(height: 5),
                                  // Text(
                                  //   ' It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English',
                                  //   style: TextStyle(color: Colors.black54),
                                  // ),
                                  // SizedBox(height: 15),
                                  // Text(
                                  //   'Where does it come from?',
                                  //   style:
                                  //       TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                                  // ),
                                  // SizedBox(height: 5),
                                  // Text(
                                  //   'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words ',
                                  //   style: TextStyle(color: Colors.black54),
                                  // ),
                                  // SizedBox(height: 15),
                                  // Text(
                                  //   'Where can I get some?',
                                  //   style:
                                  //       TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                                  // ),
                                  // SizedBox(height: 5),
                                  // Text(
                                  //   'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.  ',
                                  //   style: TextStyle(color: Colors.black54),
                                  // ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Privacy Policy and Terms of Use and My karaje[]"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        height: 2),
                                  ),
                                  SizedBox(height: 5),
                                  // Text(
                                  //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ',
                                  //   style: TextStyle(color: Colors.black54),
                                  // ),
                                  SizedBox(height: 15),
                                  Text(
                                    "“This document explains the personal data that we collect, how we use and share it, in addition to the choices available to you regarding this data. We recommend that you read this document, which addresses the main points of privacy practices. Please read these terms before activating the account, and if you have any questions, you can contact the number 0983022"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "Introduction to the application:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "“The Garage application” (referred to as “the application”) is an electronic application for booking transportation trips (Pullman) in the Syrian Arab Republic. The application works on mobile phone devices and the company is working on developing it and adding services to ensure continuity and reliance on it. Customer application: It is used by a segment From the community that needs a way to book a ticket to board a transportation flight (Pullman). Employee application: It is used by employees of transportation companies contracted with them and who are allowed to provide services through the application."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "The party responsible for the application:"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "“Story Link Limited Liability Company is registered in the commercial registry in Damascus under No.: 20251 dated 8 in the Syrian Arab Republic.”"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "Target groups:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "“Passengers: They are the people who apply for a ticket to board the Pullman bus.\n Companies: They are the companies that we contract with and who provide ride services through the application.”"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "Application job description:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "It is an application for the user to book a bus ticket (Pullman) in Syria at any time and how to use the application. You must review the following details: Account: When opening the application for the first time, the customer is asked to enter the phone number to receive his five-digit activation code to open the application and when To verify the validity of the code, one is asked to enter the name, surname, national number, birth number, and attach a copy of the ID and university card, if any."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "Application working:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "Pullman Transport: It is allowed to move between areas of the Syrian governorate, where the start and end point of the trip must be specified, either for a specific destination or choose the trip with an open destination and choose to show the details of the expected trip, including duration and cost, where all the values ​​shown are approximate values ​​that can change at the end of the trip depending on the distance. The actual mileage and actual trip time calculated by the employee’s application, and when the trip is requested and the ticket is booked, he will receive a notification with the trip information and ticket. \n Payment and collection mechanism: \n The customer can pay the driver the full amount of the trip directly (cash) only when booking a garage, and if a passenger wants to pay \n A user application can pay electronically via the service and company (Syriatel Cash, iCash, Cash Mobile(\n Cancellation: The customer has the right to cancel the trip request within the period specified by the company (5 minutes). In the event of canceling the trip after the expiry of the specified period, the customer will have to pay a fine whose value is determined by the company. "
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "Other features:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "• - Speed: The application provides the trip that will start soon. \n • - Safety: By dealing with the best transportation companies in Syria. \n • - Advanced technologies: The best modern software technologies have been used to facilitate the use process."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "Additional services:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "• -The customer inquires about all the tickets he has made and shows all the details.\n• -The possibility of submitting suggestions to the company and communicating with it."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "Access permissions:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "The application can access the files to choose a photo of you and save a ticket on your device.\nThe permission to read the SMS activation code\nThe phone's permission to be able to contact technical support."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "Complaints:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "“The possibility of filing a complaint immediately after paying the trip amount, or at a later time, where you can choose the trip you would like to file a complaint about. You can communicate directly through the company’s contact information.”"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "Suggestions:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "You can submit comments, suggestions, and complaints about the application, and the company will respond as soon as possible. If you are not satisfied with the response or believe that the processing of your information does not comply with the law regulating communication on the network and combating information crime, you can contact us by calling 0983022226 or via Email: sy.storylink@info"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "The user's rights and responsibilities and mechanisms for protecting and privacy of his information:"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "• - The customer has the right to cancel the order within the period specified by the company. \n • - The customer must pay the full cost of the trip, and in the event of non-payment, the employee informs the company through the application (no payment has been made). \n • - The company has the right to block user accounts Those who misuse the service.\n - The company may retain certain user data after receiving a request to delete the account, and data related to compliance with legal requirements, if necessary."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "“Rights and duties of the party responsible for the application:”"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "“The company retains the user’s profile data, his transactions, usage data, and other personal data as long as the user maintains his account with the company. The retention period for this information is determined depending on the factors of potential conflicts, and the guidelines issued by the National Authority for Information Technology Services and other government bodies. The information we collect about you will be transferred and stored.” On our servers located inside the Syrian Arab Republic, we are very careful and transparent about what your information is shared with, and your information may be disclosed or transferred if you enter into a joint venture with another business entity, or are purchased or sold to another business entity."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "Marketing:".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "“Includes marketing about the company’s services, features, promotions, existing studies, opinion polls, news, updates and events on users’ social media.”"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "“The measures that the entity will take if the user violates the usage policy:”"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "We may use the personal data (phone number) that we collect to investigate and resolve claims or disputes related to the use of the Company’s services, or as permitted by law, or at the request of regulators, government agencies, and official inquiries.\n The Company may share the foregoing User Personal Data if we believe it is required by law, valid legal process or governmental requests, or where disclosure of such data is appropriate due to safety or similar concerns. This includes sharing personal data with law enforcement officials, to protect the company's rights or property, or the rights, safety or property of others, or in the event of a claim or dispute related to the use of our services. \nThe Company may share a user's personal data other than as described in this document if the user informs us and agrees to share."
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    "Modify the usage policy".tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "“We may update this document from time to time and notify you of its change via social media sites and customer service. Using our services after updating it constitutes acceptance of the updated notice.”"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                  // SizedBox(height: 5),
                                  // Text(
                                  //   ' It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English',
                                  //   style: TextStyle(color: Colors.black54),
                                  // ),
                                  // SizedBox(height: 15),
                                  // Text(
                                  //   'Where does it come from?',
                                  //   style:
                                  //       TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                                  // ),
                                  // SizedBox(height: 5),
                                  // Text(
                                  //   'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words ',
                                  //   style: TextStyle(color: Colors.black54),
                                  // ),
                                  // SizedBox(height: 15),
                                  // Text(
                                  //   'Where can I get some?',
                                  //   style:
                                  //       TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                                  // ),
                                  // SizedBox(height: 5),
                                  // Text(
                                  //   'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.  ',
                                  //   style: TextStyle(color: Colors.black54),
                                  // ),
                                ],
                              )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
