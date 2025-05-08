// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:partyspot/module/global_search/presentation/controller/post_search_controller.dart';
// import 'package:partyspot/utils/constants/app_size.dart';
// import '../../../../routes/routes_const.dart';
// import '../../../../utils/constants/app_enums.dart';
// import '../../../../utils/constants/image_consts.dart';
// import '../../../../utils/constants/string_consts.dart';
// import '../../../../utils/shimmers/post_block_shimmer.dart';
// import '../../../../utils/utility.dart';
// import '../../../../utils/widgets/custom_network_image.dart';
// import '../../../../utils/widgets/no_data_view.dart';
// import '../../../../utils/widgets/post_grid_view_widget.dart';
// import '../../../../utils/widgets/symbol_indicators.dart';
//
// class PostSearchScreen extends StatefulWidget {
//   final String searchKey;
//
//   const PostSearchScreen({super.key, required this.searchKey});
//
//   @override
//   State<PostSearchScreen> createState() => _PostSearchScreenState();
// }
//
// class _PostSearchScreenState extends State<PostSearchScreen> {
//   late final ScrollController scrollController;
//   late final PostSearchController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     scrollController = ScrollController();
//     scrollController.addListener(scrollListener);
//     controller = Get.put(PostSearchController());
//     controller.searchPosts(searchKey: widget.searchKey);
//   }
//
//   @override
//   void dispose() {
//     if (Get.isRegistered<PostSearchController>()) {
//       Get.delete<PostSearchController>();
//     }
//     scrollController.removeListener(scrollListener);
//     scrollController.dispose();
//     super.dispose();
//   }
//
//   void scrollListener() {
//     if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
//       controller.loadMorePosts(widget.searchKey);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetX<PostSearchController>(
//       builder: (controller) {
//         return Container(
//           padding: EdgeInsets.only(
//             left: 20.spW,
//             right: 20.spW,
//             top: 10.spH,
//           ),
//           child: controller.isBusy
//               ? const PostBlockShimmer()
//               : controller.posts.isEmpty
//                   ? const NoDataView(
//                       text: 'No any posts found',
//                       imagePath: AppImages.icNoMedia,
//                     )
//                   : PostGridViewWidget(
//                       itemCount: controller.posts.length + 1,
//                       controller: scrollController,
//                       padding: EdgeInsets.only(bottom: 10.spH),
//                       itemBuilder: (context, index) {
//                         if (index == controller.posts.length) {
//                           return controller.hasMoreData
//                               ? Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Center(child: Text(StringConsts.searching.tr)),
//                                 )
//                               : const SizedBox();
//                         }
//                         final data = controller.posts[index];
//                         return GestureDetector(
//                           onTap: () async {
//                             final response = await Get.toNamed(Routes.postWidgetScreen, arguments: {
//                               RoutesArgument.screenFromArg: ScreenFrom.search,
//                               RoutesArgument.postsList: controller.posts,
//                               RoutesArgument.currentPage: controller.currentPage,
//                               RoutesArgument.pageLimit: controller.pageLimit,
//                               RoutesArgument.totalPostCount: controller.totalPostCount,
//                               RoutesArgument.currentPostIndex: index,
//                               RoutesArgument.searchKey: widget.searchKey,
//                             });
//                             if (response != null && response.toString().isNotEmpty) {
//                               controller.removePost(response.toString());
//                             }
//                           },
//                           child: Stack(
//                             fit: StackFit.expand,
//                             children: [
//                               CustomNetworkImage(
//                                 imageUrl: Utility.isVideo(data.firstMedia?.url)
//                                     ? data.firstMedia?.thumbnailUrl
//                                     : data.firstMedia?.url,
//                                 boxFit: BoxFit.cover,
//                               ),
//                               if (data.isRepost) SymbolIndicators.repostIndicator(),
//                               if (Utility.isVideo(data.firstMedia?.url)) SymbolIndicators.videoIndicator(),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//         );
//       },
//     );
//   }
// }
