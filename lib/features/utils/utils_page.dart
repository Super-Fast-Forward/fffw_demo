import 'package:fffw_demo/core/_core_exports.dart';

class UtilsPage extends ConsumerWidget {
  const UtilsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Utils', sections: [
      SectionLayout(
        children: [
          Text(
            'Git ingore file',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Text(
            'Here is the .gitignore file that is custom made for FFFW:\n',
          ),
          const Link('')
        ],
      ),
    ]);
  }
}
