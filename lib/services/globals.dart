import 'package:firebase_analytics/firebase_analytics.dart';

import 'services.dart';

/// Static global state. Immutable services that do not care about build context.
class Global {
  // App Data
  static final String title = 'Steker';

  // Services
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

  // Data Models
  static final Map models = {
    Sticker: (data) => Sticker.fromJson(data),
  };

  // Firestore References
  static final Collection<Sticker> stickerRef = Collection<Sticker>(
    path: 'stickers',
  );
}
