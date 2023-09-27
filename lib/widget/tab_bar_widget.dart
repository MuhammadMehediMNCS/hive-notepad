import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const TabBarWidget({super.key, required this.index, required this.onChangedTab});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    const placeholder = Opacity(
      opacity: 0,
      child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)),
    );

    return BottomAppBar(
      elevation: 4,
      shape: const CircularNotchedRectangle(),
      color: const Color(0xffD68573),
      notchMargin: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTabItems(
              index: 0,
              icon: const Icon(Icons.fact_check_outlined)
            ),
            placeholder,
            buildTabItems(
              index: 1,
              icon: const Icon(Icons.drafts_outlined)
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabItems({required int index, required Icon icon}) {
    final isSelected = index == widget.index;

    return CircleAvatar(
      backgroundColor: isSelected ? const Color(0xff5D1708) : Colors.white,
      child: IconTheme(
        data: IconThemeData(
          color: isSelected ? Colors.white : Colors.black
        ),
        child: IconButton(
          onPressed: () => widget.onChangedTab(index),
          icon: icon
        ),
      ),
    );
  }
}