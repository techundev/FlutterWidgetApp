import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const new();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreadfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),

        ExpansionTile(
          title: Text('Vehiculos de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioGroup(
              groupValue: selectedTransportation,
              onChanged: (Transportation? value) {
                setState(() {
                  selectedTransportation = value!;
                });
              },
              child: Column(
                children: [
                  RadioListTile<Transportation>(
                    title: Text("By car"),
                    subtitle: Text("Travel by car"),
                    value: Transportation.car,
                  ),

                  RadioListTile(
                    title: Text('By plane'),
                    subtitle: Text('Travel by plane'),
                    value: Transportation.plane,
                  ),

                  RadioListTile(
                    title: Text('By boat'),
                    subtitle: Text('Travel by boat'),
                    value: Transportation.boat,
                  ),

                  RadioListTile(
                    title: Text('By submarine'),
                    subtitle: Text('Travel by submarine'),
                    value: Transportation.submarine,
                  ),
                ],
              ),
            ),
          ],
        ),

        CheckboxListTile(
          title: Text('Desayuno?'),
          value: wantsBreadfast,
          onChanged: (value) => setState(() {
            wantsBreadfast = !wantsBreadfast;
          }),
        ),

        CheckboxListTile(
          title: Text('Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),

        CheckboxListTile(
          title: Text('Cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
