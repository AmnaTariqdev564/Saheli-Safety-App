import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final List<String> icons;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFFF3974),
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () => onItemTapped(index),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : const Color(0xFFFFECD0),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  icons[index],
                  width: 24,
                  height: 24,
                  color: isSelected ? const Color(0xFFFF3974) : null,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
