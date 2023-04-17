import 'package:fffw_demo/core/_core_exports.dart';

class PageLayout extends ConsumerWidget {
  final List<Widget> sections;
  final String title;

  const PageLayout({super.key, required this.sections, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: CustomAppBar(
          title: Text(title),
        ),
        body: Row(children: [
          CustomNavRail.getNavRail(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: ListView.separated(
                    itemBuilder: (context, index) => sections[index],
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: sections.length)),
          ))
        ]));
  }
}
