import 'package:fffw_demo/core/_core_exports.dart';

class CodeLayout extends ConsumerWidget {
  final String code;

  const CodeLayout(this.code, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HighlightView(code,
        language: 'dart', theme: vsTheme, padding: const EdgeInsets.all(12));
  }
}
