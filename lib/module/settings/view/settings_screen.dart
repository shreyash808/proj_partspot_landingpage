import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/image_consts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: [Image.asset(AppImages.appBarImg, fit: BoxFit.cover)],
            ),
          ),
        ),
      ),
    );
  }
}
