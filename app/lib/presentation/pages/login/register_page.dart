import 'dart:ui';

import 'package:api_bindings/api_bindings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/mutations/mutations.dart';

class RegisterForm extends FormGroup {
  new()
    : super(
        {
          profileName: FormControl<String>(validators: [Validators.required]),
          password: FormControl<String>(
            validators: [
              Validators.required,
              Validators.minLength(6),
            ],
          ),
          email: FormControl<String>(
            validators: [Validators.required, Validators.email],
          ),
          // password2: FormControl<String>(
          //   validators: [
          //     Validators.required,
          //     Validators.minLength(6),
          //   ],
          // ),
        },
        // validators: [
        //   MustMatchValidator(
        //     password,
        //     password2,
        //     true,
        //   ),
        // ],
      );

  static const profileName = "profileName";
  static const email = "email";
  static const password = "password";
  // static const password2 = "password2";

  FullRegistrationRequest getModel() => FullRegistrationRequest(
    email: control(email).value as String,
    userName: control(profileName).value as String,
    password: control(password).value as String,
  );
}

@RoutePage()
class RegisterPage extends HookConsumerWidget {
  const RegisterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GhostLoginScreen();
    final formGroup = useMemoized(RegisterForm.new);
    final register = useMemoized(AuthMutations.getRegister);

    final registerState = ref.watch(register);
    Future send() => register.run(
      ref,
      AuthMutations.registerCb(formGroup.getModel()),
    );

    register.showPopupOnError(context, ref);

    // return Scaffold(
    //   body: BackgroundPage(
    //     isLoading: registerState is MutationPending,
    //     child: ReactiveForm(
    //       formGroup: formGroup,
    //       child: Column(
    //         spacing: context.values.spacing,
    //         children: [
    //           SvgPicture.asset(
    //             Assets.images.logo,
    //             width: 200,
    //           ),
    //           ReactiveTextField(
    //             formControlName: RegisterForm.profileName,
    //             decoration: InputDecoration(
    //               labelText: context.s.profile_display_name,
    //             ),
    //           ),
    //           ReactiveTextField(
    //             formControlName: RegisterForm.email,
    //             decoration: InputDecoration(labelText: context.s.generic_email),
    //           ),
    //           ReactiveTextField(
    //             formControlName: RegisterForm.password,
    //             obscureText: true,
    //             decoration: InputDecoration(
    //               labelText: context.s.generic_password,
    //             ),
    //           ),
    //           ReactiveTextField(
    //             formControlName: RegisterForm.password2,
    //             obscureText: true,
    //             decoration: InputDecoration(
    //               labelText: context.s.generic_password,
    //             ),
    //           ),
    //           ReactiveFormConsumer(
    //             child: Text(context.s.generic_register),
    //             builder: (_, formGroup, child) => Button(
    //               onPressed:
    //                   formGroup.valid && registerState is! MutationPending
    //                   ? send
    //                   : null,
    //               child: child!,
    //             ),
    //           ),
    //           Button(
    //             onPressed: () => context.router.replace(LoginRoute()),
    //             buttonType: ButtonType.text,
    //             child: Text(context.s.generic_login),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class GhostLoginScreen extends StatefulWidget {
  const GhostLoginScreen({super.key});

  @override
  State<GhostLoginScreen> createState() => _GhostLoginScreenState();
}

