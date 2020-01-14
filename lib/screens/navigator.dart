// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rikka/screens/library/library_main.dart';
import 'package:rikka/screens/updates/updates_main.dart';
import 'package:rikka/screens/settings/settings_main.dart';

const List<Color> coolColors = <Color>[
  Color.fromARGB(255, 255, 59, 48),
  Color.fromARGB(255, 255, 149, 0),
  Color.fromARGB(255, 255, 204, 0),
  Color.fromARGB(255, 76, 217, 100),
  Color.fromARGB(255, 90, 200, 250),
  Color.fromARGB(255, 0, 122, 255),
  Color.fromARGB(255, 88, 86, 214),
  Color.fromARGB(255, 255, 45, 85),
];

const List<String> coolColorNames = <String>[
  'Sarcoline', 'Coquelicot', 'Smaragdine', 'Mikado', 'Glaucous', 'Wenge',
  'Fulvous', 'Xanadu', 'Falu', 'Eburnean', 'Amaranth', 'Australien',
  'Banan', 'Falu', 'Gingerline', 'Incarnadine', 'Labrador', 'Nattier',
  'Pervenche', 'Sinoper', 'Verditer', 'Watchet', 'Zaffre',
];

const int _kChildCount = 50;

class RikkaNavigator extends StatelessWidget {
  RikkaNavigator()
      : colorItems = List<Color>.generate(_kChildCount, (int index) {
          return coolColors[math.Random().nextInt(coolColors.length)];
        }) ,
        colorNameItems = List<String>.generate(_kChildCount, (int index) {
          return coolColorNames[math.Random().nextInt(coolColorNames.length)];
        });

  static const String routeName = '/cupertino/navigation';

  final List<Color> colorItems;
  final List<String> colorNameItems;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Prevent swipe popping of this page. Use explicit exit buttons only.
      onWillPop: () => Future<bool>.value(true),
      child: DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle,
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.conversation_bubble),
                title: Text('Support'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled),
                title: Text('Profile'),
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            assert(index >= 0 && index <= 2);
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return LibraryTab(
                      colorItems: colorItems,
                      colorNameItems: colorNameItems,
                    );
                  },
                  defaultTitle: 'Colors',
                );
                break;
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) => CupertinoDemoTab2(),
                  defaultTitle: 'Support Chat',
                );
                break;
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) => CupertinoDemoTab3(),
                  defaultTitle: 'Account',
                );
                break;
            }
            return null;
          },
        ),
      ),
    );
  }
}