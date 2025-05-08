// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:partyspot/module/global_search/presentation/controller/global_search_controller.dart';
// import 'package:partyspot/module/global_search/presentation/view/people_search_list_view.dart';
// import 'package:partyspot/module/global_search/presentation/view/post_search_screen.dart';
// import 'package:partyspot/utils/classes/value_controller.dart';
// import 'package:partyspot/utils/constants/color_consts.dart';
// import 'package:partyspot/utils/constants/icon_constants.dart';
// import 'package:partyspot/utils/constants/string_consts.dart';
// import 'package:partyspot/utils/widgets/app_tab_item.dart';
// import 'package:partyspot/utils/widgets/custom_app_bar.dart';
// import 'package:partyspot/utils/widgets/search_bar.dart';
//
// import 'hashtag_search_screen.dart';
//
// class GlobalSearchScreen extends StatefulWidget {
//   const GlobalSearchScreen({super.key});
//
//   @override
//   State<GlobalSearchScreen> createState() => _GlobalSearchScreenState();
// }
//
// class _GlobalSearchScreenState extends State<GlobalSearchScreen> with TickerProviderStateMixin {
//   late TabController _tabController;
//   final ValueController<int> _selectedTabIndex = ValueController<int>(0);
//   final GlobalSearchController _controller = Get.find<GlobalSearchController>();
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     _selectedTabIndex.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
//       child: Scaffold(
//         appBar: CustomAppBar(
//           title: StringConsts.search.tr,
//           hasArrow: true,
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: AppSearchBar(
//                 svgIcon: AppIcons.searchFilledIcon,
//                 onChanged: (val) {
//                   _controller.onChangedSearch(val);
//                 },
//               ),
//             ),
//             const SizedBox(height: 16),
//             Obx(() {
//               return Visibility(
//                   visible: _controller.searchKey.isNotEmpty,
//                   child: TabBar(
//                       controller: _tabController,
//                       dividerColor: AppColor.transparent,
//                       indicatorColor: AppColor.transparent,
//                       padding: const EdgeInsets.all(0),
//                       tabAlignment: TabAlignment.center,
//                       tabs: [
//                         AppTabBarItem(
//                           title: StringConsts.people.tr,
//                           isSelected: _selectedTabIndex.value == 0,
//                           onTap: () {
//                             _selectedTabIndex.updateValue(0);
//                             _tabController.index = 0;
//                           },
//                         ),
//                         AppTabBarItem(
//                           title: StringConsts.hashtags.tr,
//                           isSelected: _selectedTabIndex.value == 1,
//                           onTap: () {
//                             _selectedTabIndex.updateValue(1);
//                             _tabController.index = 1;
//                           },
//                         ),
//                         AppTabBarItem(
//                             title: StringConsts.posts.tr,
//                             isSelected: _selectedTabIndex.value == 2,
//                             onTap: () {
//                               _selectedTabIndex.updateValue(2);
//                               _tabController.index = 2;
//                             })
//                       ]));
//             }),
//             GetBuilder<GlobalSearchController>(
//               builder: (context) {
//                 return _controller.searchKey.isNotEmpty
//                     ? Expanded(
//                         child: TabBarView(
//                         physics: const NeverScrollableScrollPhysics(),
//                         controller: _tabController,
//                         children: [
//                           PeopleSearchListView(searchKey: _controller.searchKey),
//                           HashtagSearchScreen(searchKey: _controller.searchKey),
//                           PostSearchScreen(searchKey: _controller.searchKey),
//                         ],
//                       ))
//                     : const SizedBox();
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
