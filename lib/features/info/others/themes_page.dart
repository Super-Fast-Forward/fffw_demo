import 'package:fffw_demo/core/_core_exports.dart';

//TODO isn't used so I am not sure how to categorize it.
class ThemesPage extends ConsumerWidget {
  const ThemesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Themes'),
      ),
      body: Row(
        children: [
          CustomNavRail.getNavRail(),
          Column(
            children: [
              Text('Firestore Collections Providers',
                  style: Theme.of(context).textTheme.labelLarge),
              HighlightView(
                """            
/// Riverpod collection Stream Provider that listens to a collection
///
/// WARNING: Use with care as it returns all the documents in the collection
/// whenever any document in collection changes!
/// Only to be used on collections which size is known to be small
///
/// To work with large collections consider using [filteredColSP]
final AutoDisposeStreamProviderFamily<QuerySnapshot<Map<String, dynamic>>,
            String> colSP

  """,
                language: 'dart',
                theme: vsTheme
                // githubTheme
                ,
                padding: const EdgeInsets.all(12),
              ),
              Text(
                'Providers Page',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
