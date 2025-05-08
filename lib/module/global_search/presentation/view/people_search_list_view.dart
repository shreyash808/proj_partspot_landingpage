//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:partyspot/utils/constants/image_consts.dart';
// import 'package:partyspot/utils/constants/string_consts.dart';
// import 'package:partyspot/utils/controllers/follow_unfollow_controller.dart';
// import 'package:partyspot/utils/widgets/no_data_view.dart';
// import 'package:partyspot/utils/shimmers/search_list_shimmer.dart';
//
// import '../controller/search_people_list_controller.dart';
// import '../widgets/search_people_list_item.dart';
//
// class PeopleSearchListView extends StatefulWidget {
//   final String searchKey;
//
//   const PeopleSearchListView({super.key, required this.searchKey});
//
//   @override
//   State<PeopleSearchListView> createState() => _PeopleSearchListViewState();
// }
//
// class _PeopleSearchListViewState extends State<PeopleSearchListView> {
//   final ScrollController scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(scrollListener);
//   }
//
//   @override
//   void dispose() {
//     scrollController.removeListener(scrollListener);
//     scrollController.dispose();
//     super.dispose();
//   }
//
//   void scrollListener() {
//     if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
//       searchPeopleListController.loadMore(widget.searchKey);
//     }
//   }
//
//   final SearchPeopleListController searchPeopleListController = SearchPeopleListController();
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<SearchPeopleListController>(
//       init: searchPeopleListController..search(searchKey: widget.searchKey),
//       builder: (controller) {
//         return Obx(() {
//           if (controller.isBusy) {
//             return _buildLoadingShimmer();
//           } else if (controller.peopleList.isEmpty) {
//             return NoDataView(
//               text: StringConsts.noUserToShow.tr,
//               imagePath: AppImages.icSearchFail,
//             );
//           }
//           return ListView.builder(
//             controller: scrollController,
//             itemCount: controller.peopleList.length + 1,
//             itemBuilder: (context, index) {
//               if (index == controller.peopleList.length) {
//                 return controller.hasMoreData
//                     ? Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Center(child: Text(StringConsts.searching.tr)),
//                       )
//                     : const SizedBox();
//               }
//               final person = controller.peopleList[index];
//               return GetBuilder<FollowUnfollowController>(
//                 init: FollowUnfollowController(followStatus: person?.followStatus),
//                 tag: 'follow_unfollow_${person?.id}',
//                 builder: (followUnfollowController) {
//                   return PeopleListItem(
//                     isLoading: followUnfollowController.isBusy,
//                     userId: person?.id,
//                     name: '${person?.username}',
//                     followers: person?.followersCount,
//                     imgUrl: person?.profilePic,
//                     followStatus: followUnfollowController.followStatus,
//                     storiesViewedStatus: person?.storiesViewedStatus,
//                     onButtonTap: () {
//                       followUnfollowController.toggleFollowUnfollow(
//                           userId: person?.id,
//                           onSuccess: (status) {
//                             controller.peopleList[index]?.followStatus = status;
//                           });
//                     },
//                     showButton: !(person?.blockedStatus ?? false),
//                   );
//                 },
//               );
//             },
//           );
//         });
//       },
//     );
//   }
//
//   Widget _buildLoadingShimmer() {
//     return ListView.builder(
//       itemCount: 6,
//       itemBuilder: (context, index) {
//         return const SearchListItemShimmer();
//       },
//     );
//   }
// }
