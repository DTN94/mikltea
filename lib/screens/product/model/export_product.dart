// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../../constants/app/api_url.dart';
// import '../../../../widgets/error/nd_handling_errors.dart';
// import '../../../../widgets/title/title.dart';
// import '../model/product_list_model.dart';
// import '../provider/home_provider.dart';
//
// class BoxCates extends ConsumerWidget {
//   const BoxCates({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final list = ref.watch(productListProvide);
//
//     return RefreshIndicator(
//         onRefresh: () async {
//           return ref.refresh(productListProvider);
//         },
//         child: Column(
//           children: [
//           HomeTitle(title: 'Danh mục',action: () {},isAction: true,),
//           list.when(data: (List<ProductListModel>? data){
//             if(data != null){
//             return SizedBox(
//               height: 250,
//               child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150,childAspectRatio: 1.0),
//                   scrollDirection: Axis.horizontal,
//                   padding: const EdgeInsets.symmetric(vertical: 0),
//                   itemCount: data.length,
//                   itemBuilder: (BuildContext context, i) {
//                     return GestureDetector(
//                       onTap: (){
//                         context.pushNamed('servicesDetail',params: {"id": data[i].id.toString()},);
//                         },
//                       child: Container(
//                         height: 240,
//                         child: Column(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(80),
//                               child: SizedBox.fromSize(
//                                 child: (data[i].image != '') ? Image.network('${ApiUrl.baseUrl}/' + data[i].image.toString(),fit: BoxFit.cover,height: 80,width: 80,): Image.asset('assets/images/dm.png',fit: BoxFit.fitWidth,height: 80,width: 80,),),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text((data[i].info!.vi!.name).toString(),style:const TextStyle(overflow: TextOverflow.ellipsis,fontSize: 14,),maxLines: 1,),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             );
//           }else{
//             return Center(
//               child: Text('Không có nội dung!'),
//             );
//           }
//           },
//             error: (error, stackTrace){
//             return NdHandlingErrors(message: error.toString());
//             },
//             loading: () => const CircularProgressIndicator(),
//           ),
//           ],
//         ),
//     );
//   }
// }