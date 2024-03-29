import 'package:auth/providers.dart';
import 'package:fffw_demo/core/_core_exports.dart';

class ProvidersPage extends ConsumerWidget {
  final SNP<String> text = snp<String>('Hello World!');

  ProvidersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(
      title: 'Providers',
      sections: [
        const SectionLayout(children: [
          Text(
            'Providers is a handy mechanism for state management.\n'
            'This framework is based solely on providers from Riverpod:\n',
          ),
          Link('https://riverpod.dev/'),
        ]),
        SectionLayout(
          children: [
            Text(
              'State Notifier Provider',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text(
              'State Notifier Providers (SNPs) are used for variables that '
              'have to update User Interface when their values change.\n\n'
              'User SNP<T> templated type to create a state notifier provider.\n\n'
              'When the value of the state notifier provider changes, the widget '
              'that is listening to it will be rebuilt.\n\n'
              'This will update the UI with the latest value of SNP.\n\n',
            ),
            const CodeLayout(
              """
final SNP<String> text = snp<String>('Hello World!');
  """,
            ),
            const Text('Here is an example:\n'),
            const CodeLayout(
              """
Widget build(BuildContext context, WidgetRef ref) {
  return 
    Column(
      children: [
        Text(ref.watch(text.state)),
        ElevatedButton(
          onPressed: () => 
            ref.read(text.notifier).value = 
              ref.read(text.notifier).value == 'Nevermind!' 
                ? 'Hello World!' 
                : 'Nevermind!',
          child: Text('Update'),
        )
      ],
    );
  );
}
  """,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(ref.watch(text)),
                    ElevatedButton(
                      onPressed: () => ref.read(text.notifier).value =
                          ref.read(text.notifier).value == 'Nevermind!'
                              ? 'Hello World!'
                              : 'Nevermind!',
                      child: const Text('Update'),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
