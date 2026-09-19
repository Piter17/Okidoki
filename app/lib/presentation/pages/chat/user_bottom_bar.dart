import 'package:api_bindings/api_bindings.dart';
import 'package:riv/domain/user/user_state.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/skeleton_text_generator.dart';

class UserBottomBar extends StatelessWidget {
  const UserBottomBar({
    super.key,
    required this.user,
  }) : isSkeleton = false;

  const new skeleton({super.key}) : isSkeleton = true, user = null;

  final UserProfileDto? user;
  final bool isSkeleton;

  @override
  Widget build(BuildContext context) {
    final image = user?.profilePicture;
    final username = user?.nickname ?? TextGen.nick();
    final UserState? userState = null;
    return Skeletonizer(
      enabled: isSkeleton,
      child: Surface(
        padding: context.values.containerPadding,
        // contextStyle: ContextColors.light,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: .max,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                borderRadius: context.values.border,
                child: Row(
                  children: [
                    UserAvatar(
                      image: image,
                      userState: null,
                    ),
                    Space(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: context.fonts.bodyStrong,
                        ),
                        Text(
                          userState?.toLocalizedString(S.of(context)!) ??
                              TextGen.sentence(1, 2),
                          style: context.fonts.caption1.withColor(
                            context.palette.text,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Skeleton.keep(
              child: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => SettingsPage.open(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
