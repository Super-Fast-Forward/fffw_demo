import 'package:fffw_demo/core/_core_exports.dart';

class HelpersPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Utilities', sections: [
      SectionLayout(
        children: [
          Text('Strings', style: Theme.of(context).textTheme.titleLarge),
          Text(
              'stringLeft returns a string with the first [length] characters of [str].'),
          Text('Source Code:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout("""Text(stringLeft('Hello World', 5)"""),
          Text('Widget Example:',
              style: Theme.of(context).textTheme.titleMedium),
          ExampleLayout(
            child: Text(stringLeft('Hello World', 5)),
          ),
        ],
      ),
      SectionLayout(
        children: [
          Text('Timestamp', style: Theme.of(context).textTheme.titleLarge),
          Text('formatDate formats Firestore Timestamp to a date string'),
          Text('Example:', style: Theme.of(context).textTheme.titleMedium),
          CodeLayout(""" Text(formatDate(Timestamp.now())) """),
          ExampleLayout(child: Text(formatDate(Timestamp.now()))),
          Text(
              'This is handy when you receive the Timestamp type from Firestore document. '),
          CodeLayout("""DocStreamWidget(\n"""
              """  docSP('test_collection/test_doc'),\n"""
              """    (context, doc) {\n"""
              """      return Text(formatDate(doc.get('timeCreated')));\n"""
              """  }\n"""
              """)"""),
          ExampleLayout(
              child: DocStreamWidget(docSP('test_collection/test_doc'),
                  (context, doc) {
            return Text(
                formatDate(doc.get('timeCreated'), format: 'yyyy-MM-dd HH:mm'));
          })),
        ],
      ),
    ]);
  }
}
