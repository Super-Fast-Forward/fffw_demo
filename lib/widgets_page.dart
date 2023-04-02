import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/app_bar/app_bar.dart';

import 'nav_rail.dart';

class WidgetsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: CustomAppBar(
          title: Text('Widgets Page'),
        ),
        body: Row(
          children: [
            CustomNavRail.getNavRail(),
            Column(
              children: [
                Text('Firestore Collections Providers',
                    style: Theme.of(context).textTheme.labelLarge),
                HighlightView("""            
/// Riverpod collection Stream Provider that listens to a collection
///
/// WARNING: Use with care as it returns all the documents in the collection
/// whenever any document in collection changes!
/// Only to be used on collections which size is known to be small
///
/// To work with large collections consider using [filteredColSP]
final AutoDisposeStreamProviderFamily<QuerySnapshot<Map<String, dynamic>>,
            String> colSP

  """,
                    language: 'dart',
                    theme: vsTheme
                    // githubTheme
                    ,
                    padding: EdgeInsets.all(12)),
                Text('Providers Page',
                    style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          ],
        ));
  }
}
