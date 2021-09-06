import 'package:flutter/material.dart';
import 'package:facebook_demo/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {Key key,
      this.icons,
      this.selectedIndex,
      this.onTap,
      this.isBottomIndicator = false})
      : super(key: key);
  final List<IconData> icons;
  final int selectedIndex;
  final Function onTap;
  final bool isBottomIndicator;
  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
            border: isBottomIndicator
                ? Border(
                    bottom: BorderSide(color: Palette.facebookBlue, width: 3.0))
                : Border(
                    top: BorderSide(color: Palette.facebookBlue, width: 3.0))),
        tabs: icons
            .asMap()
            .map((i, e) => MapEntry(
                  i,
                  Tab(
                    icon: Icon(
                      e,
                      color: i == selectedIndex
                          ? Palette.facebookBlue
                          : Colors.black45,
                      size: 30.0,
                    ),
                  ),
                ))
            .values
            .toList(),
        onTap: onTap);
  }
}
