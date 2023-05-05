import 'package:auth/providers.dart';
import 'package:fffw_demo/core/_core_exports.dart';
import 'package:fffw_demo/features/banking_app/banking_page.dart';
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
