import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamy/core/di/injection_container.dart';
import 'package:islamy/main.dart';

void main() {
  setUpAll(() async {
    GoogleFonts.config.allowRuntimeFetching = false;
    await initDependencies();
  });

  testWidgets('IslamyApp renders all four tabs without errors at 390x844', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const IslamyApp());
    await tester.pump();

    for (final label in ['Home', 'Quran', 'Azkar', 'Hadith']) {
      await tester.tap(find.text(label).last);
      await tester.pump();
    }

    expect(tester.takeException(), isNull);
  });
}
