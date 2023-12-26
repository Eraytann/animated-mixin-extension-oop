import 'package:flutter/material.dart';
import 'package:flutter_202/StateManagement/state_learn_view_model.dart';

class StateManagementLearnView extends StatefulWidget {
  const StateManagementLearnView({super.key});

  @override
  State<StateManagementLearnView> createState() =>
      _StateManagementLearnViewState();
}

class _StateManagementLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.black,
        foregroundColor: isVisible ? Colors.amber : Colors.green,
      ),
      body: Container(),
    );
  }
}
