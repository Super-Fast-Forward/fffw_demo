import 'package:fffw_demo/core/shared_widgets/page_layout.dart';
import 'package:fffw_demo/core/shared_widgets/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BankingAppWidget extends ConsumerWidget {
  const BankingAppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'BankingApp', sections: [
      SectionLayout(children: []),
    ]);
  }
}
