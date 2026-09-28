import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const new({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo!'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Estas seguro?'),
        content: Text(
          'Veniam excepteur eu eu mollit cupidatat cillum magna mollit laboris elit pariatur incididunt excepteur elit. Qui magna reprehenderit non aute excepteur esse officia veniam fugiat exercitation consequat tempor. In labore nulla magna ea exercitation culpa. Sit aliqua occaecat et deserunt ad do minim pariatur mollit pariatur laboris commodo do dolore.',
        ),
        actions: [
          TextButton(onPressed: ()=>context.pop(), child: Text('Cancelar')),
          FilledButton(onPressed: ()=>context.pop(), child: Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars y Dialogs')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Sunt eu nisi ad Lorem commodo veniam sint sit esse Lorem et. Ex amet incididunt voluptate occaecat esse ipsum sit ex anim in do sunt. Pariatur nulla adipisicing est cupidatat consequat. Laborum incididunt laboris irure ea dolore fugiat occaecat excepteur fugiat tempor. Quis commodo enim nulla et reprehenderit veniam incididunt officia reprehenderit aliquip quis Lorem sunt. Esse quis cillum ad cupidatat veniam dolor eu deserunt anim exercitation tempor do cupidatat.',
                    ),
                  ],
                );
              },
              child: Text('Licensias usadas'),
            ),

            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        icon: Icon(Icons.remove_red_eye_outlined),
        label: Text('Mostrar Snackbar'),
      ),
    );
  }
}
