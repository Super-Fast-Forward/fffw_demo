import 'package:fffw_demo/page_layout.dart';
import 'package:fffw_demo/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgets/app_bar/app_bar.dart';

import 'nav_rail.dart';

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
        Text('Codebase', style: Theme.of(context).textTheme.titleMedium),
        Text('The project is open source and can be found on GitHub:'),
        InkWell(
          onTap: () => _launchURL(
              'https://github.com/Super-Fast-Forward/flutter_firebase_framework'),
          child: Text(
            'https://github.com/Super-Fast-Forward/flutter_firebase_framework',
            style: linkStyle,
          ),
        ),
        Text('The codebase of this demo app can be found here:'),
        InkWell(
            onTap: () =>
                _launchURL('https://github.com/Super-Fast-Forward/fffw_demo'),
            child: Text(
              'https://github.com/Super-Fast-Forward/fffw_demo',
              style: linkStyle,
            )),
      ])
    ]);
  }
}

Future<void> _launchURL(String url) async {
  // if (await canLaunchUrl(Uri.parse(url))) {
  await launchUrl(Uri.parse(url));
  // } else {
  //   throw 'Could not launch $url';
  // }
}

final linkStyle = TextStyle(
  decoration: TextDecoration.underline,
  color: Colors.blue,
  fontSize: 20,
);
