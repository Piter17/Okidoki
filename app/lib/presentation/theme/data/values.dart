import 'package:riv/presentation/presentation.dart';

class Values {
  factory Values(bool isPhone) => Values._internal(
    chatPadding: isPhone ? 16 : 16,
    spacing: 12,
    spacingS: 8,
  );

  Values._internal({
    required this.chatPadding,
    required this.spacing,
    required this.spacingS,
    double borderS = 4,
    double border = 8,
    double borderL = 16,
    double borderXL = 24,
    double paddingS = 4,
    double padding = 8,
    double paddingL = 16,
  }) : iconSizeL = 16,
       iconSizeXL = 24,
       topBarHeight = 50,
       border = .circular(border),
       borderS = .circular(borderS),
       borderL = .circular(borderL),
       borderXL = .circular(borderXL),
       roundBorder = RoundedRectangleBorder(borderRadius: .circular(border)),
       roundBorderL = RoundedRectangleBorder(borderRadius: .circular(borderL)),
       roundBorderXL = RoundedRectangleBorder(
         borderRadius: .circular(borderXL),
       ),

       rightPaneWidth = 200,
       containerPadding = .all(padding),
       containerPaddingL = .all(paddingL),
       chatListItemPadding = .symmetric(horizontal: chatPadding),
       chatMessageEntryPadding = _sameLRB(chatPadding),
       buttonPadding = .all(paddingL),
       iconPadding = .all(paddingS),
       textFieldPadding = .symmetric(horizontal: 6, vertical: 8),
       topBarPadding = .symmetric(horizontal: paddingL),
       entryPadding = .symmetric(horizontal: paddingL, vertical: paddingS),
       spacingPadding = .all(spacing / 2),
       spacingSPadding = .all(spacingS / 2),
       fadeInDuration = Duration(milliseconds: 200);

  final BorderRadius borderS;
  final BorderRadius border;
  final BorderRadius borderL;
  final BorderRadius borderXL;

  final RoundedRectangleBorder roundBorder;
  final RoundedRectangleBorder roundBorderL;
  final RoundedRectangleBorder roundBorderXL;

  final double rightPaneWidth;

  final double chatPadding;
  final EdgeInsets chatListItemPadding;
  final EdgeInsets chatMessageEntryPadding;
  final EdgeInsets containerPadding;
  final EdgeInsets containerPaddingL;
  final EdgeInsets textFieldPadding;
  final EdgeInsets buttonPadding;
  final EdgeInsets iconPadding;
  final EdgeInsets topBarPadding;
  final EdgeInsets entryPadding;

  final double topBarHeight;
  final double spacingS;
  final double spacing;

  final EdgeInsets spacingSPadding;
  final EdgeInsets spacingPadding;

  final double iconSizeXL;
  final double iconSizeL;

  static EdgeInsets _sameLRB(double x) => .fromLTRB(x, 0, x, x);

  final Duration fadeInDuration;
}
