import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/generic.dart';
import 'package:widgets/nav_rail.dart';

class CustomNavRail extends ConsumerWidget {
  static final CustomNavRail _navRail = CustomNavRail(key: ValueKey('navRail'));

  final Map<String, NavigationRailDestination> destinations = {
    'about': const NavigationRailDestination(
      icon: Icon(Icons.info),
      // selectedIcon: Icon(Icons.favorite),
      label: Text('About'),
    ),
    'auth': const NavigationRailDestination(
      icon: Icon(Icons.person),
      // selectedIcon: Icon(Icons.favorite),
      label: Text('Auth'),
    ),
    'providers': const NavigationRailDestination(
      icon: Icon(Icons.api),
      // selectedIcon: Icon(Icons.bookmark),
      label: Text('Providers'),
    ),
    'widgets': const NavigationRailDestination(
      icon: Icon(Icons.widgets),
      // selectedIcon: Icon(Icons.bookmark),
      label: Text('Widgets'),
    ),
  };

  CustomNavRail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavRail(
        key: ValueKey('navRail1'),
        onDestinationSelected: (int index) {
          print('index: $index, name: ${destinations.keys.elementAt(index)}');
          Navigator.of(context)
              .pushNamed('/' + destinations.keys.elementAt(index));
        },
        destinations: destinations);
  }

  static getNavRail() => _navRail;
}
