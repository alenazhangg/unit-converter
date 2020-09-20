import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:unitconverter/category.dart';

const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight/2);

/// A [CategoryTile] displays a [Category]
class CategoryTile extends StatelessWidget{
  final Category category;
  final ValueChanged<Category> onTap;

  /// [CategoryTile] shows the name and color of a [Category] for unit
  /// conversions
  ///
  /// Tapping on it brings you to the unit converter
  const CategoryTile({
    Key key,
    @required this.category,
    this.onTap,
  })  : assert(category != null),
        super(key: key);

  /// Builds a custom widget that shows [Category] info
  ///
  /// Includes icon, name, and color for the [Category]
  // `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the headline5 text theme.
  Widget build(BuildContext context) {
    return Material(
      /// if onTap == null then the color is set to be
      /// Color.fromRGBO(50, 50, 50, 0.2),
      /// else the color is transparent
      color: onTap == null ? Color.fromRGBO(50, 50, 50, 0.2)
          : Colors.transparent,
      child: Container(
        height: _rowHeight,
        // Inkwell is a rectangular area of material that responds to a touch
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: category.color['highlight'],
          splashColor: category.color['splash'],

          onTap: onTap == null ? null
              : () => onTap(category),
          child: Padding(
            // 8.0 pixel margins on all sides
            padding: EdgeInsets.all(8.0),
            // formatting the placement of text and icon
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  // displays an ImageStream obtained from an asset bundle
                  child: Image.asset(category.iconLocation),
                ),
                Center(
                  child: Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}