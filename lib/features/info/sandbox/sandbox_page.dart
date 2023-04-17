import 'package:fffw_demo/core/shared_widgets/page_layout.dart';
import 'package:fffw_demo/core/shared_widgets/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fffw_demo/core/shared_widgets/code_layout.dart';

class SandboxPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Sandbox', sections: [
      SectionLayout(
        children: [
          Text(
              'Sandbox is intended to speed-up development by allowing you to quickly '
              'switch between the App and the Widget you are currently working on.\n'
              'When creating or updating a specific Widget, you may need to test it '
              'to make sure it works as expected. \n'
              'For that you have to launch the App, navigate to the screen where '
              'the Widget is located, and then test it. \n'
              'This process can be time consuming and frustrating. \n'
              'Sandbox allows you to quickly switch between the App and the Widget '
              'without having to navigate to the screen where the Widget is located. \n'
              'You can just use keyboard hot keys to switch between the App and the Widget. \n'),
          Text('Sandbox Launcher',
              style: Theme.of(context).textTheme.titleLarge),
          Text(
              'To laverage the benefits of Sandbox, instead of launching your App \n'
              'in runApp, call SandboxLauncher constructor like so:'),
          Text('Code Example:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout("""// Path: lib/main.dart"""
              """runApp(\n"""
              """  SandboxLauncher2(\n"""
              """    enabled: const String.fromEnvironment('SANDBOX') == 'true',\n"""
              """    app: ProviderScope(child: MainApp()),\n"""
              """    sandbox: SandboxApp(),\n"""
              """    getInitialState: () =>\n"""
              """        kDB.doc('sandbox/serge').get().then((doc) => doc.data()!['sandbox']),\n"""
              """    saveState: (state) => {\n"""
              """      kDB.doc('sandbox/serge').set({'sandbox': state})\n"""
              """    },\n"""
              """  ),\n"""
              """);"""),
          Text('app - your app with riverpod ProviderScope \n'
              'sandbox - Widget you are currently working on and need to be loaded \n'
              'enabled - make sure you only  \n'),
        ],
      ),
      SectionLayout(
        children: [
          Text('Widget-App Toggle',
              style: Theme.of(context).textTheme.titleLarge),
          Text(
              'To toggle between the App and the Widget, press Command+Command on Mac or '
              'Control+Control on Windows. \n'),
        ],
      ),
      SectionLayout(
        children: [
          Text('Providers Overrides',
              style: Theme.of(context).textTheme.titleLarge),
          Text('A lot of times  '
              'Control+Control on Windows. \n'),
        ],
      ),
      SectionLayout(
        children: [
          Text('Configuration', style: Theme.of(context).textTheme.titleLarge),
          Text(
              'For VSCode set Sandbox switch to on by adding the following to your launch.json file:'),
          Text('Code Example:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout("""  "version": "0.2.0"\n"""
              """  "configurations": [\n"""
              """    {\n"""
              """      "name": "Flutter", \n"""
              """      "type": "dart", \n"""
              """      "request": "launch", \n"""
              """      "program": "lib/main.dart", \n"""
              """      "toolArgs": [\n"""
              """        "--dart-define", \n"""
              """        "SANDBOX=true", \n"""
              """      ]\n"""
              """    }\n"""
              """  ]"""),
        ],
      ),
    ]);
  }
}
