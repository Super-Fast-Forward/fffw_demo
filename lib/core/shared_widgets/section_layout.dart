import 'package:fffw_demo/core/_core_exports.dart';

class SectionLayout extends ConsumerWidget {
  final List<Widget> children;

  const SectionLayout({super.key, required this.children});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //add padding to each child
    List<Widget> children = this
        .children
        .map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: e,
            ))
        .toList();
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children);
  }
}
