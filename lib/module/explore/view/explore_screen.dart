import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partyspot/module/home/presentation/view/widgets/popular_events_list.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: false,
              title: Row(
                children: [
                  Text(
                    "Explore Events",
                    style: AppTextStyles.get20BoldTextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  CustomSvgPicture(
                    iconPath: AppIcons.notificationActiveIcon,
                    color: Colors.white,
                  ),
                ],
              ),
              flexibleSpace: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/png/appbar_bg.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(4, 8),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: AppColor.blackRaisinColor.withOpacity(0.6),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Stack(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  size: 20,
                                ),
                                onPressed: () {
                                  // _showFilterBottomSheet(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        suffixIcon: Icon(Icons.filter_list),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        body: SingleChildScrollView(child: PopularEventsList()),
      ),
    );
  }
}

class BottomCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 30); // Left side
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 30,
    ); // Curve
    path.lineTo(size.width, 0); // Top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
