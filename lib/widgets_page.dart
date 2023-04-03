import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fffw_demo/example_layout.dart';
import 'package:fffw_demo/page_layout.dart';
import 'package:fffw_demo/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/app_bar/app_bar.dart';
import 'package:widgets/doc_field_text.dart';
import 'package:widgets/doc_field_text_edit.dart';
import 'package:widgets/doc_multiline_text_field.dart';

import 'code_layout.dart';
import 'nav_rail.dart';

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
    ]);
  }
}
