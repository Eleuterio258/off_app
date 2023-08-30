// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:freela/cubit/category/category_state.dart';

// import '../cubit/category/category_cubit.dart';

// class CategoryComponentGet extends StatelessWidget {
//   const CategoryComponentGet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.fromLTRB(
//           16,
//           MediaQuery.of(context).size.height * 0.012,
//           MediaQuery.of(context).size.height * 0.012,
//           MediaQuery.of(context).size.height * 0.012,
//         ),
//         child: AspectRatio(
//           aspectRatio: 16 / 5,
//           child: Container(
//             margin: EdgeInsets.zero,
//             height: 150,
//             child: BlocBuilder<CategoryCubit, CategoryState>(
//               builder: (context, state) {
//                 if (state is CategoryLoadingState) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 if (state is CategoryLoadedState) {
//                   return categoryWidget(state.category);
//                 }
//                 return Container();
//               },
//             ),
//           ),
//         ));
//   }

//   Widget categoryWidget(state) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: state.length,
//       itemBuilder: (BuildContext context, int i) {
//         return Row(
//           children: [
//             InkWell(
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => SubcategoryPage(id: state[i].id),
//                 //   ),
//                 // );
//               },
//               child: Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(8.0),
//                     bottomRight: Radius.circular(8.0),
//                     topLeft: Radius.circular(8.0),
//                     topRight: Radius.circular(8.0),
//                   ),
//                 ),
//                 width: MediaQuery.of(context).size.width / 3.0,
//                 child: Column(
//                   children: [
//                     Expanded(
//                       flex: 7,
//                       child: SvgPicture.network(
//                         state[i].imgPath!,
                        
                     
//                       ),
//                     ),
//                     // const Divider(),
//                     Expanded(
//                       flex: 3,
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(8.0),
//                             bottomRight: Radius.circular(8.0),
//                           ),
//                         ),
//                         child: Center(
//                           child: Text(
//                             state[i].name!,
//                             style: GoogleFonts.openSans(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(width: 8.0),
//           ],
//         );
//       },
//     );
//   }
// }
