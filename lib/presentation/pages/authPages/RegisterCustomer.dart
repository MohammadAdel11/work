// import 'package:flutter/material.dart';
// import 'package:herafi/data/models/customerModel.dart';
// import 'package:herafi/presentation/pages/portfolio_screen.dart';
// import '../../Widgets/CustomButton.dart';
//
// class RegisterCustomer extends StatefulWidget {
//   const RegisterCustomer({Key? key}) : super(key: key);
//
//   @override
//   State<RegisterCustomer> createState() => _RegisterCustomerState();
// }
//
// class _RegisterCustomerState extends State<RegisterCustomer> {
//   final _formKey = GlobalKey<FormState>();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _dobController = TextEditingController();
//
//
//   final CustomerModel _customerModel = CustomerModel(
//     id: '',
//     createdAt: DateTime.now(),
//     firstName: '',
//     lastName: '',
//     phoneNumber: '',
//     dateOfBirth: DateTime.now(),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('تسجيل حساب العميل'),
//           backgroundColor: Colors.blue,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               children: <Widget>[
//                 TextFormField(
//                   controller: _firstNameController,
//                   decoration: const InputDecoration(labelText: 'الاسم الأول'),
//                   validator: (value) =>
//                   value == null || value.isEmpty ? 'يرجى إدخال الاسم الأول' : null,
//                 ),
//                 TextFormField(
//                   controller: _lastNameController,
//                   decoration: const InputDecoration(labelText: 'الاسم الأخير'),
//                   validator: (value) =>
//                   value == null || value.isEmpty ? 'يرجى إدخال الاسم الأخير' : null,
//                 ),
//                 TextFormField(
//                   controller: _phoneController,
//                   decoration: const InputDecoration(labelText: 'رقم الهاتف'),
//                   keyboardType: TextInputType.phone,
//                   validator: (value) =>
//                   value == null || value.isEmpty ? 'يرجى إدخال رقم الهاتف' : null,
//                 ),
//                 TextFormField(
//                   controller: _dobController,
//                   decoration: const InputDecoration(labelText: 'تاريخ الميلاد'),
//                   readOnly: true,
//                   onTap: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime(2100),
//                     );
//                     if (pickedDate != null) {
//                       setState(() {
//                         _dobController.text = pickedDate.toLocal().toString().split(' ')[0];
//                       });
//                     }
//                   },
//                   validator: (value) =>
//                   value == null || value.isEmpty ? 'يرجى إدخال تاريخ الميلاد' : null,
//                 ),
//                 const SizedBox(height: 20),
//                 CustomButton(
//                   icon: Icons.check,
//                   label: 'تسجيل',
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       try {
//                         await _customerModel.insertCustomer(
//                           firstName: _firstNameController.text,
//                           lastName: _lastNameController.text,
//                           phoneNumber: _phoneController.text,
//                           dateOfBirth: DateTime.parse(_dobController.text),
//                         );
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('تم التسجيل بنجاح')),
//                         );
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (_) => PortfolioScreen()),
//                         );
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('خطأ أثناء التسجيل: $e')),
//                         );
//                       }
//                     }
//                   },
//                   color: Colors.blue,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _phoneController.dispose();
//     _dobController.dispose();
//     super.dispose();
//   }
// }
