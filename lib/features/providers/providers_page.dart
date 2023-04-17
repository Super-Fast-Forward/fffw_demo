import 'package:fffw_demo/core/shared_widgets/page_layout.dart';
import 'package:fffw_demo/core/shared_widgets/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/generic.dart';
import 'package:widgets/link.dart';

import 'package:fffw_demo/core/shared_widgets/code_layout.dart';

class ProvidersPage extends ConsumerWidget {
  final SNP<String> text = snp<String>('Hello World!');

  ProvidersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Providers', sections: [
      SectionLayout(children: [
        Text('Providers is a handy mechanism for state management.\n'
            'This framework is based solely on providers from Riverpod:\n'),
        Link('https://riverpod.dev/'),
      ]),
      SectionLayout(children: [
        Text('State Notifier Provider',
            style: Theme.of(context).textTheme.titleLarge),
        Text('State Notifier Providers (SNPs) are used for variables that '
            'have to update User Interface when their values change.\n\n'
            'User SNP<T> templated type to create a state notifier provider.\n\n'
            'When the value of the state notifier provider changes, the widget '
            'that is listening to it will be rebuilt.\n\n'
            'This will update the UI with the latest value of SNP.\n\n'),
        CodeLayout("""
final SNP<String> text = snp<String>('Hello World!');
  """),
        Text('Here is an example:\n'),
        CodeLayout("""
Widget build(BuildContext context, WidgetRef ref) {
  return 
    Column(
      children: [
        Text(ref.watch(text.state)),
        ElevatedButton(
          onPressed: () => 
            ref.read(text.notifier).value = 
              ref.read(text.notifier).value == 'Nevermind!' 
                ? 'Hello World!' 
                : 'Nevermind!',
          child: Text('Update'),
        )
      ],
    );
  );
}
  """),
        Row(children: [
          Column(children: [
            Text(ref.watch(text)),
            ElevatedButton(
              onPressed: () => ref.read(text.notifier).value =
                  ref.read(text.notifier).value == 'Nevermind!'
                      ? 'Hello World!'
                      : 'Nevermind!',
              child: Text('Update'),
            )
          ])
        ])
      ]),
      SectionLayout(children: [
        Text('authStateProvider',
            style: Theme.of(context).textTheme.titleLarge),
        Text(''),
        CodeLayout("""

  """)
      ])
    ]);
  }
}
