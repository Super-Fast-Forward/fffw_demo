import 'package:auth/current_user_avatar.dart';
import 'package:auth/login_screen.dart';
import 'package:auth/user_avatar.dart';
import 'package:auth/user_chip.dart';
import 'package:common/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_test_app/providers_page.dart';
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
      title: 'Flutter Firebase Framework Demo',
      home: TheApp(),
    );
  }
}

final isLoggedIn = StateNotifierProvider<GenericStateNotifier<bool>, bool>(
    (ref) => GenericStateNotifier<bool>(false));

final isLoading = StateNotifierProvider<GenericStateNotifier<bool>, bool>(
    (ref) => GenericStateNotifier<bool>(false));

final tabs = ['Common', 'Auth', 'Providers', 'Widgets'];

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
          // appBar: AppBar(
          //   leading: Row(children: [tabs.map((tab)=>
          //     TextButton(
          //       child: Text(tab),
          //       onPressed: () => Navigator.pushNamed(context, tab.toLowerCase()),
          //     )
          //   )]),
          //   actions: [
          //     CurrentUserAvatar(),
          //     IconButton(
          //       icon: Icon(Icons.exit_to_app),
          //       onPressed: () => FirebaseAuth.instance.signOut(),
          //     )
          //   ],
          // ),
          body: DefaultTabController(
              initialIndex: 0,
              length: 3,
              child: Navigator(
                onGenerateRoute: (RouteSettings settings) {
                  // print('onGenerateRoute: ${settings}');
                  if (settings.name == '/' || settings.name == 'providers') {
                    return PageRouteBuilder(
                        pageBuilder: (_, __, ___) => ProvidersPage());
                  }
                  //  else if (settings.name == 'cases') {
                  //   return PageRouteBuilder(
                  //       pageBuilder: (_, __, ___) => CasesPage());
                  // } else if (settings.name == 'lists') {
                  //   return PageRouteBuilder(
                  //       pageBuilder: (_, __, ___) => ListsPage());
                  // }
                  else {
                    throw 'no page to show';
                  }
                },
              )));
      // Row(
      //   children: [
      //     Expanded(
      //         child: LoginScreen('login', 'test', {
      //       "loginGitHub": false,
      //       "loginGoogle": true,
      //       "loginEmail": false,
      //       "loginSSO": false,
      //       "loginAnonymous": true,
      //       "signupOption": false,
      //     })),
      //     ref.watch(authStateChangesSP).when(
      //         loading: () => Container(),
      //         error: (e, s) => ErrorWidget(e),
      //         data: (user) => user == null
      //             ? Text('Signed out')
      //             : Column(
      //                 children: [
      //                   Text('signed in as: ${user.uid}'),
      //                   Divider(),
      //                   Text('UserChip:'),
      //                   UserChip(user.displayName ?? "Unknown Dolphin",
      //                       user.photoURL ?? 'Some image'),
      //                   Divider(),
      //                   Text('UserAvatar:'),
      //                   UserAvatar(user.photoURL ?? 'Some image')
      //                 ],
      //               ))
      //   ],
      // )
    }
  }
}

final StreamProvider<User?> authStateChangesSP =
    StreamProvider<User?>((ref) => FirebaseAuth.instance.authStateChanges());
