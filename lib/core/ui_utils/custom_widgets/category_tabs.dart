import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CategoryTabs extends StatefulWidget {
  final List<String> categories;
  final Function(String, int) onCategorySelected;

  CategoryTabs({this.categories, this.onCategorySelected});

  @override
  _CategoryTabsState createState() => _CategoryTabsState(categorySelected: categories?.first);
}

class _CategoryTabsState extends State<CategoryTabs> {
  final AutoScrollController _controller = AutoScrollController();

  String categorySelected;

  _CategoryTabsState({this.categorySelected});

  @override
  Widget build(BuildContext context) {
    if (widget.categories?.isNotEmpty != true) return SizedBox();

    final theme = Theme.of(context);
    return Container(
      child: ListView.builder(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width - (widget.categories.last.length * 10)),
          itemCount: widget.categories.length,
          itemBuilder: (c, index) {
            return AutoScrollTag(
              controller: _controller,
              index: index,
              key: ValueKey(index),
              child: InkWell(
                onTap: () {
                  _controller.scrollToIndex(index, duration: Duration(milliseconds: 500), preferPosition: AutoScrollPosition.middle);
                  setState(() => categorySelected = widget.categories[index]);
                  widget.onCategorySelected?.call(widget.categories[index], index);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    widget.categories[index],
                    style: theme.textTheme.bodyText2.copyWith(color: widget.categories[index] == categorySelected ? theme.accentColor : theme.disabledColor),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
