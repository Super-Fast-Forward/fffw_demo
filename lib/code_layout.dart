import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeLayout extends ConsumerWidget {
  final String code;

  CodeLayout(this.code);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HighlightView(code,
        language: 'dart', theme: vsTheme, padding: EdgeInsets.all(12));
  }
}
