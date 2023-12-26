import 'package:flutter/material.dart';
import 'package:flutter_202/StateManagement/state_manage_learn_view.dart';

abstract class StateLearnViewModel extends State<StateManagementLearnView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }

  changeState() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  bool isVisible = false;
  bool isOpacity = false;
  late AnimationController controller;
}
