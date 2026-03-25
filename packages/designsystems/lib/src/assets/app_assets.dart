/// App Assets
///
/// Path constants for all assets in the application.
///
/// Usage:
/// ```dart
/// Image.asset(AppAssets.splashScreen);
/// Image.asset(AppAssets.onboarding1);
/// SvgPicture.asset(AppAssets.iconHome);
/// ```
abstract class AppAssets {
  // ============================================
  // BASE PATHS
  // ============================================

  static const String _basePath = 'packages/designsystems/assets';
  static const String _imagesPath = '$_basePath/images';
  static const String _iconsPath = '$_basePath/icons';
  static const String _illustrationsPath = '$_basePath/illustrations';
  static const String _animationsPath = '$_basePath/animations';
  static const String _termsPath = '$_basePath/terms';

  // ============================================
  // IMAGES
  // ============================================

  /// Card Holder image
  static const String cardHolder = '$_imagesPath/card_holder.webp';

  /// App logo white variant (SVG)
  static const String logoWhite = '$_imagesPath/rejki_logo_white.svg';

  /// Splash screen image
  static const String splashScreen = '$_imagesPath/splash_screen.png';

  /// Base Background image
  static const String baseBackground = '$_imagesPath/base_background.png';

  /// Email image
  static const String imageEmail = '$_imagesPath/email.png';

  /// Info image
  static const String imageInfo = '$_imagesPath/info.png';

  /// Send image
  static const String imageSend = '$_imagesPath/send.png';

  /// Success image
  static const String imageSuccess = '$_imagesPath/success.png';

  /// Warning image
  static const String imageWarning = '$_imagesPath/warning.png';

  /// Error image
  static const String imageError = '$_imagesPath/failed.png';

  /// Selfie KTP image
  static const String imageSelfieKtp = '$_imagesPath/example_selfie_ktp.webp';

  // ============================================
  // ONBOARDING IMAGES (Illustrations)
  // ============================================

  /// Onboarding slide 1
  static const String onboarding1 = '$_illustrationsPath/onboarding_1.png';

  /// Onboarding slide 2
  static const String onboarding2 = '$_illustrationsPath/onboarding_2.png';

  /// Onboarding slide 3
  static const String onboarding3 = '$_illustrationsPath/onboarding_3.png';

  /// Onboarding slide 4
  static const String onboarding4 = '$_illustrationsPath/onboarding_4.png';

  // ============================================
  // ICONS (SVG)
  // ============================================

  // -- Navigation Icons --

  /// Home icon
  static const String iconHome = '$_iconsPath/home.svg';

  /// Search icon
  static const String iconSearch = '$_iconsPath/search.svg';

  /// Profile icon
  static const String iconProfile = '$_iconsPath/profile.svg';

  /// User icon
  static const String iconUser = '$_iconsPath/user_outlined.svg';

  /// Two users icon
  static const String iconTwoUser = '$_iconsPath/two_user.svg';

  /// User scan icon
  static const String iconUserScan = '$_iconsPath/user_scan.svg';

  // -- Arrow Icons --

  /// Arrow left icon
  static const String iconArrowLeft = '$_iconsPath/arrow_left.svg';

  /// Arrow right icon
  static const String iconArrowRight = '$_iconsPath/arrow_right.svg';

  /// Arrow iOS down icon
  static const String iconArrowIosDown = '$_iconsPath/arrow_ios_down.svg';

  /// Arrow iOS right icon
  static const String iconArrowIosRight = '$_iconsPath/arrow_ios_right.svg';

  /// Key containered icon
  static const String iconKeyContainered = '$_iconsPath/key_containered.svg';

  /// Exit icon
  static const String iconExit = '$_iconsPath/exit.svg';

  /// Diagonal arrow right up icon
  static const String iconDiagonalArrowRightUp =
      '$_iconsPath/diagonal_arrow_right_up.svg';

  // -- Action Icons --

  /// Danger circle icon
  static const String iconDangerCircle = '$_iconsPath/danger_circle.svg';

  /// Filter icon
  static const String iconFilter = '$_iconsPath/filter.svg';

  /// Add outlined icon
  static const String iconAddOutlined = '$_iconsPath/add_outlined.svg';

  /// Plus icon
  static const String iconPlus = '$_iconsPath/plus.svg';

  /// Notification icon
  static const String iconNotification =
      '$_iconsPath/notification_outlined.svg';

  /// Star icon
  static const String iconStar = '$_iconsPath/star.svg';

  /// Save/Favorite icon
  static const String iconSave = '$_iconsPath/save.svg';

  /// Archive icon
  static const String iconArchive = '$_iconsPath/archive.svg';

  /// Upload icon
  static const String iconUpload = '$_iconsPath/upload.svg';

  /// Close small icon
  static const String iconCloseSmall = '$_iconsPath/close_small.svg';

  /// Edit icon
  static const String iconEdit = '$_iconsPath/edit.svg';

  // -- Media Icons --

  /// Camera icon
  static const String iconCamera = '$_iconsPath/camera.svg';

