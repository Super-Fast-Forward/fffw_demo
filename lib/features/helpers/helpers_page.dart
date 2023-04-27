import 'package:fffw_demo/core/_core_exports.dart';

class HelpersPage extends ConsumerWidget {
  const HelpersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(
      title: 'Utilities',
      sections: [
        SectionLayout(
          children: [
            SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text('Strings',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text(
                'stringLeft returns a string with the first [length] characters of [str].',
              ),
            ),
            SizedBox(
              child: Text(
                'Source Code:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: CodeLayout("""Text(stringLeft('Hello World', 5)"""),
            ),
            SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text(
                'Widget Example:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ExampleLayout(
              child: SizedBox(
                width: ConstantValues.TEXT_WRAPPING_WIDTH,
                child: Text(
                  stringLeft('Hello World', 5),
                ),
              ),
            ),
          ],
        ),
        SectionLayout(
          children: [
            SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text('Timestamp',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text(
                  'formatDate formats Firestore Timestamp to a date string'),
            ),
            SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text('Example:',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: CodeLayout(""" Text(formatDate(Timestamp.now())) """),
            ),
            SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: ExampleLayout(child: Text(formatDate(Timestamp.now()))),
            ),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text(
                  'This is handy when you receive the Timestamp type from Firestore document. '),
            ),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: CodeLayout("""DocStreamWidget(\n"""
                  """  docSP('test_collection/test_doc'),\n"""
                  """    (context, doc) {\n"""
                  """      return Text(formatDate(doc.get('timeCreated')));\n"""
                  """  }\n"""
                  """)"""),
            ),
            ExampleLayout(
              child: DocStreamWidget(
                docSP('test_collection/test_doc'),
                (context, doc) {
                  return Text(formatDate(doc.get('timeCreated'),
                      format: 'yyyy-MM-dd HH:mm'));
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
