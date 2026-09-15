import 'package:flutter_svg/svg.dart';
import 'package:riv/presentation/presentation.dart';

class const BackgroundPage({
  super.key,
  required final Widget child,
  required final bool isLoading,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            Assets.images.background,
            alignment: AlignmentGeometry.center,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: StyledContainer(
            padding: context.values.containerPadding,
            constraints: BoxConstraints(
              minWidth: 200,
              maxWidth: 250,
              minHeight: 200,
              maxHeight: 400,
            ),
            contextStyle: ContextColors.dark,
            child: SingleChildScrollView(child: child),
          ),
        ),
        if (isLoading)
          AnimatedOpacity(
            duration: context.values.fadeInDuration,
            opacity: isLoading ? 1 : 0,
            child: Center(
              child: Container(
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                  color: context.colors.borderTranslucent,
                  borderRadius: context.values.borderL,
                ),
                child: Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
