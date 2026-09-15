// // import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:riv/domain/chat/reaction.dart';
// // part 'message.freezed.dart';
// // part 'message.g.dart';

// // @freezed
// // abstract class Message with _$Message {
// //   const factory Message({
// //     required int userId,
// //     required String text,
// //     required DateTime dateTime,
// //     List<Reaction>? reactions,
// //   }) = _Message;

// //   factory Message.fromJson(Map<String, Object?> json) =>
// //       _$MessageFromJson(json);
// // }

class Message {
  const Message({
    required this.userId,
    required this.text,
    required this.dateTime,
    // List<Reaction>? reactions,
  });
  //  reactions = reactions;

  final int userId;
  final String text;
  final DateTime dateTime;
  // final List<Reaction>? reactions;
}
