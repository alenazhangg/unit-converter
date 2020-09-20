import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:unitconverter/unit.dart';

///  [Category] keeps track of a list of [Unit]s
class Category {
  final String name;
  final ColorSwatch color;
  final List<Unit> units;
  final String iconLocation;

  /// Information about a [Category]
  ///
  /// [Category] saves the name of the Category, its color for the UI, and the
  /// icon that represents it
  // @required checks if a named parameter is passed in, but doesn't check if
  // object is null. We check that in assert statement.
  const Category({
    @required this.name,
    @required this.color,
    @required this.units,
    @required this.iconLocation,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null),
        assert(iconLocation != null);
}