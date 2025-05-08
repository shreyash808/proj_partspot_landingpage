//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:partyspot/utils/widgets/symbol_indicators.dart';
// import '../../../../utils/constants/string_consts.dart';
// import '../../../../utils/shimmers/hashtag_view_shimmer.dart';
// import '../../../../utils/widgets/snackbars.dart';
// import '../../../hashtags/presentation/widgets/hashtag_post.dart';
// import '../../../hashtags/presentation/widgets/hashtag_widgets.dart';
// import '../controller/hashtag_search_controller.dart';
//
// class HashtagSearchScreen extends StatefulWidget {
//   final String searchKey;
//
//   const HashtagSearchScreen({super.key, required this.searchKey});
//
//   @override
//   State<HashtagSearchScreen> createState() => _HashtagSearchScreenState();
// }
//
// class _HashtagSearchScreenState extends State<HashtagSearchScreen> {
//   late final ScrollController scrollController;
//   late final HashtagSearchController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     scrollController = ScrollController();
//     scrollController.addListener(scrollListener);
//     controller = Get.put(HashtagSearchController());
//     controller.searchHashtags(searchKey: widget.searchKey);
//   }
//
//   @override
//   void dispose() {
//     if (Get.isRegistered<HashtagSearchController>()) {
//       Get.delete<HashtagSearchController>();
//     }
//     scrollController.removeListener(scrollListener);
//     scrollController.dispose();
//     super.dispose();
//   }
//
//   void scrollListener() {
//     if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
//       controller.loadMoreHashtags(widget.searchKey);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetX<HashtagSearchController>(
//       builder: (controller) {
//         return controller.isBusy
//             ? const HashtagViewShimmer()
//             : controller.hashtags.isEmpty
//                 ? HashtagWidgets.noHashtagsView()
//                 : ListView.separated(
//                     controller: scrollController,
//                     physics: const BouncingScrollPhysics(),
//                     itemCount: controller.hashtags.length + 1,
//                     itemBuilder: (context, index) {
//                       if (index == controller.hashtags.length) {
//                         return controller.hasMoreData ? SymbolIndicators.loadMoreIndicator() : const SizedBox();
//                       }
//                       final data = controller.hashtags[index];
//                       return HashtagPost(
//                         hashtag: data,
//                         onDeleteFromEdit: () {
//                           controller.deleteHashtagFromEdit(index: index);
//                         },
//                         onReport: () {
//                           controller.deleteHashtagFromEdit(index: index);
//                         } ,
//                         onDelete: (hashtagId) {
//                           controller.deleteHashtag(
//                               hashtagId: hashtagId,
//                               index: index,
//                               onSuccess: () {
//                                 showSnackBar(context, text:StringConsts.noteDeleted, isError: false);
//                               });
//                         },
//                         onLikeHashtag: (hashtagId, onSuccess) {
//                           controller.likeHashtag(hashtagId: hashtagId, onSuccess: onSuccess);
//                         },
//                       );
//                     },
//                     separatorBuilder: (context, index) => Divider(
//                       color: Colors.black.withOpacity(0.1),
//                     ),
//                   );
//       },
//     );
//   }
// }
