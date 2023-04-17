import 'package:auth/main.dart';
import 'package:auth/providers.dart';
import 'package:fffw_demo/core/_core_exports.dart';
import 'package:theme/theme_mode.dart';
import 'package:widgets/routing.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ThemeModeConfig.enableSave = true;
  ThemeModeConfig.defaultToLightTheme = true;
  AuthConfig.enableGoogleAuth = true;

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
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
        title: 'Flutter Firebase Framework',
        themeMode: ref.watch(themeModeSNP) ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        initialRoute: '/',
        onGenerateRoute: generateRoutes({
          '/': (context, settings) => AboutPage(),
          '/about': (context, settings) => AboutPage(),
          '/auth': (context, settings) => AuthPage(),
          '/providers': (context, settings) => ProvidersPage(),
          '/data': (context, settings) => DataPage(),
          '/widgets': (context, settings) => WidgetsPage(),
          '/helpers': (context, settings) => HelpersPage(),
          '/utils': (context, settings) => UtilsPage(),
          '/sandbox': (context, settings) => SandboxPage(),
          '/bankingApp': (context, settings) => SandboxPage(),
        }),
      );
}

class TheApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoaded = ref.watch(authStateProvider);

    if (!isLoaded.isLoaded
        //ref.watch(isInitiallySignedInProvider) == false
        ) {
      print('loading...');
      return Center(
        child: Container(
          alignment: Alignment(0.0, 0.0),
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      print('loaded');
      return Scaffold(body: Text('hi')
          //   Navigator(
          // initialRoute: '/providers',
          // onGenerateRoute: (RouteSettings settings) {
          //   // print('onGenerateRoute: ${settings}');
          //   if (settings.name == '/' || settings.name == '/providers') {
          //     return PageRouteBuilder(
          //       pageBuilder: (_, __, ___) => ProvidersPage(),
          //     );
          //   } else if (settings.name == '/widgets') {
          //     return PageRouteBuilder(pageBuilder: (_, __, ___) => WidgetsPage());
          //   } else if (settings.name == '/auth') {
          //     return PageRouteBuilder(pageBuilder: (_, __, ___) => AuthPage());
          //   } else {
          //     throw 'no page to show';
          //   }
          // },
          );
    }
  }
}

final StreamProvider<User?> authStateChangesSP =
    StreamProvider<User?>((ref) => FirebaseAuth.instance.authStateChanges());


//TODO we should get constant text from static class