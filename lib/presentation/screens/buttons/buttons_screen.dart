import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons Screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
            ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarm_rounded),
              label: Text('Elevated Icon'),
            ),

            FilledButton(onPressed: () {}, child: Text('Filled')),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.accessibility_new),
              label: Text('Filled Icon'),
            ),

            OutlinedButton(onPressed: () {}, child: Text('Outline')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.terminal),
              label: Text('Outline Icon'),
            ),

            TextButton(onPressed: () {}, child: Text('Text Button')),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.account_box_outlined),
              label: Text('Text Button'),
            ),

CustomButton(),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.app_registration_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.app_registration_outlined),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return  ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola Mundo',style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}