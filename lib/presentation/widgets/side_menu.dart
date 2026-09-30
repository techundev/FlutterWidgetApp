import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final ValueChanged<String> onItemSelected;

  const new({super.key, required this.onItemSelected});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        // setState(() {
        //   navDrawerIndex = value;
        // });

        // widget.scaffoldKey.currentState?.closeDrawer();

        // final menuItem = appMenuItem[value];
        // context.push(menuItem.link);

        setState(() => navDrawerIndex = value);
        widget.onItemSelected(appMenuItem[value].link);
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 16, 10),
          child: Text('Main'),
        ),

        ...appMenuItem
            .sublist(0, 3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),

        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 16, 10),
          child: Text('More options'),
        ),

        ...appMenuItem
            .sublist(3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
