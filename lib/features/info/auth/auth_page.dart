import 'package:auth/login_screen.dart';
import 'package:fffw_demo/core/_core_exports.dart';

class AuthPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Authentication', sections: [
      SectionLayout(children: [
        Text('Login Screen', style: Theme.of(context).textTheme.titleLarge),
        Text(
          'This is the main widget for the login screen. '
          'It will display the login buttons on the left and the main title on the right.',
        ),
        Text(
          'Example:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CodeLayout(
            """LoginScreen('Login', 'Login Buttons', {'Google': true, 'Facebook': true, 'Twitter': true});"""),
        ExampleLayout(
          child: LoginScreen(
            Center(
                child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Logo',
                    ),
                    Text('About The App'),
                  ]),
            )),
            'Login Buttons',
            {
              'Google': true,
              'Facebook': true,
              'Twitter': true,
            },
          ),
        ),
      ]),
      SectionLayout(children: [
        Text('Login Buttons', style: Theme.of(context).textTheme.titleLarge),
        Text('LoginButtonsWidget is a widget that displays the login buttons. '
            'Each button is a [ElevatedButton] that calls the appropriate login function. '
            'The login functions are defined in the [LoginConfig] class.'),
        Text(
          'Example:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CodeLayout("""LoginButtonsWidget("""
            """screenTitle: 'Login', """
            """onLoginAnonymousButtonPressed: () {"""
            """   print('Login Anonymously');"""
            """});"""),
        ExampleLayout(
          child: LoginButtonsWidget(
            screenTitle: 'Login',
            onLoginAnonymousButtonPressed: () {
              print('Login Anonymously');
            },
          ),
        )
      ]),
      SectionLayout(children: [
        Text('Getting UID (User ID)',
            style: Theme.of(context).textTheme.titleLarge),
        Text('Once you logged in, you can access UID by kUSR!.uid'),
        Text(
          'Example:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CodeLayout(
          """kUSR != null \n"""
          """? Text('Your user ID is: \${kUSR!.uid}')\n"""
          """ : Text('Not logged in');""",
        ),
        ExampleLayout(
          child: kUSR != null
              ? Text('Your user ID is: ${kUSR!.uid}')
              : Text('Not logged in'),
        )
      ])
    ]);
  }
}
