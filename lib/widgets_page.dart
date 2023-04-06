import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fffw_demo/example_layout.dart';
import 'package:fffw_demo/page_layout.dart';
import 'package:fffw_demo/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/firestore.dart';
import 'package:widgets/col_stream_widget.dart';
import 'package:widgets/custom_app_bar.dart';
import 'package:widgets/doc_field_text.dart';
import 'package:widgets/doc_field_text_edit.dart';
import 'package:widgets/doc_multiline_text_field.dart';
import 'package:widgets/doc_stream_widget.dart';
import 'package:widgets/nav_rail.dart';
import 'package:widgets/switch.dart';

import 'code_layout.dart';

class WidgetsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Widgets', sections: [
      SectionLayout(
        children: [
          Text('DocFieldText', style: Theme.of(context).textTheme.titleLarge),
          Text(
              'DocFieldText is a widget that displays a field from a Firestore document. '
              'It is a wrapper around the Text widget. It is using the StreamProvider to listen'
              ' to changes in the document.'),
          Text('Code Example:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout(
              """final docRef = FirebaseFirestore.instance.collection('test_collection').doc('test_doc');\n\n"""
              """DocFieldText(docRef, 'text');"""),
          Text('Widget Example:',
              style: Theme.of(context).textTheme.titleMedium),
          ExampleLayout(
            child: DocFieldText(
              FirebaseFirestore.instance
                  .collection('test_collection')
                  .doc('test_doc'),
              'text',
            ),
          ),
        ],
      ),
      SectionLayout(
        children: [
          Text('DocFieldTextEdit',
              style: Theme.of(context).textTheme.titleLarge),
          Text(
              'DocFieldTextEdit is a widget that displays a field from a Firestore document.'
              'It is a wrapper around the TextFormField widget. It is using the StreamProvider to listen'
              ' to changes in the document.'),
          Text('Example:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout(
              """final docRef = FirebaseFirestore.instance.collection('test_collection').doc('test_doc');\n\n"""
              """DocFieldTextEdit(docRef, 'text')"""),
          ExampleLayout(
            child: DocFieldTextEdit(
              FirebaseFirestore.instance
                  .collection('test_collection')
                  .doc('test_doc'),
              'text',
            ),
          ),
        ],
      ),
      SectionLayout(
        children: [
          Text('DocFieldTextField',
              style: Theme.of(context).textTheme.titleLarge),
          Text(
              'DocFieldTextField is a widget that displays a field from a Firestore document.'
              'It is a wrapper around the TextField widget. It is using the StreamProvider to listen'
              ' to changes in the document.'
              'It is using the TextEditingController to update the document field when the text changes.'
              'It is using the FocusNode to update the document field when the text changes.'),
          Text('Example:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout(
              """final docRef = FirebaseFirestore.instance.collection('test_collection').doc('test_doc');\n\n"""
              """DocFieldTextField(docRef, 'text')"""),
          ExampleLayout(
            child: DocFieldTextField(
                FirebaseFirestore.instance
                    .collection('test_collection')
                    .doc('test_doc'),
                'text',
                10),
          ),
        ],
      ),
      SectionLayout(
        children: [
          Text('SwitchWidget', style: Theme.of(context).textTheme.titleLarge),
          Text(
              'SwitchWidget is a widget that displays a field from a Firestore document.'
              'It is a wrapper around the Switch widget. It is using the StreamProvider to listen'
              ' to changes in the document.'),
          Text('Example:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout(
              """final docRef = FirebaseFirestore.instance.collection('test_collection').doc('test_doc');\n\n"""
              """SwitchWidget(docRef, 'isGood')"""),
          ExampleLayout(
            child: SwitchWidget(
              FirebaseFirestore.instance
                  .collection('test_collection')
                  .doc('test_doc'),
              'isGood',
            ),
          ),
        ],
      ),
      SectionLayout(
        children: [
          Text('DocStreamWidget',
              style: Theme.of(context).textTheme.titleLarge),

          /// A widget that builds itself based on the latest snapshot of interaction
          /// with a [Stream].
          ///
          /// [docStreamProvider]: The stream provider to listen to.
          /// [builder]: Called every time the [docStreamProvider] emits a new item to build
          /// the widget based on the document received from Firestore.
          ///
          /// Example:
          /// ```dart
          /// Widget build(BuildContext context, WidgetRef ref) {
          ///  return
          ///   DocStreamWidget(
          ///    docSP('test_collection/test_doc'),
          ///   (context, doc) => Text(doc.data()['text'])),
          /// );
          ///

          Text(
              'DocStreamWidget is a widget that builds itself based on the latest snapshot of interaction'
              ' with a Firestore document.'
              'It is using the StreamProvider to listen'
              ' to changes in the document.'),

          Text('Example:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout(
              """final docRef = FirebaseFirestore.instance.collection('test_collection').doc('test_doc');\n\n"""
              """DocStreamWidget(docRef, (context, doc) => Text(doc.data()['text']))"""),
          ExampleLayout(
            child: DocStreamWidget(
              docSP('test_collection/test_doc'),
              (context, doc) => Text(doc.data()?['text'] ?? 'no data'),
            ),
          ),
        ],
      ),
      SectionLayout(
        children: [
          Text('ColStreamWidget',
              style: Theme.of(context).textTheme.titleLarge),
          Text(
              'ColStreamWidget is a widget that builds itself based on the latest snapshot of interaction'
              ' with a Firestore collection.'
              'It is using the StreamProvider to listen'
              ' to changes in the collection.'),
          Text('Example:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout("""ColStreamWidget(\n"""
              """  colSP('test_collection'),\n"""
              """  (context, col, items) => ListView(\n"""
              """    shrinkWrap: true,\n"""
              """    children: items,\n"""
              """  ),\n"""
              """  (c, e) => Text(e.data()['text']\n"""
              """ ),\n"""),
          ExampleLayout(
            child: ColStreamWidget<Widget>(
              colSP('test_collection'),
              (context, col, items) => ListView(
                shrinkWrap: true,
                children: items,
              ),
              (c, e) => Text(e.data()?['text'] ?? 'no data'),
            ),
          ),
        ],
      ),
      SectionLayout(
        children: [
          Text('NavRail', style: Theme.of(context).textTheme.titleLarge),

          ///
          /// NavigationRail widget with Riverpod state management
          ///
          /// Example:
          ///
          /// ```dart
          /// final navRail = NavRail(
          ///  destinations: {
          ///   'Home': NavigationRailDestination(
          ///    icon: const Icon(Icons.home),
          ///   selectedIcon: const Icon(Icons.home),
          ///   label: const Text('Home'),
          ///  ),
          /// 'Settings': NavigationRailDestination(
          ///  icon: const Icon(Icons.settings),
          /// selectedIcon: const Icon(Icons.settings),
          /// label: const Text('Settings'),
          /// ),
          /// },
          /// );
          /// ```
          ///

          Text('NavigationRail widget with Riverpod state management'),
          Text('Example:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout("""final navRail = NavRail(\n"""
              """  destinations: {\n"""
              """   'Home': NavigationRailDestination(\n"""
              """    icon: const Icon(Icons.home),\n"""
              """   selectedIcon: const Icon(Icons.home),\n"""
              """   label: const Text('Home'),\n"""
              """  ),\n"""
              """'Settings': NavigationRailDestination(\n"""
              """  icon: const Icon(Icons.settings),\n"""
              """ selectedIcon: const Icon(Icons.settings),\n"""
              """ label: const Text('Settings'),\n"""
              """ ),\n"""
              """},\n"""
              """);\n"""),
          ExampleLayout(
            child: SizedBox(
                height: 500,
                child: NavRail(destinations: const {
                  'Home': NavigationRailDestination(
                    icon: Icon(Icons.home),
                    selectedIcon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  'Settings': NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    selectedIcon: Icon(Icons.settings),
                    label: Text('Settings'),
                  ),
                })),
          ),
        ],
      ),
      SectionLayout(
        children: [
          Text('CustomAppBar', style: Theme.of(context).textTheme.titleLarge),
          Text(
              'A custom app bar that can be used in place of the default [AppBar] widget.'
              'It can be used to add a [TabBar] to the [AppBar] or to add a [ThemeSwitch] and'
              '[CurrentUserAvatarExtended] to the [AppBar] actions.'),
          Text('Example:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout("""CustomAppBar(\n"""
              """  tabs: ['Tab 1', 'Tab 2'],\n"""
              """  onTabSelected: (tab) {\n"""
              """    print(tab);\n"""
              """  },\n"""
              """);\n"""),
          ExampleLayout(
            child: SizedBox(
                height: 300,
                child: DefaultTabController(
                    length: 2,
                    child: CustomAppBar(
                      leading: const Icon(Icons.menu),
                      tabs: ['Tab 1', 'Tab 2'],
                      onTabSelected: (tab) {
                        print(tab);
                      },
                    ))),
          ),
        ],
      ),
    ]);
  }
}
