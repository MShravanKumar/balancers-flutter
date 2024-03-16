// import 'package:balancers/custom/custom_divider.dart';
// import 'package:balancers/utils/colors_const.dart';
// import 'package:balancers/utils/textstyles_const.dart';
// import 'package:flutter/material.dart';

// class Profile extends StatelessWidget {
//   const Profile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Profile'),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           Card(
//               color: Colors.red,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               elevation: 10,
//               child: SizedBox(
//                 height: 280,
//                 width: 500,
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_scanner_rounded)),
//                         IconButton(onPressed: () {}, icon: Icon(Icons.pin_end_outlined))
//                       ],
//                     ),
//                     CircleAvatar(
//                       radius: 50,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text("mr.sankar"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text("63xxxxx441"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     InkWell(
//                         onTap: () {},
//                         child: Container(
//                             alignment: Alignment.center,
//                             color: Colors.blue,
//                             height: 40,
//                             width: 110,
//                             child: Text("Edit Proile")))
//                   ],
//                 ),
//               )),
//           SizedBox(
//             height: 50,
//           ),
//           Card(
//             color: Colors.green,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             elevation: 10,
//             child: SizedBox(
//               height: 150,
//               width: 300,
//               child: ListviewPage(),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Divider(
//             thickness: 2,
//             indent: 20,
//             endIndent: 20,
//             color: Colors.black,
//           ),
//           Spacer(),
//           Text("data"),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black), borderRadius: BorderRadius.all(Radius.circular(10))),
//             height: 200,
//             width: MediaQuery.of(context).size.width / 1.3,
//             child: ListviewPage(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final List<Widget>? actions;
//   const CustomAppBar({
//     Key? key,
//     required this.title,
//     this.actions,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: ColorsUtil.primaryblack),
//         onPressed: () => Navigator.of(context).pop(),
//       ),
//       title: Text(
//         title,
//         style: TextStylesUtil.normalText,
//       ),
//       centerTitle: true,
//       backgroundColor: ColorsUtil.primaryBgColor,
//       actions: actions ?? [],
//       elevation: 0,
//       bottom: PreferredSize(preferredSize: Size.fromHeight(0.1), child: MyCustomDivider()),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(80);
// }

// class _ListviewPageState extends State<ListviewPage> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) => const Divider(
//         indent: 50,
//         height: 10,
//         color: Colors.black38,
//       ),
//       itemCount: 4,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Card(
//                 // elevation: 5,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                 child: Container(
//                   height: 30,
//                   width: 30,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       image: DecorationImage(
//                           image: NetworkImage(
//                             'https://picsum.photos/500/500?random=$index',
//                           ),
//                           fit: BoxFit.fill)),
//                 ),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Text("title${index}"),
//               Expanded(
//                   child: SizedBox(
//                 width: 10,
//               )),
//               Text(
//                 " ${index + 1}",
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
//               ),
//               Icon(
//                 Icons.arrow_forward_ios_rounded,
//                 size: 12,
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
