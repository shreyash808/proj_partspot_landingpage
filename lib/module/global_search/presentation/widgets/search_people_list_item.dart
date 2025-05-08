// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:partyspot/module/view_story/controller/story_data_controller.dart';
// import 'package:partyspot/routes/routes_const.dart';
// import 'package:partyspot/utils/bottom_sheets/warning_bottom_sheet.dart';
// import 'package:partyspot/utils/classes/app_text_styles.dart';
// import 'package:partyspot/utils/classes/enums.dart';
// import 'package:partyspot/utils/constants/app_size.dart';
// import 'package:partyspot/utils/constants/color_consts.dart';
// import 'package:partyspot/utils/constants/string_consts.dart';
// import 'package:partyspot/utils/utility.dart';
// import 'package:partyspot/utils/widgets/buttons.dart';
// import 'package:partyspot/utils/widgets/user_image_widget.dart';
//
// class PeopleListItem extends StatelessWidget {
//   final String? imgUrl;
//   final String? userId;
//   final String? name;
//   final int? followers;
//   final int? followStatus;
//   final bool showButton;
//   final void Function()? onButtonTap;
//   final Widget? button;
//   final bool isDarkMode;
//   final EdgeInsets? padding;
//   final int? storiesViewedStatus;
//   final bool? isLoading;
//   final bool canNavigateOnProfile;
//
//   const PeopleListItem(
//       {super.key,
//       this.followers,
//       this.name,
//       required this.userId,
//       this.imgUrl,
//       this.followStatus,
//       this.showButton = true,
//       this.button,
//       this.padding,
//       required this.storiesViewedStatus,
//       this.isDarkMode = false,
//       this.isLoading,
//       this.canNavigateOnProfile = true,
//       this.onButtonTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Row(
//               children: [
//                 GetX<StoryDataController>(
//                   init: StoryDataController(
//                       userId: userId,
//                       viewStatus: storiesViewedStatus),
//                   tag: 'StoryDataController_$userId',
//                   builder: (ctrl){
//                     return UserImageWidget(
//                       userId: userId,
//                       imageUrl: imgUrl,
//                       height: 36.spW,
//                       width: 36.spW,
//                       isLoading: ctrl.isBusy,
//                       canNavigateToProfile: canNavigateOnProfile,
//                       storiesViewedStatus: ctrl.viewStatus,
//                       onTap:  (){
//                         if(canNavigateOnProfile) Utility.navigateToStoryScreen(storyData: [ctrl.storyList],userId: userId);
//                       },
//                     );
//                   },
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: canNavigateOnProfile ? () {
//                       Get.toNamed(Routes.profileScreen,
//                           arguments: {RoutesArgument.userId: userId}, preventDuplicates: false);
//                     }: null,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           name ?? '',
//                           style: AppTextStyles.get14SemiBoldTextStyle(color: isDarkMode ? AppColor.whiteColor : null),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Visibility(
//                           visible: (followers ?? 0) > 0,
//                           child: Text(
//                               '${Utility.formatFollowersNumber(followers)} ${followers == 1 ? StringConsts.follower.tr.toLowerCase() : StringConsts.followers.tr.toLowerCase()}',
//                               style: AppTextStyles.get10RegularTextStyle(color: AppColor.blackColor.withOpacity(0.3))),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           if (showButton)
//             button ??
//                 Flexible(
//                     child: isLoading == true ? Container(
//                       alignment: Alignment.center,
//                         width: AppSizes.width * 0.3,
//                         child:  CupertinoActivityIndicator(color: isDarkMode ? AppColor.whiteColor : null)) : followStatus == Utility.followStatusToCode(FollowStatus.following)
//                         ? AppOutlinedButton(
//                             StringConsts.unFollow.tr,
//                             height: 32,
//                             takeFullWidth: false,
//                             padding: EdgeInsets.symmetric(horizontal: 34.spW),
//                             onPressed: () {
//                               showWarningBottomSheet(
//                                   context: context,
//                                   title: StringConsts.areYouSureYouWantToUnfollowThisUser.tr,
//                                   onYes: () {
//                                     Get.back();
//                                     if (onButtonTap != null) onButtonTap!();
//                                   });
//                             },
//                             borderColor: isDarkMode ? AppColor.whiteColor : null,
//                             color: isDarkMode ? AppColor.transparent : null,
//                             textStyle: AppTextStyles.get14MediumTextStyle(
//                                 color: isDarkMode ? AppColor.whiteColor : AppColor.blackColor),
//                           )
//                         : followStatus == Utility.followStatusToCode(FollowStatus.friendRequestSent)
//                             ? AppOutlinedButton(
//                                 StringConsts.requested.tr,
//                                 height: 32,
//                                 takeFullWidth: false,
//                                 padding: EdgeInsets.symmetric(horizontal: 28.spW),
//                                 onPressed: onButtonTap,
//                                 borderColor: isDarkMode ? AppColor.whiteColor : null,
//                                 color: isDarkMode ? AppColor.transparent : null,
//                                 textStyle: AppTextStyles.get14RegularTextStyle(
//                                     color: isDarkMode ? AppColor.whiteColor : AppColor.primaryColor),
//                               )
//                             : followStatus == Utility.followStatusToCode(FollowStatus.notFollowing)
//                                 ? AppButton(
//                                     StringConsts.follow.tr,
//                                     height: 32,
//                                     takeFullWidth: false,
//                                     padding: EdgeInsets.symmetric(horizontal: 40.spW),
//                                     onPressed: onButtonTap,
//                                     backgroundColor: isDarkMode ? AppColor.whiteColor : null,
//                                     textStyle: AppTextStyles.get14RegularTextStyle(
//                                         color: isDarkMode ? AppColor.blackColor : null),
//                                   )
//                                 : const SizedBox.shrink())
//         ],
//       ),
//     );
//   }
// }
