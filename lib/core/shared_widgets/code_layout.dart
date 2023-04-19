import 'package:fffw_demo/core/_core_exports.dart';

class CodeLayout extends ConsumerWidget {
  final String code;

  CodeLayout(this.code);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HighlightView(code,
        language: 'dart', theme: vsTheme, padding: EdgeInsets.all(12));
  }
}
