import 'package:darq/darq.dart';

import 'package:flutter_svg/svg.dart';
import 'package:riv/domain/user/user_state.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/utils.dart';

class UserAvatar extends StatefulWidget {
  const UserAvatar({
    super.key,
    required this.image,
    this.userState,
    this._radius,
  });

  final String? image;
  final UserState? userState;
  final double? _radius;

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

// class ImagePicker extends StatefulWidget {
//   const new({
//     super.key,
//     this.initialImage,
//     this._radius,
//     this.onChanged,
//     this.value,
//   });

//   final FileContent? value;
//   final String? initialImage;
//   final double? _radius;
//   final void Function(FileContent? img)? onChanged;

//   @override
//   State<ImagePicker> createState() => _ImagePickerState();
// }

class _UserAvatarState extends State<UserAvatar> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final maxRadius = widget._radius ?? 40;
    final borderRadius = BorderRadiusGeometry.circular(50);

    return Align(
      child: LayoutBuilder.constraints(
        builder: (context, constraints) {
          final radius = [
            constraints.maxHeight,
            constraints.maxWidth,
            maxRadius,
          ].min();
          final br = borderRadius * 100 / radius;
          return widget.image != null
              ? Container(
                  width: radius,
                  height: radius,
                  alignment: .center,
                  foregroundDecoration: widget.image == null
                      ? null
                      : BoxDecoration(
                          borderRadius: br,
                          image: DecorationImage(
                            image: NetworkImage(widget.image!),
                            fit: .cover,
                          ),
                          color: Color(0x30000000),
                        ),
                )
              : Container(
                  width: radius,
                  height: radius,
                  alignment: .center,
                  child: SvgPicture.asset(Assets.images.logo),
                );
        },
      ),
    );
  }
}
// child: InkWell(
//   onTap: () {},
//   onHover: (v) => setState(() => isHovered = v),
//   child: isHovered
//       ? Container(
//           decoration: BoxDecoration(
//             borderRadius: br,
//             color: Color(0x30000000),
//           ),
//           child: Align(
//             child: Container(
//               padding: .all(4),
//               child: IconButton(
//                 icon: Icon(
//                   Icons.plus_one,
//                 ),
//                 highlightColor: Color(0x60000000),

//                 iconSize: 24,
//                 color: Color(0xffffffff),
//                 onPressed: () {},
//               ),
//             ),
//           ),
//         )
//       : null,
// ),

// class _UserAvatarState extends State<UserAvatar> {
//   final GlobalKey _imageKey = GlobalKey();
//   Size? _imageSize;

//   final badgeOrigin = Offset(.83, .83);
//   final badgeRadius = .35;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final renderBox =
//           _imageKey.currentContext?.findRenderObject() as RenderBox?;
//       setState(() {
//         _imageSize = renderBox?.size;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final img = CircleAvatar(
//       backgroundImage: SvgPicture.asset(Assets.images.logo),
//       foregroundImage: widget.image.mapOr(NetworkImage.new),
//     );
//     return widget.userState == null
//         ? img
//         : Stack(
//             children: [
//               ClipPath(
//                 key: _imageKey,
//                 clipper: TriangleClipper(
//                   origin: badgeOrigin,
//                   radius: badgeRadius,
//                 ),
//                 child: img,
//               ),
//               if (_imageSize != null)
//                 Positioned.fromRect(
//                   rect: Rect.fromCenter(
//                     center: badgeOrigin.scale(
//                       _imageSize!.width,
//                       _imageSize!.height,
//                     ),
//                     width: _imageSize!.width * badgeRadius * .7,
//                     height: _imageSize!.height * badgeRadius * .7,
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: context.colors.info.color,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: context.colors.dark.color,
//                           blurRadius: 4,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           );
//   }
// }

class TriangleClipper extends CustomClipper<Path> {
  TriangleClipper({
    super.reclip,
    required this.origin,
    required this.radius,
  });

  final Offset origin;
  final double radius;

  @override
  Path getClip(Size size) {
    final full = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final path = Path()
      ..addOval(
        Rect.fromCenter(
          center: origin.scale(size.width, size.height),
          width: size.width * radius,
          height: size.height * radius,
        ),
      )
      ..close();
    return Path.combine(PathOperation.difference, full, path);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
