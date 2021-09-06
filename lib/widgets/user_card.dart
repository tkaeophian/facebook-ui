import 'package:flutter/material.dart';
import 'package:facebook_demo/models/models.dart';
import 'package:facebook_demo/widgets/widgets.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key key, this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          SizedBox(
            width: 6.0,
          ),
          Flexible(
            child: Text(
              user.name,
              style: TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
