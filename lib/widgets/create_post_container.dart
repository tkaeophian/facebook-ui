import 'package:flutter/material.dart';
import 'package:facebook_demo/models/models.dart';
import 'package:facebook_demo/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({Key key, @required this.currentUser})
      : super(key: key);
  final User currentUser;
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
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'What\' on your mind?'),
                  ),
                )
              ],
            ),
            const Divider(height: 10.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      onPressed: () => print('Live'),
                      icon: const Icon(Icons.videocam, color: Colors.red),
                      label: Text('Live')),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  TextButton.icon(
                      onPressed: () => print('Photo'),
                      icon:
                          const Icon(Icons.photo_library, color: Colors.green),
                      label: Text('Photo')),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  TextButton.icon(
                      onPressed: () => print('Room'),
                      icon: const Icon(Icons.video_call,
                          color: Colors.purpleAccent),
                      label: Text('Room')),
                  const VerticalDivider(
                    width: 8.0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
