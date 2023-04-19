import 'package:fffw_demo/core/_core_exports.dart';

class ExampleLayout extends ConsumerWidget {
  final Widget child;

  ExampleLayout({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.secondary, width: 1)),
        child: child);
  }
}
