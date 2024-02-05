import 'package:flutter/material.dart';
//just a container to set a child the same padding
Widget insidePadding(
   Widget internalWidget,
   {double bottomPadding = 0}) => Padding(
   padding: EdgeInsets.only(
       left: 12,
       right: 12,
       bottom: bottomPadding),
   child: internalWidget,
);