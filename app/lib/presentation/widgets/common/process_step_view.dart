import 'package:cue/cue.dart';
import 'package:riv/presentation/presentation.dart';

typedef StepBuilder<T> = Widget Function(
  BuildContext context,
  StepController controller,
);

class StepController({required final Map<String, StepBuilder> steps})
    extends ValueNotifier<StepBuilder> {
  this : super(steps.values.first);

  void previousStep() {
    if (isFirstStep == false) {
      value = steps.values.elementAt(stepIndex - 1);
      notifyListeners();
    }
  }

  void nextStep() {
    if (isLastStep == false) {
      value = steps.values.elementAt(stepIndex + 1);
      notifyListeners();
    }
  }

  void goTo(String step) {
    if (!steps.containsKey(step)) {
      throw ArgumentError('Step "$step" does not exist.');
    } else {
      value = steps[step]!;
      notifyListeners();
    }
  }

  int get stepCount => steps.values.length;
  int get stepIndex => steps.values.toList().indexOf(value);
  bool get isLastStep => stepIndex == stepCount - 1;
  bool get isFirstStep => stepIndex == 0;
}

class const ProcessStepsView<R>({
  super.key,
  required final Map<String, StepBuilder> steps,
  final StepController? stepController,
}) extends StatefulWidget {
  @override
  State<ProcessStepsView> createState() => _ProcessStepsViewState();
}

class _ProcessStepsViewState extends State<ProcessStepsView>
    with TickerProviderStateMixin {
  late final _stepController =
      widget.stepController ?? StepController(steps: widget.steps)
        ..addListener(() {
          cueController.forward(from: 0);
        });
  late final cueController = CueController(
    vsync: this,
    motion: CueMotion.easeInOut(Duration(milliseconds: 600)),
  )..forward();

  @override
  void dispose() {
    cueController.dispose();
    _stepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<StepBuilder>(
      valueListenable: _stepController,
      builder: (context, step, _) => Cue(
        controller: cueController,
        acts: [
          .fadeIn(reverse: .none()),
          .slideY(from: 0.1, reverse: .none()),
        ],
        child: step(context, _stepController),
      ),
    );
  }
}
