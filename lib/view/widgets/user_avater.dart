import 'package:flutter/cupertino.dart';

import '../../model/user.dart';

class UserAvater extends StatelessWidget {
  final User user;
  final double radius;
  const UserAvater({
    Key? key,
    required this.user,
    this.radius = 28,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        height: 2 * radius,
        child: Image.network(user.image),
      ),
    );
  }
}