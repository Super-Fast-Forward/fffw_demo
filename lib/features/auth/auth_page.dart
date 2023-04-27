import 'package:auth/login_screen.dart';
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
            SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text('Login Screen',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text(
                'This is the main widget for the login screen. '
                'It will display the login buttons on the left and the main title on the right.',
              ),
            ),
            SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text(
                'Example:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: CodeLayout(
                """LoginScreen('Login', 'Login Buttons', {'Google': true, 'Facebook': true, 'Twitter': true});""",
              ),
            ),
            ExampleLayout(
              child: LoginScreen(
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: ConstantValues.TEXT_WRAPPING_WIDTH,
                          child: Text(
                            'Logo',
                          ),
                        ),
                        SizedBox(
                          width: ConstantValues.TEXT_WRAPPING_WIDTH,
                          child: Text('About The App'),
                        ),
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
            SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text(
                'Login Buttons',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text(
                'LoginButtonsWidget is a widget that displays the login buttons. '
                'Each button is a [ElevatedButton] that calls the appropriate login function. '
                'The login functions are defined in the [LoginConfig] class.',
              ),
            ),
            SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text(
                'Example:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: CodeLayout(
                """LoginButtonsWidget("""
                """screenTitle: 'Login', """
                """onLoginAnonymousButtonPressed: () {"""
                """   print('Login Anonymously');"""
                """});""",
              ),
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
      ],
    );
  }
}
