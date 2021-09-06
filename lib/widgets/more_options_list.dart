import 'package:flutter/material.dart';
import 'package:facebook_demo/config/palette.dart';
import 'package:facebook_demo/models/models.dart';
import 'package:facebook_demo/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  const MoreOptionsList({Key key, this.currentUser}) : super(key: key);
  final User currentUser;
  final List<OptionMenuItem> _moreOptionsList = const [
    OptionMenuItem(
        color: Colors.deepPurple,
        icon: MdiIcons.shieldAccount,
        title: 'COVID-19 Info Center'),
    OptionMenuItem(
        color: Colors.cyan, icon: MdiIcons.accountMultiple, title: 'Friends'),
    OptionMenuItem(
        color: Palette.facebookBlue,
        icon: MdiIcons.facebookMessenger,
        title: 'Messenger'),
    OptionMenuItem(color: Colors.orange, icon: MdiIcons.flag, title: 'Pages'),
    OptionMenuItem(
        color: Palette.facebookBlue,
        icon: MdiIcons.storefront,
        title: 'Marketplace'),
    OptionMenuItem(
        color: Palette.facebookBlue,
        icon: Icons.ondemand_video,
        title: 'Watch'),
    OptionMenuItem(
        color: Colors.red, icon: MdiIcons.calendarStar, title: 'Events')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 280.0),
        child: ListView.builder(
            itemCount: 1 + _moreOptionsList.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: UserCard(user: currentUser));
              }

              final OptionMenuItem option = _moreOptionsList[index - 1];
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _Option(option: option));
            }));
  }
}

class _Option extends StatelessWidget {
  const _Option({Key key, this.option}) : super(key: key);
  final OptionMenuItem option;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => print(option.title),
        child: Row(
          children: [
            Icon(
              option.icon,
              size: 38.0,
              color: option.color,
            ),
            const SizedBox(width: 6.0),
            Flexible(
                child: Text(
              option.title,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ));
  }
}

class OptionMenuItem {
  final IconData icon;
  final Color color;
  final String title;

  const OptionMenuItem(
      {@required this.color, @required this.icon, @required this.title});
}
