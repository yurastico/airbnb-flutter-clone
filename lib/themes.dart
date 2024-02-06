import 'package:flutter/material.dart';

ThemeData themeData(BuildContext context) => ThemeData(
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 5,
            indicatorColor: Colors.white,
            labelTextStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return const TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.bold);
              }
              return const TextStyle(color: Colors.black45);
            }),
            iconTheme: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return const IconThemeData(color: Colors.redAccent, opacity: 1);
              }
              return const IconThemeData(color: Colors.black, opacity: 0.4);
            })),
        chipTheme: ChipThemeData(
          disabledColor: Colors.white,
          selectedColor: Colors.white,
          secondarySelectedColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(
              width: 0.5,
            ),
          ),
        ),
        textTheme: TextTheme(
          headlineMedium: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black),
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.white,
        ),
      );