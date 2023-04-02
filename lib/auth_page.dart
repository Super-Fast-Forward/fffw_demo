import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fffw_demo/page_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:widgets/app_bar/app_bar.dart';

import 'app_bar.dart';
import 'nav_rail.dart';

class AuthPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(
      child: Column(
        children: [
          Text('Providers', style: Theme.of(context).textTheme.titleLarge),
          Text(
              'When using FFFW, we recommend using Riverpod for state management. '
              'Riverpod is a state management library that is built on top of Provider. '
              'These are the providers that you can use for Authentication:'),
          Text('', style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
