// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentState {
  String get trainingId;
  String get enrollmentId;
  String get trainingTitle;
  String get fee;
  String get bankName;
  String get bankAccountNumber;
  String get bankAccountHolderName;
  String get status;
  DateTime? get paymentDeadline;
  File? get proofImage;
  bool get isSubmitting;
  bool get isUploadSuccess;
  String? get errorMessage;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentStateCopyWith<PaymentState> get copyWith =>
      _$PaymentStateCopyWithImpl<PaymentState>(
          this as PaymentState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentState &&
            (identical(other.trainingId, trainingId) ||
                other.trainingId == trainingId) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.trainingTitle, trainingTitle) ||
                other.trainingTitle == trainingTitle) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(
                    other.bankAccountHolderName, bankAccountHolderName) ||
                other.bankAccountHolderName == bankAccountHolderName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentDeadline, paymentDeadline) ||
                other.paymentDeadline == paymentDeadline) &&
            (identical(other.proofImage, proofImage) ||
                other.proofImage == proofImage) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isUploadSuccess, isUploadSuccess) ||
                other.isUploadSuccess == isUploadSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      trainingId,
      enrollmentId,
      trainingTitle,
      fee,
      bankName,
      bankAccountNumber,
      bankAccountHolderName,
      status,
      paymentDeadline,
      proofImage,
      isSubmitting,
      isUploadSuccess,
      errorMessage);

  @override
  String toString() {
    return 'PaymentState(trainingId: $trainingId, enrollmentId: $enrollmentId, trainingTitle: $trainingTitle, fee: $fee, bankName: $bankName, bankAccountNumber: $bankAccountNumber, bankAccountHolderName: $bankAccountHolderName, status: $status, paymentDeadline: $paymentDeadline, proofImage: $proofImage, isSubmitting: $isSubmitting, isUploadSuccess: $isUploadSuccess, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) _then) =
      _$PaymentStateCopyWithImpl;

  @useResult
  $Res call({
    String trainingId,
    String enrollmentId,
    String trainingTitle,
    String fee,
    String bankName,
    String bankAccountNumber,
    String bankAccountHolderName,
    String status,
    DateTime? paymentDeadline,
    File? proofImage,
    bool isSubmitting,
    bool isUploadSuccess,
    String? errorMessage,
  });
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._self, this._then);

  final PaymentState _self;
  final $Res Function(PaymentState) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainingId = null,
    Object? enrollmentId = null,
    Object? trainingTitle = null,
    Object? fee = null,
    Object? bankName = null,
    Object? bankAccountNumber = null,
    Object? bankAccountHolderName = null,
    Object? status = null,
    Object? paymentDeadline = freezed,
    Object? proofImage = freezed,
    Object? isSubmitting = null,
    Object? isUploadSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      trainingId: null == trainingId
          ? _self.trainingId
          : trainingId as String,
      enrollmentId: null == enrollmentId
          ? _self.enrollmentId
          : enrollmentId as String,
      trainingTitle: null == trainingTitle
          ? _self.trainingTitle
          : trainingTitle as String,
      fee: null == fee ? _self.fee : fee as String,
      bankName: null == bankName ? _self.bankName : bankName as String,
      bankAccountNumber: null == bankAccountNumber
          ? _self.bankAccountNumber
          : bankAccountNumber as String,
      bankAccountHolderName: null == bankAccountHolderName
          ? _self.bankAccountHolderName
          : bankAccountHolderName as String,
      status: null == status ? _self.status : status as String,
      paymentDeadline: freezed == paymentDeadline
          ? _self.paymentDeadline
          : paymentDeadline as DateTime?,
      proofImage: freezed == proofImage
          ? _self.proofImage
          : proofImage as File?,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting as bool,
      isUploadSuccess: null == isUploadSuccess
          ? _self.isUploadSuccess
          : isUploadSuccess as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage as String?,
    ));
  }
}

/// @nodoc
class _PaymentState implements PaymentState {
  const _PaymentState({
    this.trainingId = '',
    this.enrollmentId = '',
    this.trainingTitle = '',
    this.fee = '',
    this.bankName = '',
    this.bankAccountNumber = '',
    this.bankAccountHolderName = '',
    this.status = 'pending',
    this.paymentDeadline,
    this.proofImage,
    this.isSubmitting = false,
    this.isUploadSuccess = false,
    this.errorMessage,
  });

