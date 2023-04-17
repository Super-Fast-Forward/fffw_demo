import 'package:auth/providers.dart';
import 'package:fffw_demo/core/_core_exports.dart';
import 'package:fffw_demo/features/example_apps/banking_app/banking_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ThemeModeConfig.enableSave = true;
  ThemeModeConfig.defaultToLightTheme = true;
  AuthConfig.enableGoogleAuth = true;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
        title: 'Flutter Firebase Framework',
        themeMode: ref.watch(themeModeSNP) ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        initialRoute: '/',
        onGenerateRoute: generateRoutes(
          {
            '/': (context, settings) => const AboutPage(),
            '/about': (context, settings) => const AboutPage(),
            '/auth': (context, settings) => const AuthPage(),
            '/providers': (context, settings) => ProvidersPage(),
            '/data': (context, settings) => DataPage(),
            '/widgets': (context, settings) => const WidgetsPage(),
            '/helpers': (context, settings) => const HelpersPage(),
            '/utils': (context, settings) => const UtilsPage(),
            '/sandbox': (context, settings) => const SandboxPage(),
            '/bankingApp': (context, settings) => const BankingAppPage(),
          },
        ),
      );
}

class TheApp extends ConsumerWidget {
  const TheApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoaded = ref.watch(authStateProvider);

    if (!isLoaded.isLoaded
        //ref.watch(isInitiallySignedInProvider) == false
        ) {
      print('loading...'); //TODO print in prod code ?
      return Center(
        child: Container(
          alignment: const Alignment(0.0, 0.0), //TODO look at
          child: const CircularProgressIndicator(),
        ),
      );
    } else {
      print('loaded'); //TODO print in prod code ?
      return const Scaffold(body: Text('hi')
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

final StreamProvider<User?> authStateChangesSP = StreamProvider<User?>(
  (ref) => FirebaseAuth.instance.authStateChanges(),
);


//TODO we should get constant text from static class