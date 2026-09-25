import 'package:api_bindings/api_bindings.dart';
import 'package:flutter/material.dart' show Card;
import 'package:riv/domain/user/user_state.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/skeleton_text_generator.dart';

class UserBottomBar extends StatefulWidget {
  const UserBottomBar({
    super.key,
    required this.user,
  }) : isSkeleton = false;

  const new skeleton({super.key}) : isSkeleton = true, user = null;

  final UserProfileDto? user;
  final bool isSkeleton;

  @override
  State<UserBottomBar> createState() => _UserBottomBarState();
}

class _UserBottomBarState extends State<UserBottomBar> {
  late final String usernamePlaceholder;
  late final String statusPlaceholder;

  @override
  void initState() {
    super.initState();
    usernamePlaceholder = TextGen.nick();
    statusPlaceholder = TextGen.sentence(1, 2);
  }

  @override
  Widget build(BuildContext context) {
    final image = widget.user?.profilePicture;
    final username = widget.user?.nickname ?? usernamePlaceholder;
    final UserState? userState = null;
    return Skeletonizer(
      enabled: widget.isSkeleton,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: context.values.border,
          border: Border.all(
            color: context.appColors.bPopup.border,
          ),
          boxShadow: [
            BoxShadow(
              blurStyle: .outer,
              color: context.appColors.bPopup.border.withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
            BoxShadow(
              blurStyle: .outer,
              color: context.appColors.bPopup.background.withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(2, 0),
            ),
          ],
          // color: context.appColors.bPopup.border,
        ),
        // contextStyle: ContextColors.light,
        padding: context.values.containerPadding,
        child: Container(
          // height: 60,
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
                        userState: userState,
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
                                statusPlaceholder,
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
      ),
    );
  }
}
