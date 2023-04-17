import 'package:auth/login_screen.dart';
import 'package:auth/main.dart';
import 'package:fffw_demo/core/shared_widgets/page_layout.dart';
import 'package:fffw_demo/core/shared_widgets/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fffw_demo/core/shared_widgets/code_layout.dart';
import 'package:fffw_demo/core/shared_widgets/example_layout.dart';

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
      ])
    ]);
  }
}
