import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:riv/presentation/presentation.dart';

typedef MutationCallback<TResult> = Future<TResult> Function(
  MutationTransaction,
);

extension MutationX<T> on Mutation<T> {
  void onError(WidgetRef ref, void Function(MutationError<T> error) onError) =>
      ref.listen(this, ((prev, next) {
        if (prev is! MutationError && next is MutationError<T>) {
          onError(next);
        }
      }));

  void showPopupOnError(BuildContext context, WidgetRef ref) =>
      ref.listen(this, ((prev, next) {
        if (prev is! MutationError && next is MutationError<T>) {
          ErrorDialog.showError(context: context, error: next.error);
        }
      }));
}
