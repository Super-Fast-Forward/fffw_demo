import 'package:fffw_demo/core/_core_exports.dart';

class CustomNavRail extends ConsumerWidget {
  static final CustomNavRail _navRail = CustomNavRail(
    key: const ValueKey('navRail'),
  );

  final Map<String, NavigationRailDestination> destinations = {
    'about': const NavigationRailDestination(
      icon: Icon(Icons.info),
      label: Text('About'),
    ),
    'auth': const NavigationRailDestination(
      icon: Icon(Icons.person),
      label: Text('Auth'),
    ),
    'providers': const NavigationRailDestination(
      icon: Icon(Icons.api),
      label: Text('Providers'),
    ),
    'data': const NavigationRailDestination(
      icon: Icon(Icons.storage),
      label: Text('Data'),
    ),
    'widgets': const NavigationRailDestination(
      icon: Icon(Icons.widgets),
      label: Text('Widgets'),
    ),
    'helpers': const NavigationRailDestination(
      icon: Icon(Icons.code),
      label: Text('Helpers'),
    ),
    'sandbox': const NavigationRailDestination(
      icon: Icon(Icons.snowing),
      label: Text('Helpers'),
    ),
    'bankingApp': const NavigationRailDestination(
      icon: Icon(Icons.monetization_on),
      label: Text('Example'),
    ),
  };

  CustomNavRail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavRail(
        onDestinationSelected: (int index) {
          //print('index: $index, name: ${destinations.keys.elementAt(index)}');
          Navigator.of(context)
              .pushNamed('/${destinations.keys.elementAt(index)}');
        },
        destinations: destinations);
  }

  static getNavRail() => _navRail;
}
