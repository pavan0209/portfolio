import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({super.key});
}

abstract class BaseState<Page extends BasePage> extends State<Page> with AutomaticKeepAliveClientMixin<Page> {
  @override
  bool get wantKeepAlive => true;
}

mixin BasicPage<Page extends BasePage> on BaseState<Page> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        key: scaffoldKey,
        drawerEnableOpenDragGesture: false,
        drawerEdgeDragWidth: 0,
        endDrawerEnableOpenDragGesture: false,
        endDrawer: getEndDrawer(context),
        appBar: getAppBar(context),
        body: body(context),
        floatingActionButton: getFloatingActionButton(),
        bottomNavigationBar: bottomNavigationBar(context));
  }

  Widget body(BuildContext context);

  Widget bottomNavigationBar(BuildContext context) {
    return const SizedBox.shrink();
  }

  Widget? getFloatingActionButton() {
    return null;
  }

  PreferredSizeWidget getAppBar(BuildContext context) {
    return AppBar();
  }

  Widget? getEndDrawer(BuildContext context) {
    return const SizedBox.shrink();
  }
}
