/// Utils module - Pure Dart utilities
library;

// NOTE: ConnectivityUtil has been moved to 'network' package
// since it requires Flutter dependencies (connectivity_plus)

// Shared job formatting helpers (date, time, salary, status label)
export 'job_formatter.dart';

// Image compression utility (max 250 KB, background isolate safe)
export 'image_compressor.dart';
