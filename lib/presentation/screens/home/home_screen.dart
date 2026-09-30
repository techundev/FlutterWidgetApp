import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_screen';

  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _onMenuItemSelected(String link) async {
    _scaffoldKey.currentState?.closeDrawer();

    await Future.delayed(const Duration(milliseconds: 250));

    if (!mounted) return;
    context.push(link);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text('Flutter + Material 3')),
      body: _HomeView(),
      drawer: SideMenu(onItemSelected: _onMenuItemSelected),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItem.length,
      itemBuilder: (BuildContext context, int index) {
        final menuItem = appMenuItem[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const new({required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute<void>(builder: (context) => const ButtonsScreen()),
        // );

        // Navigator.pushNamed(context, menuItem.link);

        context.push(menuItem.link);

        // context.pushNamed(CardsScreen.name);
      },
    );
  }
}
