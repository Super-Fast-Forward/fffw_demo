import 'package:fffw_demo/page_layout.dart';
import 'package:fffw_demo/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Authentication', sections: [
      SectionLayout(children: [
        Text('Providers', style: Theme.of(context).textTheme.titleLarge),
        Text(
            'When using FFFW, we recommend using Riverpod for state management. '
            'Riverpod is a state management library that is built on top of Provider. '
            'These are the providers that you can use for Authentication:'),
        Text('', style: Theme.of(context).textTheme.titleMedium),
      ])
    ]);
  }
}
