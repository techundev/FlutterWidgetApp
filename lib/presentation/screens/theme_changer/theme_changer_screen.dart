import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';

  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkModeSelected = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme changer'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
            icon: Icon(
              isDarkModeSelected
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
        ],
      ),

      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int indexColor = ref.watch(selectedColorProvider);
    return RadioGroup<int>(
      groupValue: indexColor,
      onChanged: (value) {
        ref.read(selectedColorProvider.notifier).state = value!;
      },
      child: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final Color color = colors[index];

          return RadioListTile<int>(
            title: Text('Este color?', style: TextStyle(color: color)),
            subtitle: Text('${color.toARGB32()}'),
            value: index,
          );
        },
      ),
    );
  }
}
