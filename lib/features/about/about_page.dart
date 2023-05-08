import 'package:fffw_demo/core/_core_exports.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(
      title: 'About',
      sections: [
        SectionLayout(
          children: [
            Text(
              'What is Flutter Firebase Framework (FFFW)?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text(
              'FFFW is a framework for building Flutter apps with Firebase'
              'It is a collection of widgets, providers and helpers to make development faster and easier.'
              'It is using Riverpod for state management and Firestore for data storage.',
            ),
            Image.asset('assets/images/fffw.png'),
            Text(
              'Codebase',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Text(
                'The project is open source and can be found on GitHub:'),
            const Link(
              'https://github.com/Super-Fast-Forward/flutter_firebase_framework',
            ),
            const Text('The codebase of this demo app can be found here:'),
            const Link('https://github.com/Super-Fast-Forward/fffw_demo')
          ],
        ),
        SectionLayout(
          children: [
            Text('Usage', style: Theme.of(context).textTheme.titleMedium),
            const Text(
              'Currently the framework is not yet published on pub.dev.'
              'To use the project simply include it as a dependency in your pubspec.yaml:',
            ),
            const Text('Here is an example:\n'),
            HighlightView(
              "dependencies:\n"
              //"  fffw: ^0.0.1",
              "  common:\n"
              "    git:\n"
              "      url: https://github.com/Super-Fast-Forward/flutter_firebase_framework.git\n"
              "      path: common\n"
              "  sandbox:\n"
              "    git:\n"
              "      url: https://github.com/Super-Fast-Forward/flutter_firebase_framework.git\n"
              "      path: sandbox\n"
              " providers:\n"
              "    git:\n"
              "      url: https://github.com/Super-Fast-Forward/flutter_firebase_framework.git\n"
              "      path: providers\n"
              " auth:\n"
              "    git:\n"
              "      url: https://github.com/Super-Fast-Forward/flutter_firebase_framework.git\n"
              "      path: auth\n"

// dependencies:
// common:
//     git:
//       url: https://github.com/Super-Fast-Forward/flutter_firebase_framework.git
//       path: common
//   sandbox:
//     git:
//       url: https://github.com/Super-Fast-Forward/flutter_firebase_framework.git
//       path: sandbox
//   providers:
//     git:
//       url: https://github.com/Super-Fast-Forward/flutter_firebase_framework.git
//       path: providers
//   auth:
//     git:
//       url: https://github.com/Super-Fast-Forward/flutter_firebase_framework.git
//       path: auth
//   widgets:
//     git:
//       url: https://github.com/Super-Fast-Forward/flutter_firebase_framework.git
//       path: widgets

              ,
              language: 'yaml',
              theme: vsTheme,
              padding: const EdgeInsets.all(12),
            ),
          ],
        ),
        const SectionLayout(
          children: [
            Text('Support this project on Patreon:'),
            Link('patreon.com/FlutterFirebaseFramework')
          ],
        )
      ],
    );
  }
}
