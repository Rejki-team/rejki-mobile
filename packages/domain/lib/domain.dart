/// Domain Layer
///
/// Contains business logic, entities, and repository interfaces.
/// This layer is independent of any external frameworks.
library;

// Auth Module
export 'src/auth/auth.dart';

// Chat Module (F-18/F-19, PRD §5.9)
export 'src/chat/chat.dart';

// Job Module
export 'src/job/job.dart';

// Location Module
export 'src/location/location.dart';

// Helper Module
export 'src/helper/helper.dart';
export 'src/worker/worker.dart';

// Profile Module
export 'src/profile/profile.dart';

// Secondhand (Barang Bekas) Module
export 'src/secondhand/secondhand.dart';

// Training Module
export 'src/training/training.dart';

// Notification Module
export 'src/notification/notification.dart';

// Rating Module (F-17, PRD §5.15)
export 'src/rating/rating.dart';

// Report Module (F-20, PRD §5.10/§6.10)
export 'src/report/report.dart';
