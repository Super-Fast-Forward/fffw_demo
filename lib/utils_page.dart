import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:fffw_demo/example_layout.dart';
import 'package:fffw_demo/page_layout.dart';
import 'package:fffw_demo/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/firestore.dart';
import 'package:widgets/doc_stream_widget.dart';
import 'package:widgets/link.dart';

import 'code_layout.dart';

class UtilsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Widgets', sections: [
      SectionLayout(
        children: [
          Text('Git ingore file',
              style: Theme.of(context).textTheme.titleLarge),
          Text('Here is the .gitignore file that is custom made for FFFW:\n'),
          Link('')
        ],
      ),
    ]);
  }
}
