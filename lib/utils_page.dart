import 'package:fffw_demo/page_layout.dart';
import 'package:fffw_demo/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/link.dart';

class UtilsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Utils', sections: [
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
