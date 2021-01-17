import 'package:flutter/material.dart';

Widget transitionBuilder(c, anim, a2, child) => SlideTransition(
      child: child,
      position: Tween<Offset>(
        begin: const Offset(-0.5, 0),
        end: const Offset(0, 0),
      ).animate(CurvedAnimation(
        parent: anim,
        curve: Curves.linearToEaseOut,
      )),
    );
