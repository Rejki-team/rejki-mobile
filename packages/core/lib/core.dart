/// Core package - Pure Dart utilities, constants, and abstractions
///
/// Package ini berisi:
/// - Constants
/// - Exceptions
/// - Logger
/// - Result types
/// - Utility functions
/// - Validators (formz inputs)
/// - Models (pure Dart)
///
/// IMPORTANT: This package is pure Dart and has no Flutter dependencies.
/// For DI, use the 'di' package instead.
library;

// Constants
export 'constants/constants.dart';

// Exceptions
export 'exceptions/exceptions.dart';

// Logger
export 'logger/logger.dart';

// Result
export 'result/result.dart';

// Utils
export 'utils/utils.dart';

// Validators
export 'validators/validators.dart';

// Models
export 'models/models.dart';

// Re-export formz untuk validators
export 'package:formz/formz.dart';
