
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:uu_app/uu_provider/theme_provider.dart';
List <SingleChildWidget> appRroviders = [
 ChangeNotifierProvider(create: (ctx)=> ThemeProvider())
];
