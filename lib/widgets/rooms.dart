import 'package:flutter/material.dart';
import 'package:facebook_demo/config/palette.dart';
import 'package:facebook_demo/models/models.dart';
import 'package:facebook_demo/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  const Rooms({Key key, this.onlineUsers}) : super(key: key);
  final List<User> onlineUsers;
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _CreateRoomButton());
              }

              final User user = onlineUsers[index - 1];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            }),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.red)))),
        onPressed: () => print('Create Room'),
        child: Row(
          children: [
            ShaderMask(
              shaderCallback: (rect) =>
                  Palette.createRoomGradient.createShader(rect),
              child: Icon(
                Icons.video_call,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              'Create\nRoom',
              style: TextStyle(color: Palette.facebookBlue),
            ),
          ],
        ));
  }
}
