import 'package:riv/presentation/presentation.dart';

class AttachmentTile extends StatelessWidget {
  const AttachmentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          Container(
            color: Color(0xff555555),
            margin: EdgeInsets.all(8),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: context.values.borderS,
                color: Color(0xff333333),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    size: 16,
                  ),
                  Icon(
                    Icons.edit,
                    size: 16,
                  ),
                  Icon(
                    Icons.delete,
                    size: 16,
                    color: Color(0xffff0000),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
