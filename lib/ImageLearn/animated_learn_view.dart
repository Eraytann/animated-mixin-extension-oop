import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  _changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }

  _changeState() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  bool isVisible = false;
  bool isOpacity = false;
  late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('data', style: context.textTheme().displayLarge
              // Without extension
              //Theme.of(context).textTheme.displayMedium,
              ),
          _placeholderWidget(),
          _animatedText(),
          _animatedDefaultTextStyle(context),
          _animatedIcon(),
          _animatedContainer(context),
          _animatedPositioned(),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _changeState();
        controller.animateTo(isVisible ? 2.0 : 0);
      }),
    );
  }

  Expanded _animatedPositioned() {
    return const Expanded(
      child: Stack(
        children: [
          AnimatedPositioned(
            left: 20,
            duration: _DurationItems.durationLow,
            curve: Curves.linear,
            child: Text('data'),
          )
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(BuildContext context) {
    return AnimatedContainer(
      duration: _DurationItems.durationLow,
      height: isVisible ? 0 : MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.2,
      color: Colors.blue,
    );
  }

  AnimatedIcon _animatedIcon() {
    return AnimatedIcon(
      icon: AnimatedIcons.home_menu,
      progress: controller,
    );
  }

  AnimatedDefaultTextStyle _animatedDefaultTextStyle(BuildContext context) {
    return AnimatedDefaultTextStyle(
      style: (isVisible
              ? context.textTheme().bodySmall
              : context.textTheme().headlineLarge) ??
          const TextStyle(),
      duration: _DurationItems.durationLow,
      child: const Text('data'),
    );
  }

  ListTile _animatedText() {
    return ListTile(
      title: AnimatedOpacity(
        opacity: isOpacity ? 1 : 0,
        duration: _DurationItems.durationLow,
        child: const Text('data'),
      ),
      trailing: IconButton(
        onPressed: () {
          _changeOpacity();
        },
        icon: const Icon(Icons.precision_manufacturing),
      ),
    );
  }

  AnimatedCrossFade _placeholderWidget() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      crossFadeState:
          isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _DurationItems.durationLow,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