  @override
  @JsonKey()
  final String trainingId;
  @override
  @JsonKey()
  final String enrollmentId;
  @override
  @JsonKey()
  final String trainingTitle;
  @override
  @JsonKey()
  final String fee;
  @override
  @JsonKey()
  final String bankName;
  @override
  @JsonKey()
  final String bankAccountNumber;
  @override
  @JsonKey()
  final String bankAccountHolderName;
  @override
  @JsonKey()
  final String status;
  @override
  final DateTime? paymentDeadline;
  @override
  final File? proofImage;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isUploadSuccess;
  @override
  final String? errorMessage;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentStateCopyWith<_PaymentState> get copyWith =>
      __$PaymentStateCopyWithImpl<_PaymentState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentState &&
            (identical(other.trainingId, trainingId) ||
                other.trainingId == trainingId) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.trainingTitle, trainingTitle) ||
                other.trainingTitle == trainingTitle) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(
                    other.bankAccountHolderName, bankAccountHolderName) ||
                other.bankAccountHolderName == bankAccountHolderName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentDeadline, paymentDeadline) ||
                other.paymentDeadline == paymentDeadline) &&
            (identical(other.proofImage, proofImage) ||
                other.proofImage == proofImage) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isUploadSuccess, isUploadSuccess) ||
                other.isUploadSuccess == isUploadSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      trainingId,
      enrollmentId,
      trainingTitle,
      fee,
      bankName,
      bankAccountNumber,
      bankAccountHolderName,
      status,
      paymentDeadline,
      proofImage,
      isSubmitting,
      isUploadSuccess,
      errorMessage);

  @override
  String toString() {
    return 'PaymentState(trainingId: $trainingId, enrollmentId: $enrollmentId, trainingTitle: $trainingTitle, fee: $fee, bankName: $bankName, bankAccountNumber: $bankAccountNumber, bankAccountHolderName: $bankAccountHolderName, status: $status, paymentDeadline: $paymentDeadline, proofImage: $proofImage, isSubmitting: $isSubmitting, isUploadSuccess: $isUploadSuccess, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$PaymentStateCopyWith<$Res>
    implements $PaymentStateCopyWith<$Res> {
  factory _$PaymentStateCopyWith(
          _PaymentState value, $Res Function(_PaymentState) _then) =
      __$PaymentStateCopyWithImpl;

  @override
  @useResult
  $Res call({
    String trainingId,
    String enrollmentId,
    String trainingTitle,
    String fee,
    String bankName,
    String bankAccountNumber,
    String bankAccountHolderName,
    String status,
    DateTime? paymentDeadline,
    File? proofImage,
    bool isSubmitting,
    bool isUploadSuccess,
    String? errorMessage,
  });
}

/// @nodoc
class __$PaymentStateCopyWithImpl<$Res>
    implements _$PaymentStateCopyWith<$Res> {
  __$PaymentStateCopyWithImpl(this._self, this._then);

  final _PaymentState _self;
  final $Res Function(_PaymentState) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainingId = null,
    Object? enrollmentId = null,
    Object? trainingTitle = null,
    Object? fee = null,
    Object? bankName = null,
    Object? bankAccountNumber = null,
    Object? bankAccountHolderName = null,
    Object? status = null,
    Object? paymentDeadline = freezed,
    Object? proofImage = freezed,
    Object? isSubmitting = null,
    Object? isUploadSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_PaymentState(
      trainingId: null == trainingId
          ? _self.trainingId
          : trainingId as String,
      enrollmentId: null == enrollmentId
          ? _self.enrollmentId
          : enrollmentId as String,
      trainingTitle: null == trainingTitle
          ? _self.trainingTitle
          : trainingTitle as String,
      fee: null == fee ? _self.fee : fee as String,
      bankName: null == bankName ? _self.bankName : bankName as String,
      bankAccountNumber: null == bankAccountNumber
          ? _self.bankAccountNumber
          : bankAccountNumber as String,
      bankAccountHolderName: null == bankAccountHolderName
          ? _self.bankAccountHolderName
          : bankAccountHolderName as String,
      status: null == status ? _self.status : status as String,
      paymentDeadline: freezed == paymentDeadline
          ? _self.paymentDeadline
          : paymentDeadline as DateTime?,
      proofImage: freezed == proofImage
          ? _self.proofImage
          : proofImage as File?,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting as bool,
      isUploadSuccess: null == isUploadSuccess
          ? _self.isUploadSuccess
          : isUploadSuccess as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage as String?,
    ));
  }
}

// dart format on
