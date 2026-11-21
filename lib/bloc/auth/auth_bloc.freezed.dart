// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent()';
  }
}

/// @nodoc
class $AuthEventCopyWith<$Res> {
  $AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}

/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthLogin value)? loginRequested,
    TResult Function(_AuthRegister value)? registerRequested,
    TResult Function(_CheckLoginStatus value)? checkLoginStatus,
    TResult Function(_LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthLogin() when loginRequested != null:
        return loginRequested(_that);
      case _AuthRegister() when registerRequested != null:
        return registerRequested(_that);
      case _CheckLoginStatus() when checkLoginStatus != null:
        return checkLoginStatus(_that);
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthLogin value) loginRequested,
    required TResult Function(_AuthRegister value) registerRequested,
    required TResult Function(_CheckLoginStatus value) checkLoginStatus,
    required TResult Function(_LogoutRequested value) logoutRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _AuthLogin():
        return loginRequested(_that);
      case _AuthRegister():
        return registerRequested(_that);
      case _CheckLoginStatus():
        return checkLoginStatus(_that);
      case _LogoutRequested():
        return logoutRequested(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthLogin value)? loginRequested,
    TResult? Function(_AuthRegister value)? registerRequested,
    TResult? Function(_CheckLoginStatus value)? checkLoginStatus,
    TResult? Function(_LogoutRequested value)? logoutRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _AuthLogin() when loginRequested != null:
        return loginRequested(_that);
      case _AuthRegister() when registerRequested != null:
        return registerRequested(_that);
      case _CheckLoginStatus() when checkLoginStatus != null:
        return checkLoginStatus(_that);
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? loginRequested,
    TResult Function(String name, String email, String password,
            String passwordConfirmation)?
        registerRequested,
    TResult Function()? checkLoginStatus,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthLogin() when loginRequested != null:
        return loginRequested(_that.email, _that.password);
      case _AuthRegister() when registerRequested != null:
        return registerRequested(_that.name, _that.email, _that.password,
            _that.passwordConfirmation);
      case _CheckLoginStatus() when checkLoginStatus != null:
        return checkLoginStatus();
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) loginRequested,
    required TResult Function(String name, String email, String password,
            String passwordConfirmation)
        registerRequested,
    required TResult Function() checkLoginStatus,
    required TResult Function() logoutRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _AuthLogin():
        return loginRequested(_that.email, _that.password);
      case _AuthRegister():
        return registerRequested(_that.name, _that.email, _that.password,
            _that.passwordConfirmation);
      case _CheckLoginStatus():
        return checkLoginStatus();
      case _LogoutRequested():
        return logoutRequested();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? loginRequested,
    TResult? Function(String name, String email, String password,
            String passwordConfirmation)?
        registerRequested,
    TResult? Function()? checkLoginStatus,
    TResult? Function()? logoutRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _AuthLogin() when loginRequested != null:
        return loginRequested(_that.email, _that.password);
      case _AuthRegister() when registerRequested != null:
        return registerRequested(_that.name, _that.email, _that.password,
            _that.passwordConfirmation);
      case _CheckLoginStatus() when checkLoginStatus != null:
        return checkLoginStatus();
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AuthLogin implements AuthEvent {
  const _AuthLogin({required this.email, required this.password});

  final String email;
  final String password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthLoginCopyWith<_AuthLogin> get copyWith =>
      __$AuthLoginCopyWithImpl<_AuthLogin>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthLogin &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, email, password);
  }

  @override
  String toString() {
    return 'AuthEvent.loginRequested(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$AuthLoginCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$AuthLoginCopyWith(
          _AuthLogin value, $Res Function(_AuthLogin) _then) =
      __$AuthLoginCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$AuthLoginCopyWithImpl<$Res> implements _$AuthLoginCopyWith<$Res> {
  __$AuthLoginCopyWithImpl(this._self, this._then);

  final _AuthLogin _self;
  final $Res Function(_AuthLogin) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_AuthLogin(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _AuthRegister implements AuthEvent {
  const _AuthRegister(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirmation});

  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthRegisterCopyWith<_AuthRegister> get copyWith =>
      __$AuthRegisterCopyWithImpl<_AuthRegister>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthRegister &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, name, email, password, passwordConfirmation);
  }

  @override
  String toString() {
    return 'AuthEvent.registerRequested(name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation)';
  }
}

/// @nodoc
abstract mixin class _$AuthRegisterCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$AuthRegisterCopyWith(
          _AuthRegister value, $Res Function(_AuthRegister) _then) =
      __$AuthRegisterCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String email,
      String password,
      String passwordConfirmation});
}

/// @nodoc
class __$AuthRegisterCopyWithImpl<$Res>
    implements _$AuthRegisterCopyWith<$Res> {
  __$AuthRegisterCopyWithImpl(this._self, this._then);

  final _AuthRegister _self;
  final $Res Function(_AuthRegister) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
  }) {
    return _then(_AuthRegister(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _self.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _CheckLoginStatus implements AuthEvent {
  const _CheckLoginStatus();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CheckLoginStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.checkLoginStatus()';
  }
}

/// @nodoc

class _LogoutRequested implements AuthEvent {
  const _LogoutRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LogoutRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.logoutRequested()';
  }
}

/// @nodoc
mixin _$AuthState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState()';
  }
}

/// @nodoc
class $AuthStateCopyWith<$Res> {
  $AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}

