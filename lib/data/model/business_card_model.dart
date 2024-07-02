import 'package:flutter/material.dart';

@immutable
class BusinessModel {
  final String icon;
  final String value;
  final String title;

  const BusinessModel({required this.icon, required this.value, required this.title});
}
