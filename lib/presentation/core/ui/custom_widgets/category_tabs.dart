import 'package:flutter/material.dart';

class CategoryTabs extends StatefulWidget {
  final List<String> categories;
  final Function(String, int) onCategorySelected;

  CategoryTabs(this.categories, this.onCategorySelected);

  @override
  _CategoryTabsState createState() => _CategoryTabsState(categorySelected: categories.first);
}

class _CategoryTabsState extends State<CategoryTabs> {
  final ScrollController _controller = ScrollController();

  String categorySelected;

  _CategoryTabsState({this.categorySelected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: ListView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width - (widget.categories.last.length * 10)),
        children: widget.categories.map((e) {
          final index = widget.categories.indexOf(e);
          final width = (e.length * 10).toDouble();
          final key = GlobalKey();
          final categoryWidget = Container(
              key: key,
              alignment: Alignment.center,
              width: width,
              child: Text(widget.categories[index],
                  style: theme.textTheme.bodyText2.copyWith(color: widget.categories[index] == categorySelected ? theme.accentColor : theme.disabledColor)));
          return InkWell(
              onTap: () {
                _controller.animateTo(width * index, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                Scrollable.ensureVisible(key.currentContext, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                setState(() => categorySelected = e);
                widget.onCategorySelected.call(e, index);
              },
              child: categoryWidget);
        }).toList(),
      ),
    );
  }
}
