import 'package:flutter/material.dart';
import 'package:keyboard_utils/keyboard_listener.dart' as utils;
import 'package:keyboard_utils/keyboard_utils.dart';

class BottomPadding extends StatefulWidget {
  const BottomPadding({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomPadding> createState() => _BottomPaddingState();
}

class _BottomPaddingState extends State<BottomPadding> {
  var height = 0.0;
  final _keyUtils = KeyboardUtils();
  late int subsID;
  @override
  void initState() {
    super.initState();
    subsID = _keyUtils.add(
      listener: utils.KeyboardListener(
        willHideKeyboard: () {
          setState(() {
            height = 0;
          });
        },
        willShowKeyboard: (keyboardHeight) {
          setState(() {
            height = keyboardHeight;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _keyUtils.unsubscribeListener(subscribingId: subsID);
    if (_keyUtils.canCallDispose()) {
      _keyUtils.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      duration: const Duration(milliseconds: 300),
    );
  }
}
