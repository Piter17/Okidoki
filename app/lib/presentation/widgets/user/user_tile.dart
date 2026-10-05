import 'package:okidoki/domain/domain.dart';
import 'package:okidoki/presentation/presentation.dart';

class UserTile extends StatelessWidget {
  final UserProfile user;
  final bool isSkeleton;

  const new({
    super.key,
    required this.user,
  }) : isSkeleton = false;

  new skeleton({
    super.key,
  }) : isSkeleton = true,
       user = UserProfile.fake(key.hashCode);

  @override
  Widget build(BuildContext context) {
    return Surface(
      variant: .secondary,
      height: 48,
      child: Row(
        crossAxisAlignment: .center,

        children: [
          UserAvatar(image: user.profilePicture),
          Expanded(child: Text(user.nickname)),
        ],
      ),
    );
  }
}
