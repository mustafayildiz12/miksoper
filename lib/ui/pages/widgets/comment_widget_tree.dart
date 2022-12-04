import 'package:comment_tree/comment_tree.dart';
import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CommentRow extends StatelessWidget {
  const CommentRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyColors colors = MyColors();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: CommentTreeWidget<Comment, Comment>(
        Comment(
            avatar: 'null',
            userName: 'Mustafa',
            content: 'felangel made felangel/cubit_and_beyond public '),
        [
          Comment(
              avatar: 'null',
              userName: 'null',
              content: 'A Dart template generator which helps teams'),
          Comment(
              avatar: 'null',
              userName: 'null',
              content:
                  'A Dart template generator which helps teams generator which helps teams generator which helps teams'),
          Comment(
              avatar: 'null',
              userName: 'null',
              content: 'A Dart template generator which helps teams'),
          Comment(
              avatar: 'null',
              userName: 'null',
              content: 'A Dart template generator which helps teams'),
          Comment(
              avatar: 'null',
              userName: 'null',
              content: 'A Dart template generator which helps teams'),
          Comment(
              avatar: 'null',
              userName: 'null',
              content: 'A Dart template generator which helps teams'),
          Comment(
              avatar: 'null',
              userName: 'null',
              content: 'A Dart template generator which helps teams'),
          Comment(
              avatar: 'null',
              userName: 'null',
              content:
                  'A Dart template generator which helps teams generator which helps teams '),
        ],
        treeThemeData:
            TreeThemeData(lineColor: colors.colorAccentDark, lineWidth: 1),
        avatarRoot: (context, data) => PreferredSize(
          preferredSize: Size.fromRadius(4.w),
          child: const CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/images/image_2.jpg'),
          ),
        ),
        avatarChild: (context, data) => PreferredSize(
          preferredSize: Size.fromRadius(3.w),
          child: const CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/images/image_4.jpg'),
          ),
        ),
        contentChild: (context, data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    color: colors.grey_100,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'dangngocduc',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${data.content}',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          fontWeight: FontWeight.w300, color: Colors.black),
                    ),
                  ],
                ),
              ),
              /*
              DefaultTextStyle(
                style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 8,
                      ),
                      Text('Like'),
                      SizedBox(
                        width: 24,
                      ),
                      Text('Reply'),
                    ],
                  ),
                ),
              )
               */
            ],
          );
        },
        contentRoot: (context, data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    color: colors.grey_10,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'dangngocduc',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${data.content}',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w300, color: Colors.black),
                    ),
                  ],
                ),
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 8,
                      ),
                      Text('Like'),
                      SizedBox(
                        width: 24,
                      ),
                      Text('Reply'),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
