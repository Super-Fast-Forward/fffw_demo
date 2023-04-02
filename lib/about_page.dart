import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/firestore.dart';
import 'package:widgets/app_bar/app_bar.dart';

import 'nav_rail.dart';

class AboutPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: CustomAppBar(
          title: Text('Providers Page'),
        ),
        body: Row(
          children: [
            CustomNavRail.getNavRail(),
            Container(
                width: 500,
                child: Column(children: [
                  Text('Firestore Document Providers',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text('Firestore is great for creating real-time apps that'
                      'update UI in response to changes in the database.'
                      'Most of the time you would use that to your advantage when drawing collections'
                      'or documents.\n'
                      'If you are not familiar with concepts of Collections and Documents,'
                      'please read the Firestore documentation first.\n'
                      'To show a document content on the screen, you can use the following provider:\n'),
                  HighlightView("""            
final AutoDisposeStreamProviderFamily<DocumentSnapshot<Map<String, dynamic>>,
        String> docSP
  """,
                      language: 'dart',
                      theme: vsTheme
                      // githubTheme
                      ,
                      padding: EdgeInsets.all(12)),
                  Text('Here is an example:\n'),
                  HighlightView("""
Widget build(BuildContext context, WidgetRef ref) {
  return ref.watch(docSP('test_collection/test_doc')).when(
    data: (doc) => Text(doc.data()['text']),
    loading: () => CircularProgressIndicator(),
    error: (err, stack) => Text(err.toString()),
  );
}
  """,
                      language: 'dart',
                      theme: vsTheme
                      // githubTheme
                      ,
                      padding: EdgeInsets.all(12)),
                  Row(children: [
                    HighlightView("""{
                        data: 'hello world'
                      }""",
                        language: 'dart',
                        theme: vsTheme
                        // githubTheme
                        ,
                        padding: EdgeInsets.all(12)),
                    ref.watch(docSP('test_collection/test_doc')).when(
                          data: (doc) => Text(doc.data()!['text']),
                          loading: () => CircularProgressIndicator(),
                          error: (err, stack) => Text(err.toString()),
                        )
                  ]),
                  Text('Firestore Collection Providers',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(
                      'Riverpod collection Stream Provider that listens to a collection\n'
                      'WARNING: Use with care as it returns all the documents in the collection\n'
                      'whenever any document in collection changes!\n'
                      'Only to be used on collections which size is known to be small\n'
                      'To work with large collections consider using [filteredColSP]\n'),
                  HighlightView("""
  """,
                      language: 'dart',
                      theme: vsTheme
                      // githubTheme
                      ,
                      padding: EdgeInsets.all(12)),
                  HighlightView("""{
                        data: 'hello world'
                      }""",
                      language: 'dart',
                      theme: vsTheme
                      // githubTheme
                      ,
                      padding: EdgeInsets.all(12))
                ])),
            Text('Providers Page',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ));
  }
}