class _GhostLoginScreenState extends State<GhostLoginScreen>
    with SingleTickerProviderStateMixin {
  bool _isLogin = true;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
      _controller.forward(from: 0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1A1A1A), Color(0xFF0D0D0D)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  width: 320,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    border: Border.all(
                      color: const Color(0xFF222831),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00ADB5).withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.emoji_emotions_outlined,
                            size: 80,
                            color: Color(0xFF00ADB5),
                          ),
                          const SizedBox(height: 20),
                          if (_isLogin) ...[
                            _ghostField("E-mail"),
                            const SizedBox(height: 12),
                            _ghostField("Hasło", obscure: true),
                            const SizedBox(height: 24),
                            _ghostButton("Zaloguj się"),
                            TextButton(
                              onPressed: _toggleForm,
                              child: const Text(
                                "Nie masz konta? Zarejestruj się",
                                style: TextStyle(color: Color(0xFF00ADB5)),
                              ),
                            ),
                          ] else ...[
                            _ghostField("Nazwa wyświetlana"),
                            const SizedBox(height: 12),
                            _ghostField("E-mail"),
                            const SizedBox(height: 12),
                            _ghostField("Hasło", obscure: true),
                            const SizedBox(height: 24),
                            _ghostButton("Zarejestruj się"),
                            TextButton(
                              onPressed: _toggleForm,
                              child: const Text(
                                "Masz już konto? Zaloguj się",
                                style: TextStyle(color: Color(0xFF00ADB5)),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ghostField(String label, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF00ADB5)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF393E46)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF00ADB5), width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: const Color(0xFF121212),
      ),
    );
  }

  Widget _ghostButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00ADB5),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),
      onPressed: () {},
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

// class GhostLoginScreen extends StatefulWidget {
//   const GhostLoginScreen({super.key});

//   @override
//   State<GhostLoginScreen> createState() => _GhostLoginScreenState();
// }

// class _GhostLoginScreenState extends State<GhostLoginScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _floatAnimation;
//   late Animation<double> _blinkAnimation;
//   late Animation<double> _glowAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     )..repeat(reverse: true);

