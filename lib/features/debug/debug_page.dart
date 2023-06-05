import 'package:fffw_demo/core/_core_exports.dart';

class DebugPage extends ConsumerWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Debug', sections: [
      SectionLayout(
        children: [
          Text(
            'Common errors',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Text(
            'Here is the list of common errors that Flutter framework produces:\n',
          ),
          const Link('https://docs.flutter.dev/testing/common-errors')
        ],
      ),
    ]);
  }
}
