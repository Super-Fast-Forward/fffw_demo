// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_framework/firebase_options.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:flutter_firebase_framework_test_app/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     WidgetsFlutterBinding.ensureInitialized();

//     // await Firebase.initializeApp(
//     //   options: DefaultFirebaseOptions.currentPlatform,
//     // );

//     // Build our app and trigger a frame.
//     await tester.pumpWidget(ProviderScope(child: MainApp()));

//     await tester.pump();
//     await tester.pumpAndSettle();
//     // Verify that our counter starts at 0.
//     expect(find.text('login'), findsOneWidget);
//     // expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     // await tester.tap(find.byIcon(Icons.add));
//     // await tester.pump();

//     // // Verify that our counter has incremented.
//     // expect(find.text('0'), findsNothing);
//     // expect(find.text('1'), findsOneWidget);
//   });
// }

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fffw_demo/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// late IntegrationTestWidgetsFlutterBinding binding;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // FlutterError.onError = (FlutterErrorDetails data) {
  //   print("FLUTTER ERROR ====>>>>>");
  //   if (data.exception is FlutterError) {
  //     final fErr = data.exception as FlutterError;
  //     if (fErr.message == '...') {
  //       // do not forward to presentError
  //       return;
  //     }
  //   }
  //   FlutterError.presentError(data);
  // };

  // final TestExceptionReporter oldTestExceptionReporter = reportTestException;
  // reportTestException = (FlutterErrorDetails details, String testDescription) {
  //   print("Test catch exception");
  // };

  var app = await Firebase.initializeApp(); //TODO Unused ?
  FirebaseFirestore.instance.settings = const Settings(
      host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);

  // FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
  // FirebaseAuth.instanceFor(app: app).useEmulator('http://localhost:9099');

  group('end-to-end test', () {
    testWidgets('Log In', loginTest, semanticsEnabled: false);
    //testWidgets('list', listTest, semanticsEnabled: false);
    //testWidgets('transactions', transactionTest, semanticsEnabled: false);
    // testWidgets('rules', rulesTest, semanticsEnabled: false);
    //testWidgets('members', membersTest, semanticsEnabled: false);
    //testWidgets('roles', rolesTest, semanticsEnabled: false);
    //testWidgets('Log-out', logoutTest, semanticsEnabled: false);
    // tearDown(() => {
    //       //print('tearDown started');
    //       //Firebase.app().delete()
    //     });
  });
}

Future<void> loginTest(WidgetTester tester) async {
  print('starting login test'); //TODO print in prod code ?
  log('starting login test');
  //app.main();
  await tester.pumpWidget(const ProviderScope(child: TheApp()));

  print('Firebase APP is: ${Firebase.app().name}'); //TODO print in prod code ?

  print('pumpAndSettle...'); //TODO print in prod code ?

  await tester.pumpAndSettle();

  print('check welcome back'); //TODO print in prod code ?
  expect(find.text('Welcome back'), findsOneWidget);

  print('enter email'); //TODO print in prod code ?
  await tester.enterText(
      find.byKey(const Key('email_field')), 'auto_admin@amlcloud.io');
  print('enter password'); //TODO print in prod code ?
  await tester.enterText(find.byKey(const Key('password_field')), 'qwer1234');
  await tester.tap(find.byKey(const Key('login_btn')));

  await tester.pumpAndSettle(const Duration(seconds: 1));

  log("User profile expect!");
  expect(find.byKey(const Key('edit_user_profile')), findsOneWidget);

  print('end of login test'); //TODO print in prod code ?
}