  /// Camera line icon
  static const String iconCameraLine = '$_iconsPath/camera_line.svg';

  /// Image/Gallery icon
  static const String iconImage = '$_iconsPath/image.svg';

  /// Money icon
  static const String iconMoney = '$_iconsPath/money_outlined.svg';

  // -- Communication Icons --

  /// Chat icon
  static const String iconChat = '$_iconsPath/chat.svg';

  /// Message icon
  static const String iconMessage = '$_iconsPath/message.svg';

  /// Message line icon
  static const String iconMessageLine = '$_iconsPath/message_line.svg';

  /// Calling icon
  static const String iconCalling = '$_iconsPath/calling.svg';

  // -- Time & Schedule Icons --

  /// Calendar icon
  static const String iconCalendar = '$_iconsPath/calendar_outlined.svg';

  /// Clock icon
  static const String iconClock = '$_iconsPath/clock_outlined.svg';

  // -- Document Icons --

  /// Document icon
  static const String iconDocument = '$_iconsPath/document.svg';

  /// Paper icon
  static const String iconPaper = '$_iconsPath/paper.svg';

  /// Paper curved icon
  static const String iconPaperCurved = '$_iconsPath/paper_curved.svg';

  /// Todo icon
  static const String iconTodo = '$_iconsPath/todo.svg';

  // -- Security Icons --

  /// Lock icon
  static const String iconLock = '$_iconsPath/lock.svg';

  /// Show/Eye icon
  static const String iconShow = '$_iconsPath/show.svg';

  /// Hide/Eye off icon
  static const String iconHide = '$_iconsPath/hide.svg';

  // -- Checkbox Icons --

  /// Checkbox Default Icon
  static const String iconCheckboxDefault = '$_iconsPath/checkbox_default.svg';

  /// Checkbox Enabled Icon
  static const String iconCheckboxEnabled = '$_iconsPath/checkbox_enabled.svg';

  // -- Info Icons --

  /// Info line icon
  static const String iconInfoLine = '$_iconsPath/info_outlined.svg';

  /// Two colors info icon
  static const String iconTwoColorsInfo = '$_iconsPath/twocolors_info.svg';

  // -- Location & Work Icons --

  /// Location icon
  static const String iconLocation = '$_iconsPath/location_outlined.svg';

  /// Work/Job icon
  static const String iconWork = '$_iconsPath/work.svg';

  /// Discovery icon
  static const String iconDiscovery = '$_iconsPath/discovery.svg';

  // -- Payment Icons --

  /// Card/Wallet icon
  static const String iconCard = '$_iconsPath/card.svg';

  // -- Navigation Filled Icons (for active state) --

  /// Home filled icon (active state)
  static const String iconHomeFilled = '$_iconsPath/home_filled.svg';

  /// Profile filled icon (active state)
  static const String iconProfileFilled = '$_iconsPath/profile_filled.svg';

  /// Todo/News filled icon (active state)
  static const String iconTodoFilled = '$_iconsPath/todo_filled.svg';

  /// Message/Chat filled icon (active state)
  static const String iconMessageFilled = '$_iconsPath/message_filled.svg';

  /// Paper/History filled icon (active state)
  static const String iconPaperFilled = '$_iconsPath/paper_filled.svg';

  // -- Navigation Outlined Icons (for inactive state) --

  /// Home outlined icon (inactive state)
  static const String iconHomeOutlined = '$_iconsPath/home_outlined.svg';

  /// Profile outlined icon (inactive state)
  static const String iconProfileOutlined = '$_iconsPath/profile_outlined.svg';

  /// Todo/News outlined icon (inactive state)
  static const String iconTodoOutlined = '$_iconsPath/todo_outlined.svg';

  /// Message/Chat outlined icon (inactive state)
  static const String iconMessageOutlined = '$_iconsPath/message_outlined.svg';

  /// Paper/History outlined icon (inactive state)
  static const String iconPaperOutlined = '$_iconsPath/paper_outlined.svg';

  // ============================================
  // SCREENS Header Default
  // ============================================

  /// Home Header Background
  static const String screenHomeHeaderBackground =
      '$_imagesPath/home_header_background.png';

  // ============================================
  // ANIMATIONS (Lottie JSON)
  // ============================================

  /// Loading animation (Rejki loading animation)
  static const String animationLoading = '$_animationsPath/rejki_loading.json';

  /// Terms and Conditions animation (Rejki terms and conditions animation)
  static const String termsAndConditions = '$_termsPath/terms_dummy.html';

  // ============================================
  // HELPER METHODS
  // ============================================

  /// Check if asset is SVG
  static bool isSvg(String path) => path.endsWith('.svg');

  /// Check if asset is Lottie
  static bool isLottie(String path) => path.endsWith('.json');

  /// Check if asset is image (PNG/JPG/JPEG/WEBP)
  static bool isImage(String path) {
    final extensions = ['.png', '.jpg', '.jpeg', '.webp', '.gif'];
    return extensions.any((ext) => path.toLowerCase().endsWith(ext));
  }
}
