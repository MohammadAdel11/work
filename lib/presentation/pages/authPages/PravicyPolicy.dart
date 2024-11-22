import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/leadingAppBar.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('سياسة الخصوصية'),leading: leadingAppBar(),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  'نعمل بصدق تام وندرك تماما اهميه الحفاط على سرية المعلومات',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 50.spMin),
                Text(
                  'المعلومات الشخصيه المسجله لدينا',
                  style:Theme.of(context).textTheme!.bodyLarge!.copyWith(color: Theme.of(context).focusColor),
                  textAlign: TextAlign.start,
                ),
                Text(
                  'بمجرد تحميلك للتطبيق، فإنك تسمح ل"حرفي" بالتواصل معك باستخدام رقم الهاتف وغيرها من البيانات الشخصية المماثلة.يسمح فقط للموظفين والأفراد المصرح لهم بالتعامل مع معاملاتك باستخدام البيانات التي سمحت لنا مسبقاً باستخدامها، وبتحميلك للتطبيق - فذلك يعني قبولك لتلك السياسةالرئيسية.',
                  textAlign: TextAlign.start,
                  style:Theme.of(context).textTheme!.bodyMedium,
                ),
                SizedBox(height: 10,),
                Text(
                  'حماية البيانات',
                  style:Theme.of(context).textTheme!.bodyLarge!.copyWith(color: Theme.of(context).focusColor),
                  textAlign: TextAlign.start,
                ),
                Text(
                  'تعتبر حماية البيانات من أولويتنا القصوى لذلك نتخذ جميع الخطوات الاحترازية لحماية بياناتك وخصوصيتك، حيث تتم حماية معلوماتك وفقا لأعلى مستوى ممكن من الأمان عبر الإنترنت، ونسعى دائماً إلى استخدام أفضل الطرق والأساليب لضمان أمان شامل وكامل لجميع التفاصيل والبيانات الحساسة الخاصة بك.',
                  style: Theme.of(context).textTheme!.bodyMedium,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10,),
                Text(
                  'حقوقك في التصرف بالبيانات والمعلومات المسجلة لدينا',
                  style: Theme.of(context).textTheme!.bodyLarge!.copyWith(color: Theme.of(context).focusColor),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'في أي وقت، يمكنك الانسحاب من الاشتراك بالتطبيق، بالإضافة إلى امكانية الحصول على معلومات حول أي مما يلي عن طريق ترك رسالة على الواتساب الخاص بالدعم الفني ماهية البيانات التي لدينا عنك ,تعديل أي بيانات لدينا عنك ,يمكنك ايضا حذف اي بيانات متعلقة لك عن طريق التطبيق.',
                  style: Theme.of(context).textTheme!.bodyMedium,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
