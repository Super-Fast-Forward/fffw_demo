import 'package:fffw_demo/core/_core_exports.dart';
import 'package:widgets/copy_to_clipboard_widget.dart';
import 'package:widgets/doc_print.dart';

SNP<String?> currency = snp('AUD');

class WidgetsPage extends ConsumerWidget {
  const WidgetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(
      title: 'Widgets',
      sections: [
        SectionLayout(
          children: [
            Text('DocFieldText', style: Theme.of(context).textTheme.titleLarge),
            const Text(
              'DocFieldText is a widget that displays a field from a Firestore document. '
              'It is a wrapper around the Text widget. It is using the StreamProvider to listen'
              ' to changes in the document.',
            ),
            Text('Code Example:',
                style: Theme.of(context).textTheme.titleMedium),
            const CodeLayout(
              """final docRef = FirebaseFirestore.instance.collection('test_collection').doc('test_doc');\n\n"""
              """DocFieldText(docRef, 'text');""",
            ),
            Text(
              'Widget Example:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
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
            Text(
              'DocFieldTextEdit',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text(
              'DocFieldTextEdit is a widget that displays a field from a Firestore document.'
              'It is a wrapper around the TextFormField widget. It is using the StreamProvider to listen'
              ' to changes in the document.',
            ),
            Text('Example:', style: Theme.of(context).textTheme.titleMedium),
            const CodeLayout(
              """final docRef = FirebaseFirestore.instance.collection('test_collection').doc('test_doc');\n\n"""
              """DocFieldTextEdit(docRef, 'text')""",
            ),
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
            Text(
              'DocFieldTextField',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text(
                'DocFieldTextField is a widget that displays a field from a Firestore document.'
                'It is a wrapper around the TextField widget. It is using the StreamProvider to listen'
                ' to changes in the document.'
                'It is using the TextEditingController to update the document field when the text changes.'
                'It is using the FocusNode to update the document field when the text changes.'),
            Text('Example:', style: Theme.of(context).textTheme.titleMedium),
            const CodeLayout(
              """final docRef = FirebaseFirestore.instance.collection('test_collection').doc('test_doc');\n\n"""
              """DocFieldTextField(docRef, 'text')""",
            ),
            ExampleLayout(
              child: DocFieldTextField(
                FirebaseFirestore.instance
                    .collection('test_collection')
                    .doc('test_doc'),
                'text',
                10,
              ),
            ),
          ],
        ),
        SectionLayout(
          children: [
            Text('SwitchWidget', style: Theme.of(context).textTheme.titleLarge),
            const Text(
              'SwitchWidget is a widget that displays a field from a Firestore document.'
              'It is a wrapper around the Switch widget. It is using the StreamProvider to listen'
              ' to changes in the document.',
            ),
            Text('Example:', style: Theme.of(context).textTheme.titleMedium),
            const CodeLayout(
              """final docRef = FirebaseFirestore.instance.collection('test_collection').doc('test_doc');\n\n"""
              """SwitchWidget(docRef, 'isGood')""",
            ),
            ExampleLayout(
              child: DocSwitch(
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
            Text(
              'DocStreamWidget',
              style: Theme.of(context).textTheme.titleLarge,
            ),

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

            const Text(
              'DocStreamWidget is a widget that builds itself based on the latest snapshot of interaction'
              ' with a Firestore document.'
              'It is using the StreamProvider to listen'
              ' to changes in the document.',
            ),

            Text('Example:', style: Theme.of(context).textTheme.titleMedium),
            const CodeLayout(
              """final docRef = FirebaseFirestore.instance.collection('test_collection').doc('test_doc');\n\n"""
              """DocStreamWidget(docRef, (context, doc) => Text(doc.data()['text']))""",
            ),
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
            Text(
              'ColStreamWidget',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text(
              'ColStreamWidget is a widget that builds itself based on the latest snapshot of interaction'
              ' with a Firestore collection.'
              'It is using the StreamProvider to listen'
              ' to changes in the collection.',
            ),
            Text('Example:', style: Theme.of(context).textTheme.titleMedium),
            const CodeLayout(
              """ColStreamWidget(\n"""
              """  colSP('test_collection'),\n"""
              """  (context, col, items) => ListView(\n"""
              """    shrinkWrap: true,\n"""
              """    children: items,\n"""
              """  ),\n"""
              """  (c, e) => Text(e.data()['text']\n"""
              """ ),\n""",
            ),
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
            Text(
              'NavRail',
              style: Theme.of(context).textTheme.titleLarge,
            ),

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

            const Text('NavigationRail widget with Riverpod state management'),
            Text('Example:', style: Theme.of(context).textTheme.titleMedium),
            const CodeLayout(
              """final navRail = NavRail(\n"""
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
              """);\n""",
            ),
            ExampleLayout(
              child: SizedBox(
                height: 500,
                child: NavRail(
                  key: ValueKey('navRail example'),
                  destinations: const {
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
                  },
                ),
              ),
            ),
          ],
        ),
        SectionLayout(
          children: [
            Text('CustomAppBar', style: Theme.of(context).textTheme.titleLarge),
            const Text(
              'A custom app bar that can be used in place of the default [AppBar] widget.'
              'It can be used to add a [TabBar] to the [AppBar] or to add a [ThemeSwitch] and'
              '[CurrentUserAvatarExtended] to the [AppBar] actions.',
            ),
            Text('Example:', style: Theme.of(context).textTheme.titleMedium),
            const CodeLayout(
              """CustomAppBar(\n"""
              """  tabs: ['Tab 1', 'Tab 2'],\n"""
              """  onTabSelected: (tab) {\n"""
              """    print(tab);\n"""
              """  },\n"""
              """);\n""",
            ),
            ExampleLayout(
              child: SizedBox(
                height: 300,
                child: DefaultTabController(
                  length: 2,
                  child: CustomAppBar(
                    leading: const Icon(Icons.menu),
                    tabs: const ['Tab 1!', 'Tab 2!'],
                    onTabSelected: (context, index, tab) {
                      print(tab); //TODO print in prod code ?
                    },
                    maxTabWidth: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
        SectionLayout(
          children: [
            Text('DocFieldDropDown3',
                style: Theme.of(context).textTheme.titleLarge),
            Text(
                """DocFieldDropDown3 - a dropdown that is populated from a collection stream\n"""
                """- docRef - the document reference\n"""
                """- field - the field to update\n"""
                """- colStreamProvider - the collection stream provider\n"""
                """- builder - the builder function to create the dropdown items\n"""
                """- valueNP - the value notifier provider to update\n"""
                """- onChanged - the function to call when the value changes\n"""
                """- enabled - whether the dropdown is enabled\n"""),
            Text('Example:', style: Theme.of(context).textTheme.titleMedium),
            CodeLayout("""DocFieldDropDown3(\n"""
                """  FirebaseFirestore.instance.collection('test_collection').doc('test_doc'),\n"""
                """  'test_field',\n"""
                """  ['AUD', 'USD', 'EUR']\n"""
                """      .map((e) => DropdownMenuItem(child: Text(e), value: e))\n"""
                """      .toList(),\n"""
                """  enabled: true,\n"""
                """);\n"""),
            ExampleLayout(
                child: Row(
              children: [
                DocFieldDropDown3(
                  key: const Key('DocFieldDropDown3'),
                  FirebaseFirestore.instance
                      .collection('test_collection')
                      .doc('test_doc'),
                  'test_field',
                  ['AUD', 'USD', 'EUR']
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
                      .toList(),
                  valueNP: currency,
                  enabled: true,
                ),
                DocFieldText(
                    FirebaseFirestore.instance
                        .collection('test_collection')
                        .doc('test_doc'),
                    'test_field')
              ],
            ))
          ],
        ),
        _buildColBrowserWidget(context),
        _copyToClipboardWidget(context)
      ],
    );
  }

  _buildColBrowserWidget(BuildContext context) {
    return SectionLayout(
      children: [
        Text('ColBrowser', style: Theme.of(context).textTheme.titleLarge),

        ///
        /// A widget that displays a list of items from a collection and a details view
        /// of the selected item.
        ///
        /// The [ColBrowser] widget is a [ConsumerWidget] that takes a [colStreamProvider]
        /// and a [builder] function. The [colStreamProvider] is used to get a stream of
        /// the collection to be displayed. The [builder] function is called with the
        /// [context] and the [listWidget] and [itemDetails] widgets. The [listWidget]
        /// is a [ColStreamWidget] that displays the list of items from the collection.
        /// The [itemDetails] widget is a [ConsumerWidget] that displays the details of
        /// the selected item.
        ///

        Text(
            """A widget that displays a list of items from a collection and a details view\n"""
            """of the selected item.\n"""
            """\n"""
            """The [ColBrowser] widget is a [ConsumerWidget] that takes a [colStreamProvider]\n"""
            """and a [builder] function. The [colStreamProvider] is used to get a stream of\n"""
            """the collection to be displayed. The [builder] function is called with the\n"""
            """[context] and the [listWidget] and [itemDetails] widgets. The [listWidget]\n"""
            """is a [ColStreamWidget] that displays the list of items from the collection.\n"""
            """The [itemDetails] widget is a [ConsumerWidget] that displays the details of\n"""
            """the selected item.\n"""),
        Text('Example:', style: Theme.of(context).textTheme.titleMedium),
        CodeLayout("""DocFieldDropDown3(\n"""
            """  FirebaseFirestore.instance.collection('test_collection').doc('test_doc'),\n"""
            """  'test_field',\n"""
            """  ['AUD', 'USD', 'EUR']\n"""
            """      .map((e) => DropdownMenuItem(child: Text(e), value: e))\n"""
            """      .toList(),\n"""
            """  enabled: true,\n"""
            """);\n"""),
        ExampleLayout(
            child: ColBrowser(
                colSP('test_collection'),
                (context, listWidget, itemDetails) => Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Text('Items:'),
                            listWidget,
                          ],
                        )),
                        Expanded(child: itemDetails),
                      ],
                    ),
                (context, docRef) =>
                    Card(child: ListTile(title: Text(docRef.id))),
                (context, docRef) => Column(
                      children: [
                        Text('Details:'),
                        DocPrintWidget(docRef),
                      ],
                    ))),
      ],
    );
  }

  Widget _copyToClipboardWidget(BuildContext context) {
    return SectionLayout(
      children: [
        Text('CopyToClipboardWidget',
            style: Theme.of(context).textTheme.titleLarge),
        Text("""A widget that copies the text to the clipboard when tapped.\n"""
            """\n"""
            """The [CopyToClipboard] widget is a [ConsumerWidget] that takes a [text]\n"""
            """and a [builder] function. The [text] is the text to be copied to the\n"""
            """clipboard. The [builder] function is called with the [context] and the\n"""
            """[child] widget. The [child] widget is a [GestureDetector] that copies the\n"""
            """[text] to the clipboard when tapped.\n"""),
        Text('Example:', style: Theme.of(context).textTheme.titleMedium),
        CodeLayout("""CopyToClipboardWidget(\n"""
            """  text: 'Text to copy',\n"""
            """  child: Text('Tap to copy')\n"""
            """);\n"""),
        ExampleLayout(
            child: CopyToClipboardWidget(
          text: 'Text to copy',
          child: Text('Tap to copy'),
        )),
      ],
    );
  }
}
