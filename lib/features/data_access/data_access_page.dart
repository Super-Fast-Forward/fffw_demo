import 'package:fffw_demo/core/_core_exports.dart';
import 'package:widgets/doc_print.dart';

class DataPage extends ConsumerWidget {
  final SNP companyName = snp<String>('jsn');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(
      title: 'Data Access',
      sections: [
        const SectionLayout(children: [
          SizedBox(
            width: ConstantValues.TEXT_WRAPPING_WIDTH,
            child: Text(
              'To better understand how to use providers,'
              'please read the Riverpod documentation first.\n'
              'The following providers are created to simplify the usage of Firestore '
              'and use the best practices of Riverpod:\n',
            ),
          ),
          SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Link('https://riverpod.dev/')),
          SizedBox(
            width: ConstantValues.TEXT_WRAPPING_WIDTH,
            child: Text(
              'If you are not familiar with concepts of Collections and Documents,'
              'please read the Firestore documentation first:\n',
            ),
          ),
          SizedBox(
            width: ConstantValues.TEXT_WRAPPING_WIDTH,
            child: Link('https://firebase.google.com/docs/firestore'),
          ),
          SizedBox(
            width: ConstantValues.TEXT_WRAPPING_WIDTH,
            child: Text(
              'Firestore is great for creating real-time apps that '
              'update UI in response to changes in the Firestore database. '
              'Most of the time you take advantage of that when drawing collections'
              'or documents with Stream Providers.\n\n'
              'If your collections are too large or documents receive too many updates '
              'that you don\'t need to listen to, you can use Future Providers',
            ),
          ),
        ]),
        SectionLayout(
          children: [
            SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text(
                'Document Stream Provider',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text(
                'To show an up-to-date document content on the screen, you can use docSP provider.\n\n'
                'path: String - path to the document in the Firestore database\n\n',
              ),
            ),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: CodeLayout(
                """
            final AutoDisposeStreamProviderFamily<DocumentSnapshot<Map<String, dynamic>>,
                    String> docSP
              """,
              ),
            ),
            const SizedBox(
                width: ConstantValues.TEXT_WRAPPING_WIDTH,
                child: Text('Here is an example:\n')),
            const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: CodeLayout(
                """
            Widget build(BuildContext context, WidgetRef ref) {
              return ref.watch(docSP('test_collection/test_doc')).when(
                data: (doc) => Text(doc.data()['text']),
                loading: () => CircularProgressIndicator(),
                error: (err, stack) => Text(err.toString()),
              );
            }
              """,
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: ConstantValues.TEXT_WRAPPING_WIDTH,
                  child: CodeLayout(
                    """{\n"""
                    """  text: 'hello world'\n"""
                    """}""",
                  ),
                ),
                ref
                    .watch(
                      docSP('test_collection/test_doc'),
                    )
                    .when(
                      data: (doc) => Text(doc.data()?['text'] ?? 'null'),
                      loading: () => const CircularProgressIndicator(),
                      error: (err, stack) => Text(
                        err.toString(),
                      ),
                    ),
              ],
            ),
          ],
        ),
        SectionLayout(children: [
          SizedBox(
            width: ConstantValues.TEXT_WRAPPING_WIDTH,
            child: Text(
              'Collection Stream Provider',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            child: Text(
              'Riverpod collection Stream Provider that listens to a collection\n'
              'WARNING: Use with care as it returns all the documents in the collection\n'
              'whenever any document in collection changes!\n'
              'Only to be used on collections which size is known to be small\n'
              'To work with large collections consider using [filteredColSP] to '
              'limit the number of documents that are fetched.\n\n',
            ),
          ),
          const SizedBox(
            width: ConstantValues.TEXT_WRAPPING_WIDTH,
            child: CodeLayout(
              """final AutoDisposeStreamProviderFamily<QuerySnapshot<Map<String, dynamic>>, String> colSP""",
            ),
          ),
          const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text('Here is an example:\n')),
          const SizedBox(
            width: ConstantValues.TEXT_WRAPPING_WIDTH,
            child: CodeLayout(
              """ 
          Widget build(BuildContext context, WidgetRef ref) {
            return ref.watch(colSP('test_collection')).when(
              data: (col) => 
                  Column(
            children: col.docs
                .map((doc) => Text(doc.data()?['text'] ?? 'null'))
                .toList()),
              loading: () => CircularProgressIndicator(),
              error: (err, stack) => Text(err.toString()),
            );
          }
            """,
            ),
          ),
          Row(children: [
            const SizedBox(
              child: CodeLayout(
                """{\n"""
                """  test_doc: {\n"""
                """    text: 'hello world'\n"""
                """  }\n"""
                """  test_doc1: {\n"""
                """    text: 'hi again'\n"""
                """  }\n"""
                """}""",
              ),
            ),
            ref
                .watch(
                  colSP('test_collection'),
                )
                .when(
                  data: (col) => Column(
                    children: col.docs
                        .map((doc) => Text(doc.data()['text'] ?? 'null'))
                        .toList(),
                  ),
                  loading: () => const CircularProgressIndicator(),
                  error: (err, stack) => Text(
                    err.toString(),
                  ),
                ),
          ])
        ]),
        SectionLayout(children: [
          SizedBox(
            width: ConstantValues.TEXT_WRAPPING_WIDTH,
            child: Text('Filtered Collection Stream Provider',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(
            width: ConstantValues.TEXT_WRAPPING_WIDTH,
            child: Text(
              'Riverpod collection Stream Provider that listens to a collection\n'
              'WARNING: Use with care as it returns all the documents in the collection\n'
              'whenever any document in collection changes!\n'
              'Only to be used on collections which size is known to be small\n'
              'To work with large collections consider using [filteredColSP] to '
              'limit the number of documents that are fetched.\n\n',
            ),
          ),
          const SizedBox(
            width: ConstantValues.TEXT_WRAPPING_WIDTH,
            child: CodeLayout(
                """final AutoDisposeStreamProviderFamily<QuerySnapshot<Map<String, dynamic>>, String> colSP"""),
          ),
          const SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text('Here is an example:\n')),
          const SizedBox(
            width: ConstantValues.TEXT_WRAPPING_WIDTH,
            child: CodeLayout(
              """ 
          Widget build(BuildContext context, WidgetRef ref) {
            return ref.watch(
              colSPfiltered2(
                'company',
                queries: [
                  QueryParam2('type', isEqualTo: 'shared'),
                  QueryParam2('isStartup', isEqualTo: true),
                ]
              )).when(
              data: (col) => Column(
                  children: col.docs
              .map((doc) => Text(doc.data()['name'] ?? 'null'))
              .toList()),
              loading: () => CircularProgressIndicator(),
              error: (err, stack) => Text(err.toString()),
            );
          }
            """,
            ),
          ),
          Row(children: [
            Column(
              children: const [
                SizedBox(
                    width: ConstantValues.TEXT_WRAPPING_WIDTH,
                    child: Text('Collection in Firestore:')),
                CodeLayout("""{\n"""
                    """  jsn: {\n"""
                    """    name: 'Job Search Ninja'\n"""
                    """    type: 'shared'\n"""
                    """    isStartup: true\n"""
                    """  }\n"""
                    """  tesla: {\n"""
                    """    name: 'Tesla'\n"""
                    """    type: 'public'\n"""
                    """    isStartup: false\n"""
                    """  }\n"""
                    """  spacex: {\n"""
                    """    name: 'SpaceX'\n"""
                    """    type: 'private'\n"""
                    """    isStartup: true\n"""
                    """  }\n"""
                    """}"""),
              ],
            ),
            SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: ExampleLayout(
                  child: ref
                      .watch(colSPfiltered2('company', queries: [
                        const QueryParam2('type', isEqualTo: 'shared'),
                        const QueryParam2('isStartup', isEqualTo: true),
                      ]))
                      .when(
                        data: (col) => Column(
                            children: col.docs
                                .map(
                                    (doc) => Text(doc.data()['name'] ?? 'null'))
                                .toList()),
                        loading: () => const CircularProgressIndicator(),
                        error: (err, stack) => Text(err.toString()),
                      )),
            ),
          ])
        ]),
        SectionLayout(
          children: [
            SizedBox(
              width: ConstantValues.TEXT_WRAPPING_WIDTH,
              child: Text(
                'Combining Stream Providers with State Notifier providers',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Text(''),
            // CodeLayout(
            //     """final AutoDisposeStreamProviderFamily<QuerySnapshot<Map<String, dynamic>>, String> colSP"""),
            // Text('Here is an example:\n'),
            const CodeLayout(""" 
  """),
            Row(
              children: [
                ExampleLayout(
                  child: Consumer(
                    builder: (context, ref, child) {
                      return Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              ref.read(companyName.notifier).value = 'tesla';
                            },
                            child: const Text('Change to tesla'),
                          ),
                          SizedBox(
                            width: ConstantValues.TEXT_WRAPPING_WIDTH,
                            child: Text(ref.watch(companyName).toString()),
                          ),
                          DocStreamWidget(
                            docSP('company/${ref.watch(companyName)}'),
                            (context, doc) => Row(
                              children: [
                                ElevatedButton(
                                    onPressed: doc.exists
                                        ? () => print('contacted')
                                        : null, //TODO print in prod code ?
                                    child: const Text('Contact Company')),
                                DocPrintWidget(doc.reference)
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
