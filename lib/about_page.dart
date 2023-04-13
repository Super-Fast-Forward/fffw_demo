import 'package:fffw_demo/page_layout.dart';
import 'package:fffw_demo/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/link.dart';

class AboutPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'About', sections: [
      SectionLayout(children: [
        Text('What is Flutter Firebase Framework (FFFW)?',
            style: Theme.of(context).textTheme.titleLarge),
        Text('FFFW is a framework for building Flutter apps with Firebase'
            'It is a collection of widgets, providers and helpers to make development faster and easier.'
            'It is using Riverpod for state management and Firestore for data storage.'),
        Image.asset('./images/fffw.png'),
        Text('Codebase', style: Theme.of(context).textTheme.titleMedium),
        Text('The project is open source and can be found on GitHub:'),
        Link(
            'https://github.com/Super-Fast-Forward/flutter_firebase_framework'),
        Text('The codebase of this demo app can be found here:'),
        Link('https://github.com/Super-Fast-Forward/fffw_demo')
      ]),
      SectionLayout(children: [
        Text('Usage', style: Theme.of(context).textTheme.titleMedium),
        Text('Currently the framework is not yet published on pub.dev.'
            'To use the project simply include it as a dependency in your pubspec.yaml:'),
        Text('Here is an example:\n'),
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
            padding: EdgeInsets.all(12))
      ]),
      SectionLayout(children: [
        Text('Support this project on Patreon:'),
        Link('patreon.com/FlutterFirebaseFramework')
      ])
    ]);
  }
}
