import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/services/connectivity_service.dart';
import 'package:partyspot/utils/widgets/no_internet_view.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ConnectivityService>(builder: (controller) {
      log(controller.isConnected.toString());
      return controller.isConnected
          ? buildContent(context)
          : Scaffold(
              floatingActionButton: floatingActionButton(context),
              body: noInternetView(context));
    });
  }

  Widget buildContent(BuildContext context);

  Widget? floatingActionButton(BuildContext context) {
    return null;
  }

  Widget? noInternetView(BuildContext context) {
    return NoInternetView(
      onRetry: () {},
    );
  }
}

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});

  @override
  BaseStatefulWidgetState createState() => BaseStatefulWidgetState();

  Widget buildContent(BuildContext context);

  Widget? floatingActionButton(BuildContext context){
    return null;
  }

  void initState(BuildContext context) {}

  void dispose(BuildContext context) {}
}

class BaseStatefulWidgetState extends State<BaseStatefulWidget> {
  @override
  void initState() {
    super.initState();
    widget.initState(context);
  }

  @override
  void dispose() {
    super.dispose();
    widget.dispose(context);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ConnectivityService>(builder: (controller) {
      log(controller.isConnected.toString());
      return controller.isConnected
          ? widget.buildContent(context)
          : Scaffold(
        floatingActionButton: widget.floatingActionButton(context),
        body: NoInternetView(
          onRetry: () {
            Get.find<ConnectivityService>().retryConnection();
          },
        ),
      );
    });
  }
}