//     _floatAnimation = Tween<double>(
//       begin: 0,
//       end: 20,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//     _blinkAnimation = Tween<double>(
//       begin: 1,
//       end: 0.3,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//     _glowAnimation = Tween<double>(
//       begin: 0.3,
//       end: 1.0,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 250,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFFFF4F81), Color(0xFF9C27B0)],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Transform.translate(
//                   offset: Offset(0, -_floatAnimation.value),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                       child: Container(
//                         width: 320,
//                         padding: const EdgeInsets.all(24),
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.4),
//                           border: Border.all(
//                             color: const Color(0xFF00E0FF),
//                             width: 1,
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0xFF00E0FF)
//                                   .withOpacity(_glowAnimation.value),
//                               blurRadius: 20 + 10 * _glowAnimation.value,
//                               spreadRadius: 4 * _glowAnimation.value,
//                             ),
//                           ],
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Opacity(
//                               opacity: _blinkAnimation.value,
//                               child: ShaderMask(
//                                 shaderCallback: (bounds) => RadialGradient(
//                                   colors: [
//                                     const Color(0xFF00E0FF),
//                                     const Color(0xFFFF4F81)
//                                         .withOpacity(_glowAnimation.value),
//                                   ],
//                                   center: Alignment.center,
//                                   radius: 0.8,
//                                 ).createShader(bounds),
//                                 child: const Icon(
//                                   Icons.emoji_emotions_outlined,
//                                   size: 80,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             _ghostField("Nazwa wyświetlana"),
//                             const SizedBox(height: 12),
//                             _ghostField("E-mail"),
//                             const SizedBox(height: 12),
//                             _ghostField("Hasło", obscure: true),
//                             const SizedBox(height: 24),
//                             ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(0xFFFF4F81),
//                                 foregroundColor: Colors.white,
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 60,
//                                   vertical: 14,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 elevation: 6,
//                               ),
//                               onPressed: () {},
//                               child: const Text(
//                                 "Zaloguj się",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _ghostField(String label, {bool obscure = false}) {
//     return TextField(
//       obscureText: obscure,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Color(0xFF00E0FF)),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color(0xFF00E0FF)),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color(0xFFFF4F81), width: 2),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         filled: true,
//         fillColor: Colors.black.withOpacity(0.3),
//       ),
//     );
//   }
// }

// class GhostLoginScreen extends StatefulWidget {
//   const GhostLoginScreen({super.key});

//   @override
//   State<GhostLoginScreen> createState() => _GhostLoginScreenState();
// }

// class _GhostLoginScreenState extends State<GhostLoginScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _floatAnimation;
//   late Animation<double> _blinkAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     )..repeat(reverse: true);

//     _floatAnimation = Tween<double>(
//       begin: 0,
//       end: 20,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//     _blinkAnimation = Tween<double>(
//       begin: 1,
//       end: 0.3,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Gradient waves at bottom
//           // Align(
//           //   alignment: Alignment.bottomCenter,
//           //   child: Container(
//           //     height: 250,
//           //     decoration: const BoxDecoration(
//           //       gradient: LinearGradient(
//           //         colors: [Color(0xFFFF4F81), Color(0xFF9C27B0)],
//           //         begin: Alignment.topCenter,
//           //         end: Alignment.bottomCenter,
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           // Animated ghost panel
//           Center(
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Transform.translate(
//                   offset: Offset(0, -_floatAnimation.value),
//                   child: child,
//                 );
//               },
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                   child: Container(
//                     width: 320,
//                     padding: const EdgeInsets.all(24),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.4),
//                       border: Border.all(
//                         color: const Color(0xFF00E0FF),
//                         width: 1,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0xFF00E0FF).withOpacity(0.3),
//                           blurRadius: 12,
//                           spreadRadius: 2,
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Opacity(
//                           opacity: _blinkAnimation.value,
//                           child: const Icon(
//                             Icons.emoji_emotions_outlined,
//                             size: 80,
//                             color: Color(0xFF00E0FF),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         _ghostField("Nazwa wyświetlana"),
//                         const SizedBox(height: 12),
//                         _ghostField("E-mail"),
//                         const SizedBox(height: 12),
//                         _ghostField("Hasło", obscure: true),
//                         const SizedBox(height: 24),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFFFF4F81),
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 60,
//                               vertical: 14,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             elevation: 6,
//                           ),
//                           onPressed: () {},
//                           child: const Text(
//                             "Zaloguj się",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _ghostField(String label, {bool obscure = false}) {
//     return TextField(
//       obscureText: obscure,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Color(0xFF00E0FF)),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color(0xFF00E0FF)),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color(0xFFFF4F81), width: 2),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         filled: true,
//         fillColor: Colors.black.withOpacity(0.3),
//       ),
//     );
//   }
// }

// class GhostLoginScreen extends StatelessWidget {
//   const GhostLoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Gradient waves at bottom
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 250,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFFFF4F81), Color(0xFF9C27B0)],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//             ),
//           ),
//           // Centered glass panel
//           Center(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                 child: Container(
//                   width: 320,
//                   padding: const EdgeInsets.all(24),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.4),
//                     border: Border.all(
//                       color: const Color(0xFF00E0FF),
//                       width: 1,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0xFF00E0FF).withOpacity(0.3),
//                         blurRadius: 12,
//                         spreadRadius: 2,
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Icon(
//                         Icons.emoji_emotions_outlined,
//                         size: 80,
//                         color: Color(0xFF00E0FF),
//                       ),
//                       const SizedBox(height: 20),
//                       _ghostField("Nazwa wyświetlana"),
//                       const SizedBox(height: 12),
//                       _ghostField("E-mail"),
//                       const SizedBox(height: 12),
//                       _ghostField("Hasło", obscure: true),
//                       const SizedBox(height: 24),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFFFF4F81),
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 60,
//                             vertical: 14,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           elevation: 6,
//                         ),
//                         onPressed: () {},
//                         child: const Text(
//                           "Zaloguj się",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _ghostField(String label, {bool obscure = false}) {
//     return TextField(
//       obscureText: obscure,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Color(0xFF00E0FF)),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color(0xFF00E0FF)),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color(0xFFFF4F81), width: 2),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         filled: true,
//         fillColor: Colors.black.withOpacity(0.3),
//       ),
//     );
//   }
// }
