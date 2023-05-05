import 'package:auth/login_screen.dart';
import 'package:auth/providers.dart';
import 'package:fffw_demo/core/_core_exports.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(
      title: 'Authentication',
      sections: [
        SectionLayout(
          children: [
            Text('Login Screen', style: Theme.of(context).textTheme.titleLarge),
            const Text(
              'This is the main widget for the login screen. '
              'It will display the login buttons on the left and the main title on the right.',
            ),
            Text(
              'Example:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const CodeLayout(
              """LoginScreen('Login', 'Login Buttons', {'Google': true, 'Facebook': true, 'Twitter': true});""",
            ),
            ExampleLayout(
              child: LoginScreen(
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Logo',
                        ),
                        Text('About The App'),
                      ],
                    ),
                  ),
                ),
                'Login Buttons',
                const {
                  'Google': true,
                  'Facebook': true,
                  'Twitter': true,
                },
              ),
            ),
          ],
        ),
        SectionLayout(
          children: [
            Text(
              'Login Buttons',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text(
              'LoginButtonsWidget is a widget that displays the login buttons. '
              'Each button is a [ElevatedButton] that calls the appropriate login function. '
              'The login functions are defined in the [LoginConfig] class.',
            ),
            Text(
              'Example:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const CodeLayout(
              """LoginButtonsWidget("""
              """screenTitle: 'Login', """
              """onLoginAnonymousButtonPressed: () {"""
              """   print('Login Anonymously');"""
              """});""",
            ),
            ExampleLayout(
              child: LoginButtonsWidget(
                screenTitle: 'Login',
                onLoginAnonymousButtonPressed: () {
                  print('Login Anonymously'); //TODO print in prod code ?
                },
              ),
            ),
          ],
        ),
        _buildAuthProvidersSection(context, ref),
      ],
    );
  }

  Widget _buildAuthProvidersSection(BuildContext context, WidgetRef ref) =>
      SectionLayout(
        children: [
          Text(
            'authStateProvider',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Text(
            'To access the current user, use the authStateProvider:'
            'You can get the current state of the user by calling ref.watch(authStateProvider).user.\n\n'
            'Example:',
          ),
          const CodeLayout(
            """Text('Current User: '),\n"""
            """ref.watch(authStateProvider).user == null\n"""
            """  ? Text('Not signed in')\n"""
            """  : Text('Singed in as: \${ref.watch(authStateProvider).user?.displayName ?? "Anonymous"}'),""",
          ),
          Column(
            children: [
              Text('Current User: '),
              !ref.watch(authStateProvider).isLoaded
                  ? Text('Loading...')
                  : ref.watch(authStateProvider).user == null
                      ? Text('Not signed in')
                      : Text(
                          'Singed in as: ${ref.watch(authStateProvider).user?.displayName ?? "Anonymous"}'),
            ],
          )
        ],
      );
}
