import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/helpers/size_extensions.dart';
import 'menu_button.dart';
import 'menu_enum.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({super.key});

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  MenuEnum? selectdMenu;
  var colapsed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: colapsed ? 90 : context.percentWidth(0.18),
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: colapsed ? Alignment.center : Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                setState(() {
                  colapsed = !colapsed;
                });
              },
              icon: Icon(
                colapsed
                    ? Icons.keyboard_double_arrow_right
                    : Icons.keyboard_double_arrow_left,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: MenuEnum.values.length,
            itemBuilder: (context, index) {
              final menu = MenuEnum.values[index];
              return MenuButton(
                menu: menu,
                menuSelected: selectdMenu,
                onPressed: (MenuEnum value) {
                  setState(() {
                    selectdMenu = value;
                    Modular.to.navigate(menu.route);
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
