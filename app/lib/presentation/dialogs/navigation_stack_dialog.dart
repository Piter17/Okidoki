// import 'package:riv/presentation/presentation.dart';
// import 'package:riv/providers/providers.dart';
// import 'package:riv/utils/utils.dart';

// class NavigationStackDialog extends HookConsumerWidget {
//   const NavigationStackDialog({
//     super.key,
//   });

//   static Future<void> open(
//     BuildContext context,
//     WidgetRef ref,
//   ) {
//     return showResponsivePopup(
//       context: context,
//       builder: (context) => NavigationStackDialog(),
//       dialogConstraints: BoxConstraints(maxWidth: 560),
//     );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final stack = ref.watch(chatNavigationProvider);
//     final len = stack.history.length;
//     final items = stack.history;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         DialogHeader(text: "Navigation stack"),
//         ListView.builder(
//           itemCount: len,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             final item = items.elementAt(index);
//             final guild = ref.watch(guildProvider(item.guildId!));
//             return guild.map(
//               data: (data) {
//                 final guild = data.value;
//                 final channel = guild.channels
//                     ?.where((x) => x.id == item.channelId)
//                     .firstOrNull;
//                 return NavigationStackEntry(
//                   name: [guild.name, channel?.name].join(" - "),
//                   image: guild.image,
//                   isSelected: item == stack.current,
//                   onTap: () {
//                     ref.read(chatNavigationProvider.notifier).setIndex(index);
//                     Navigator.pop(context);
//                   },
//                 );
//               },
//               error: (e) => Text(e.toString()),
//               loading: (l) => NavigationStackEntry.skeleton(),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// class NavigationStackEntry extends StatelessWidget {
//   final String? name;
//   final void Function()? onTap;
//   final String? image;
//   final bool isSkeleton;
//   final bool isSelected;

//   const NavigationStackEntry({
//     super.key,
//     required this.name,
//     required this.onTap,
//     required this.isSelected,
//     this.image,
//   }) : isSkeleton = false;

//   const NavigationStackEntry.skeleton({
//     super.key,
//   }) : isSkeleton = true,
//        name = null,
//        image = null,
//        onTap = null,
//        isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     final name = this.name ?? TextGen.sentence(1, 3);
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         color: context.palette.getHover(isSelected),
//         padding: context.values.spacingSPadding,
//         child: Row(
//           children: [
//             SizedBox(
//               width: 24,
//               height: 24,
//               child: CircleAvatar(
//                 backgroundImage: image.mapOr(
//                   NetworkImage.new,
//                 ),
//               ),
//             ),
//             Space(),
//             Text(name),
//           ],
//         ),
//       ),
//     );
//   }
// }
