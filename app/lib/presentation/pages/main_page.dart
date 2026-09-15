import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/users/current_user.dart';

@RoutePage()
class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              onPressed: () {},
              buttonType: ButtonType.primary,
              child: Text(context.s.main_placeholder),
            ),
            ...currentUser.isLoading
                ? [
                    CircularProgressIndicator(),
                  ]
                : [],
          ],
        ),
      ),
    );
  }
}
