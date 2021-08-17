import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';
import 'package:memento_ui/src/data/user/avatar.dart';

class UserCardData {
  final Color color;
  final String name;
  final String role;

  UserCardData({
    required this.color,
    required this.name,
    required this.role,
  });
}

class MementoUserCard extends StatelessWidget with MementoColorThemeUserMixin {
  final UserCardData user;
  final GestureTapCallback? onTap;

  const MementoUserCard({
    Key? key,
    this.onTap,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FlatClickable(
        child: Padding(
          padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
          child: Row(
            children: [
              MementoAvatar(
                color: user.color,
                label: user.name[0],
              ),
              _text(context),
            ],
          ),
        ),
        onTap: onTap,
      );

  Expanded _text(BuildContext context) => Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Container(
            constraints: BoxConstraints(minHeight: 55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _name(context),
                Container(
                  height: 18,
                ),
                _role(context),
              ],
            ),
          ),
        ),
      );

  Text _role(BuildContext context) => Text(
        user.role,
        style: MementoText.small
            .copyWith(color: colorTheme(context).almostDimmedText, height: 0.5),
      );

  Text _name(BuildContext context) => Text(
        user.name,
        style: MementoText.lead.copyWith(color: colorTheme(context).text),
      );
}
