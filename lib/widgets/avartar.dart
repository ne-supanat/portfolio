import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/emoticons.dart';
import '../features/theme_bloc.dart';

import 'dart:math';

import '../theme/theme.dart';

class Avartar extends StatefulWidget {
  const Avartar({super.key});

  @override
  State<Avartar> createState() => _AvartarState();
}

class _AvartarState extends State<Avartar> {
  int _selectedEmoticonIndex = -1;

  @override
  void initState() {
    super.initState();
    randomNewEmoticon();
  }

  void randomNewEmoticon() {
    _selectedEmoticonIndex = Random().nextInt(emoticons.length);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          randomNewEmoticon();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: context.read<ThemeCubit>().isLightMode()
                ? primaryColor
                : Colors.blueGrey.shade100,
          ),
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          maxRadius: 62,
          backgroundColor: Color(0xffFAFCFF),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              emoticons.elementAt(_selectedEmoticonIndex),
              style: TextStyle(fontSize: 62, fontWeight: FontWeight.bold, color: primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