/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(_RegisterSuccess value)? registerSuccess,
    TResult Function(Failure value)? failure,
    TResult Function(RegisterFailure value)? registerFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial(_that);
      case Loading() when loading != null:
        return loading(_that);
      case Authenticated() when authenticated != null:
        return authenticated(_that);
      case Unauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case _RegisterSuccess() when registerSuccess != null:
        return registerSuccess(_that);
      case Failure() when failure != null:
        return failure(_that);
      case RegisterFailure() when registerFailure != null:
        return registerFailure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(_RegisterSuccess value) registerSuccess,
    required TResult Function(Failure value) failure,
    required TResult Function(RegisterFailure value) registerFailure,
  }) {
    final _that = this;
    switch (_that) {
      case Initial():
        return initial(_that);
      case Loading():
        return loading(_that);
      case Authenticated():
        return authenticated(_that);
      case Unauthenticated():
        return unauthenticated(_that);
      case _RegisterSuccess():
        return registerSuccess(_that);
      case Failure():
        return failure(_that);
      case RegisterFailure():
        return registerFailure(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(_RegisterSuccess value)? registerSuccess,
    TResult? Function(Failure value)? failure,
    TResult? Function(RegisterFailure value)? registerFailure,
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial(_that);
      case Loading() when loading != null:
        return loading(_that);
      case Authenticated() when authenticated != null:
        return authenticated(_that);
      case Unauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case _RegisterSuccess() when registerSuccess != null:
        return registerSuccess(_that);
      case Failure() when failure != null:
        return failure(_that);
      case RegisterFailure() when registerFailure != null:
        return registerFailure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? registerSuccess,
    TResult Function(String error)? failure,
    TResult Function(Map<String, dynamic> error)? registerFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial();
      case Loading() when loading != null:
        return loading();
      case Authenticated() when authenticated != null:
        return authenticated();
      case Unauthenticated() when unauthenticated != null:
        return unauthenticated();
      case _RegisterSuccess() when registerSuccess != null:
        return registerSuccess(_that.message);
      case Failure() when failure != null:
        return failure(_that.error);
      case RegisterFailure() when registerFailure != null:
        return registerFailure(_that.error);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) registerSuccess,
    required TResult Function(String error) failure,
    required TResult Function(Map<String, dynamic> error) registerFailure,
  }) {
    final _that = this;
    switch (_that) {
      case Initial():
        return initial();
      case Loading():
        return loading();
      case Authenticated():
        return authenticated();
      case Unauthenticated():
        return unauthenticated();
      case _RegisterSuccess():
        return registerSuccess(_that.message);
      case Failure():
        return failure(_that.error);
      case RegisterFailure():
        return registerFailure(_that.error);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? registerSuccess,
    TResult? Function(String error)? failure,
    TResult? Function(Map<String, dynamic> error)? registerFailure,
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial();
      case Loading() when loading != null:
        return loading();
      case Authenticated() when authenticated != null:
        return authenticated();
      case Unauthenticated() when unauthenticated != null:
        return unauthenticated();
      case _RegisterSuccess() when registerSuccess != null:
        return registerSuccess(_that.message);
      case Failure() when failure != null:
        return failure(_that.error);
      case RegisterFailure() when registerFailure != null:
        return registerFailure(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class Initial implements AuthState {
  const Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.initial()';
  }
}

/// @nodoc

class Loading implements AuthState {
  const Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.loading()';
  }
}

/// @nodoc

class Authenticated implements AuthState {
  const Authenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Authenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }
}

/// @nodoc

class Unauthenticated implements AuthState {
  const Unauthenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }
}

/// @nodoc

class _RegisterSuccess implements AuthState {
  const _RegisterSuccess({required this.message});

  final String message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterSuccessCopyWith<_RegisterSuccess> get copyWith =>
      __$RegisterSuccessCopyWithImpl<_RegisterSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterSuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, message);
  }

  @override
  String toString() {
    return 'AuthState.registerSuccess(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$RegisterSuccessCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$RegisterSuccessCopyWith(
          _RegisterSuccess value, $Res Function(_RegisterSuccess) _then) =
      __$RegisterSuccessCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$RegisterSuccessCopyWithImpl<$Res>
    implements _$RegisterSuccessCopyWith<$Res> {
  __$RegisterSuccessCopyWithImpl(this._self, this._then);

  final _RegisterSuccess _self;
  final $Res Function(_RegisterSuccess) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_RegisterSuccess(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class Failure implements AuthState {
  const Failure({required this.error});

  final String error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, error);
  }

  @override
  String toString() {
    return 'AuthState.failure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) =
      _$FailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(Failure(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class RegisterFailure implements AuthState {
  const RegisterFailure({required Map<String, dynamic> error}) : _error = error;

  final Map<String, dynamic> _error;
  Map<String, dynamic> get error {
    if (_error is EqualUnmodifiableMapView) return _error;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_error);
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterFailureCopyWith<RegisterFailure> get copyWith =>
      _$RegisterFailureCopyWithImpl<RegisterFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterFailure &&
            const DeepCollectionEquality().equals(other.error, _error));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, const DeepCollectionEquality().hash(_error));
  }

  @override
  String toString() {
    return 'AuthState.registerFailure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $RegisterFailureCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $RegisterFailureCopyWith(
          RegisterFailure value, $Res Function(RegisterFailure) _then) =
      _$RegisterFailureCopyWithImpl;
  @useResult
  $Res call({Map<String, dynamic> error});
}

/// @nodoc
class _$RegisterFailureCopyWithImpl<$Res>
    implements $RegisterFailureCopyWith<$Res> {
  _$RegisterFailureCopyWithImpl(this._self, this._then);

  final RegisterFailure _self;
  final $Res Function(RegisterFailure) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(RegisterFailure(
      error: null == error
          ? _self._error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

// dart format on
