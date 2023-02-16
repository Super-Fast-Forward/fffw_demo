import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/current_user_avatar.dart';
import 'package:flutter_firebase_auth/user_chip.dart';
import 'package:flutter_firebase_auth_test_app/login_screen.dart';
import 'package:flutter_firebase_auth/user_avatar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'generic_state_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'AUTH TEST APP',
      home: TheApp(),
    );
  }
}

final isLoggedIn = StateNotifierProvider<GenericStateNotifier<bool>, bool>(
    (ref) => GenericStateNotifier<bool>(false));

final isLoading = StateNotifierProvider<GenericStateNotifier<bool>, bool>(
    (ref) => GenericStateNotifier<bool>(false));

class TheApp extends ConsumerStatefulWidget {
  const TheApp({Key? key}) : super(key: key);
  @override
  TheAppState createState() => TheAppState();
}

class TheAppState extends ConsumerState<TheApp> {
  //bool isLoading = false;
  @override
  void initState() {
    super.initState();
    ref.read(isLoading.notifier).value = true;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        ref.read(isLoggedIn.notifier).value = false;
        ref.read(isLoading.notifier).value = false;
      } else {
        ref.read(isLoggedIn.notifier).value = true;
        ref.read(isLoading.notifier).value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(isLoading)) {
      return Center(
        child: Container(
          alignment: Alignment(0.0, 0.0),
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            actions: [
              CurrentUserAvatar(),
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () => FirebaseAuth.instance.signOut(),
              )
            ],
          ),
          body: Row(
            children: [
              Expanded(
                  child: LoginScreen('login', 'test', {
                "loginGitHub": false,
                "loginGoogle": true,
                "loginEmail": false,
                "loginSSO": false,
                "loginAnonymous": true,
                "signupOption": false,
              })),
              ref.watch(authStateChangesSP).when(
                  loading: () => Container(),
                  error: (e, s) => ErrorWidget(e),
                  data: (user) => user == null
                      ? Text('Signed out')
                      : Column(
                          children: [
                            Text('signed in as: ${user.uid}'),
                            Divider(),
                            Text('UserChip:'),
                            UserChip(user.displayName ?? "Unknown Dolphin",
                                user.photoURL ?? 'Some image'),
                            Divider(),
                            Text('UserAvatar:'),
                            UserAvatar(user.photoURL ?? 'Some image')
                          ],
                        ))
            ],
          ));
    }
  }
}

final StreamProvider<User?> authStateChangesSP =
    StreamProvider<User?>((ref) => FirebaseAuth.instance.authStateChanges());
