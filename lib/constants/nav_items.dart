import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

List<String> getNavTitles(BuildContext context) => [
  tr('Home'),
  tr('Skills'),
  tr('Projects'),
  tr('Blog'),
  tr('Contact'),
];

List<IconData> navIcons = [
  Icons.home,
  Icons.handyman_outlined,
  Icons.apps,
  Icons.quick_contacts_mail,
  Icons.web,
];
