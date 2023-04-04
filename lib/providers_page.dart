import 'package:fffw_demo/page_layout.dart';
import 'package:fffw_demo/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/firestore.dart';
import 'package:widgets/app_bar/app_bar.dart';
import 'package:widgets/link.dart';

import 'code_layout.dart';
import 'nav_rail.dart';

class ProvidersPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Providers', sections: [
      SectionLayout(children: [
        Text('To better understand how to use providers,'
            'please read the Riverpod documentation first.\n'
            'The following providers are created to simplify the usage of Firestore '
            'and use the best practices of Riverpod:\n'),
        Link('https://riverpod.dev/'),
        Text(
            'If you are not familiar with concepts of Collections and Documents,'
            'please read the Firestore documentation first:\n'),
        Link('https://firebase.google.com/docs/firestore'),
        Text('Firestore is great for creating real-time apps that '
            'update UI in response to changes in the Firestore database. '
            'Most of the time you take advantage of that when drawing collections'
            'or documents with Stream Providers.\n\n'
            'If your collections are too large or documents receive too many updates '
            'that you don\'t need to listen to, you can use Future Providers'),
      ]),
      SectionLayout(children: [
        Text('Document Stream Provider',
            style: Theme.of(context).textTheme.titleLarge),
        Text(
            'To show an up-to-date document content on the screen, you can use docSP provider.\n\n'
            'path: String - path to the document in the Firestore database\n\n'),
        CodeLayout("""
final AutoDisposeStreamProviderFamily<DocumentSnapshot<Map<String, dynamic>>,
        String> docSP
  """),
        Text('Here is an example:\n'),
        CodeLayout("""
Widget build(BuildContext context, WidgetRef ref) {
  return ref.watch(docSP('test_collection/test_doc')).when(
    data: (doc) => Text(doc.data()['text']),
    loading: () => CircularProgressIndicator(),
    error: (err, stack) => Text(err.toString()),
  );
}
  """),
        Row(children: [
          CodeLayout("""{\n"""
              """  text: 'hello world'\n"""
              """}"""),
          ref.watch(docSP('test_collection/test_doc')).when(
                data: (doc) => Text(doc.data()?['text'] ?? 'null'),
                loading: () => CircularProgressIndicator(),
                error: (err, stack) => Text(err.toString()),
              )
        ])
      ]),
      SectionLayout(children: [
        Text('Collection Stream Providers',
            style: Theme.of(context).textTheme.titleLarge),
        Text(
            'Riverpod collection Stream Provider that listens to a collection\n'
            'WARNING: Use with care as it returns all the documents in the collection\n'
            'whenever any document in collection changes!\n'
            'Only to be used on collections which size is known to be small\n'
            'To work with large collections consider using [filteredColSP] to '
            'limit the number of documents that are fetched.\n\n'),
        CodeLayout(
            """final AutoDisposeStreamProviderFamily<QuerySnapshot<Map<String, dynamic>>, String> colSP"""),
        Text('Here is an example:\n'),
        CodeLayout(""" 
Widget build(BuildContext context, WidgetRef ref) {
  return ref.watch(colSP('test_collection')).when(
    data: (col) => ListView.builder(
      itemCount: col.docs.length,
      itemBuilder: (context, index) => Text(col.docs[index].data()['text']),
    ),
    loading: () => CircularProgressIndicator(),
    error: (err, stack) => Text(err.toString()),
  );
}
  """),
        Row(children: [
          CodeLayout("""{\n"""
              """  test_doc: {\n"""
              """    text: 'hello world'\n"""
              """  }\n"""
              """  test_doc1: {\n"""
              """    text: 'hi again'\n"""
              """  }\n"""
              """}"""),
          ref.watch(colSP('test_collection')).when(
                data: (col) => Column(
                    children: col.docs
                        .map((doc) => Text(doc.data()?['text'] ?? 'null'))
                        .toList()),
                loading: () => CircularProgressIndicator(),
                error: (err, stack) => Text(err.toString()),
              ),
        ])
      ]),
    ]);
  }
}
