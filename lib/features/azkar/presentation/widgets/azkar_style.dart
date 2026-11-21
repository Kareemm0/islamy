import 'package:flutter/material.dart';

/// Colors from the Azkar design that are not in the shared `AppColors`.
abstract final class AzkarPalette {
  static const emerald = Color(0xFF0D5C3A);
  static const mintText = Color(0xFF8ED6AA);
  static const cardBeige = Color(0xFFF5F3EE);
  static const outlineVariant = Color(0xFF707971);
  static const goldOnAccent = Color(0xFF745C00);
  static const completedBadge = Color(0xFF005232);
}

abstract final class AzkarAssets {
  static const _base = 'assets/images/azkar';
  static const filterMorning = '$_base/filter_morning.svg';
  static const filterEvening = '$_base/filter_evening.svg';
  static const filterAfterPrayer = '$_base/filter_after_prayer.svg';
  static const filterSleep = '$_base/filter_sleep.svg';
  static const bannerStar = '$_base/banner_star.svg';
  static const bannerSun = '$_base/banner_sun.svg';
  static const progressReset = '$_base/progress_reset.svg';
  static const progressPlay = '$_base/progress_play.svg';
  static const badgeShield = '$_base/badge_shield.svg';
  static const badgeReward = '$_base/badge_reward.svg';
  static const badgeCompleted = '$_base/badge_completed.svg';
  static const actionCopy = '$_base/action_copy.svg';
  static const actionShare = '$_base/action_share.svg';
  static const actionInfo = '$_base/action_info.svg';
  static const buttonCheck = '$_base/button_check.svg';
  static const progressRing = '$_base/progress_ring.svg';
  static const tapIcon = '$_base/tap_icon.svg';
  static const wisdomQuote = '$_base/wisdom_quote.svg';
  static const tasbihBeads = '$_base/tasbih_beads.svg';
  static const tasbihChevron = '$_base/tasbih_chevron.svg';
  static const headerSearch = '$_base/header_search.svg';
  static const headerBell = '$_base/header_bell.svg';
  static const headerPerson = '$_base/header_person.svg';
}
