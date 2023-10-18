import 'package:flutter/cupertino.dart';

/// Const Paddings
abstract class CPadding {
  // Zero padding
  static const EdgeInsets zero = EdgeInsets.zero;

  // horizontals
  static const EdgeInsets horizontal4 = EdgeInsets.symmetric(horizontal: 4);
  static const EdgeInsets horizontal6 = EdgeInsets.symmetric(horizontal: 6);
  static const EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets horizontal10 = EdgeInsets.symmetric(horizontal: 10);
  static const EdgeInsets horizontal12 = EdgeInsets.symmetric(horizontal: 12);
  static const EdgeInsets horizontal14 = EdgeInsets.symmetric(horizontal: 14);
  static const EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets horizontal20 = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets horizontal24 = EdgeInsets.symmetric(horizontal: 24);
  static const EdgeInsets horizontal28 = EdgeInsets.symmetric(horizontal: 28);
  static const EdgeInsets horizontal30 = EdgeInsets.symmetric(horizontal: 30);
  static const EdgeInsets horizontal32 = EdgeInsets.symmetric(horizontal: 32);
  static const EdgeInsets horizontal34 = EdgeInsets.symmetric(horizontal: 34);
  static const EdgeInsets horizontal44 = EdgeInsets.symmetric(horizontal: 44);
  static const EdgeInsets horizontal48 = EdgeInsets.symmetric(horizontal: 48);

  // verticals
  static const EdgeInsets vertical2 = EdgeInsets.symmetric(vertical: 2);
  static const EdgeInsets vertical4 = EdgeInsets.symmetric(vertical: 4);
  static const EdgeInsets vertical6 = EdgeInsets.symmetric(vertical: 6);
  static const EdgeInsets vertical8 = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets vertical10 = EdgeInsets.symmetric(vertical: 10);
  static const EdgeInsets vertical12 = EdgeInsets.symmetric(vertical: 12);
  static const EdgeInsets vertical14 = EdgeInsets.symmetric(vertical: 14);
  static const EdgeInsets vertical16 = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets vertical18 = EdgeInsets.symmetric(vertical: 18);
  static const EdgeInsets vertical20 = EdgeInsets.symmetric(vertical: 20);
  static const EdgeInsets vertical22 = EdgeInsets.symmetric(vertical: 22);
  static const EdgeInsets vertical24 = EdgeInsets.symmetric(vertical: 24);
  static const EdgeInsets vertical30 = EdgeInsets.symmetric(vertical: 30);
  static const EdgeInsets vertical44 = EdgeInsets.symmetric(vertical: 44);
  static const EdgeInsets vertical84 = EdgeInsets.symmetric(vertical: 84);

  // vertical-horizontal
  static const EdgeInsets v20h90 = EdgeInsets.symmetric(vertical: 20, horizontal: 90);
  static const EdgeInsets v16h24 = EdgeInsets.symmetric(vertical: 16, horizontal: 24);
  static const EdgeInsets v14h16 = EdgeInsets.symmetric(vertical: 14, horizontal: 16);
  static const EdgeInsets v12h24 = EdgeInsets.symmetric(vertical: 12, horizontal: 24);
  static const EdgeInsets v12h20 = EdgeInsets.symmetric(vertical: 12, horizontal: 20);
  static const EdgeInsets v8h12 = EdgeInsets.symmetric(vertical: 8, horizontal: 12);
  static const EdgeInsets v10h8 = EdgeInsets.symmetric(vertical: 10, horizontal: 8);

  // all
  static const EdgeInsets all3 = EdgeInsets.symmetric(vertical: 3, horizontal: 3);
  static const EdgeInsets all4 = EdgeInsets.symmetric(vertical: 4, horizontal: 4);
  static const EdgeInsets all5 = EdgeInsets.symmetric(vertical: 5, horizontal: 5);
  static const EdgeInsets all8 = EdgeInsets.symmetric(vertical: 8, horizontal: 8);
  static const EdgeInsets all10 = EdgeInsets.symmetric(vertical: 10, horizontal: 10);
  static const EdgeInsets all12 = EdgeInsets.symmetric(vertical: 12, horizontal: 12);
  static const EdgeInsets all14 = EdgeInsets.symmetric(vertical: 14, horizontal: 14);
  static const EdgeInsets all16 = EdgeInsets.symmetric(vertical: 16, horizontal: 16);
  static const EdgeInsets all18 = EdgeInsets.symmetric(vertical: 18, horizontal: 3);
  static const EdgeInsets all20 = EdgeInsets.symmetric(vertical: 20, horizontal: 20);
  static const EdgeInsets all24 = EdgeInsets.symmetric(vertical: 24, horizontal: 24);

  // only
  static const EdgeInsets bottom4 = EdgeInsets.only(bottom: 4);
  static const EdgeInsets top24 = EdgeInsets.only(top: 24);
}
