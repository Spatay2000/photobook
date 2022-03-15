// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'json_api_clients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlaceHolderClientTearOff {
  const _$PlaceHolderClientTearOff();

  _Login login(String email, String password) {
    return _Login(
      email,
      password,
    );
  }

  _Register register(String name, String email, String password) {
    return _Register(
      name,
      email,
      password,
    );
  }

  _AddAlbum addAlbum(String title, String description) {
    return _AddAlbum(
      title,
      description,
    );
  }

  _AddFile addFile(String albumId, FormData file) {
    return _AddFile(
      albumId,
      file,
    );
  }

  _AddToDraft addToDraft(String title, String description) {
    return _AddToDraft(
      title,
      description,
    );
  }

  _AddByWriter addByWriter(String title, String description) {
    return _AddByWriter(
      title,
      description,
    );
  }

  _AddToDraftByWriter addToDraftByWriter(String title, String description) {
    return _AddToDraftByWriter(
      title,
      description,
    );
  }

  _PublishedAlbum publishedAlbum() {
    return const _PublishedAlbum();
  }
}

/// @nodoc
const $PlaceHolderClient = _$PlaceHolderClientTearOff();

/// @nodoc
mixin _$PlaceHolderClient {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String name, String email, String password)
        register,
    required TResult Function(String title, String description) addAlbum,
    required TResult Function(String albumId, FormData file) addFile,
    required TResult Function(String title, String description) addToDraft,
    required TResult Function(String title, String description) addByWriter,
    required TResult Function(String title, String description)
        addToDraftByWriter,
    required TResult Function() publishedAlbum,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_AddAlbum value) addAlbum,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddToDraft value) addToDraft,
    required TResult Function(_AddByWriter value) addByWriter,
    required TResult Function(_AddToDraftByWriter value) addToDraftByWriter,
    required TResult Function(_PublishedAlbum value) publishedAlbum,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceHolderClientCopyWith<$Res> {
  factory $PlaceHolderClientCopyWith(
          PlaceHolderClient value, $Res Function(PlaceHolderClient) then) =
      _$PlaceHolderClientCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlaceHolderClientCopyWithImpl<$Res>
    implements $PlaceHolderClientCopyWith<$Res> {
  _$PlaceHolderClientCopyWithImpl(this._value, this._then);

  final PlaceHolderClient _value;
  // ignore: unused_field
  final $Res Function(PlaceHolderClient) _then;
}

/// @nodoc
abstract class _$LoginCopyWith<$Res> {
  factory _$LoginCopyWith(_Login value, $Res Function(_Login) then) =
      __$LoginCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class __$LoginCopyWithImpl<$Res> extends _$PlaceHolderClientCopyWithImpl<$Res>
    implements _$LoginCopyWith<$Res> {
  __$LoginCopyWithImpl(_Login _value, $Res Function(_Login) _then)
      : super(_value, (v) => _then(v as _Login));

  @override
  _Login get _value => super._value as _Login;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_Login(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Login extends _Login with DiagnosticableTreeMixin {
  const _$_Login(this.email, this.password) : super._();

  @override
  final String email;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceHolderClient.login(email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaceHolderClient.login'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Login &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$LoginCopyWith<_Login> get copyWith =>
      __$LoginCopyWithImpl<_Login>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String name, String email, String password)
        register,
    required TResult Function(String title, String description) addAlbum,
    required TResult Function(String albumId, FormData file) addFile,
    required TResult Function(String title, String description) addToDraft,
    required TResult Function(String title, String description) addByWriter,
    required TResult Function(String title, String description)
        addToDraftByWriter,
    required TResult Function() publishedAlbum,
  }) {
    return login(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
  }) {
    return login?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_AddAlbum value) addAlbum,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddToDraft value) addToDraft,
    required TResult Function(_AddByWriter value) addByWriter,
    required TResult Function(_AddToDraftByWriter value) addToDraftByWriter,
    required TResult Function(_PublishedAlbum value) publishedAlbum,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login extends PlaceHolderClient {
  const factory _Login(String email, String password) = _$_Login;
  const _Login._() : super._();

  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoginCopyWith<_Login> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RegisterCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) then) =
      __$RegisterCopyWithImpl<$Res>;
  $Res call({String name, String email, String password});
}

/// @nodoc
class __$RegisterCopyWithImpl<$Res>
    extends _$PlaceHolderClientCopyWithImpl<$Res>
    implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(_Register _value, $Res Function(_Register) _then)
      : super(_value, (v) => _then(v as _Register));

  @override
  _Register get _value => super._value as _Register;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_Register(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Register extends _Register with DiagnosticableTreeMixin {
  const _$_Register(this.name, this.email, this.password) : super._();

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceHolderClient.register(name: $name, email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaceHolderClient.register'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Register &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$RegisterCopyWith<_Register> get copyWith =>
      __$RegisterCopyWithImpl<_Register>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String name, String email, String password)
        register,
    required TResult Function(String title, String description) addAlbum,
    required TResult Function(String albumId, FormData file) addFile,
    required TResult Function(String title, String description) addToDraft,
    required TResult Function(String title, String description) addByWriter,
    required TResult Function(String title, String description)
        addToDraftByWriter,
    required TResult Function() publishedAlbum,
  }) {
    return register(name, email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
  }) {
    return register?.call(name, email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(name, email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_AddAlbum value) addAlbum,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddToDraft value) addToDraft,
    required TResult Function(_AddByWriter value) addByWriter,
    required TResult Function(_AddToDraftByWriter value) addToDraftByWriter,
    required TResult Function(_PublishedAlbum value) publishedAlbum,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register extends PlaceHolderClient {
  const factory _Register(String name, String email, String password) =
      _$_Register;
  const _Register._() : super._();

  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RegisterCopyWith<_Register> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddAlbumCopyWith<$Res> {
  factory _$AddAlbumCopyWith(_AddAlbum value, $Res Function(_AddAlbum) then) =
      __$AddAlbumCopyWithImpl<$Res>;
  $Res call({String title, String description});
}

/// @nodoc
class __$AddAlbumCopyWithImpl<$Res>
    extends _$PlaceHolderClientCopyWithImpl<$Res>
    implements _$AddAlbumCopyWith<$Res> {
  __$AddAlbumCopyWithImpl(_AddAlbum _value, $Res Function(_AddAlbum) _then)
      : super(_value, (v) => _then(v as _AddAlbum));

  @override
  _AddAlbum get _value => super._value as _AddAlbum;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_AddAlbum(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddAlbum extends _AddAlbum with DiagnosticableTreeMixin {
  const _$_AddAlbum(this.title, this.description) : super._();

  @override
  final String title;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceHolderClient.addAlbum(title: $title, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaceHolderClient.addAlbum'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddAlbum &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$AddAlbumCopyWith<_AddAlbum> get copyWith =>
      __$AddAlbumCopyWithImpl<_AddAlbum>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String name, String email, String password)
        register,
    required TResult Function(String title, String description) addAlbum,
    required TResult Function(String albumId, FormData file) addFile,
    required TResult Function(String title, String description) addToDraft,
    required TResult Function(String title, String description) addByWriter,
    required TResult Function(String title, String description)
        addToDraftByWriter,
    required TResult Function() publishedAlbum,
  }) {
    return addAlbum(title, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
  }) {
    return addAlbum?.call(title, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
    required TResult orElse(),
  }) {
    if (addAlbum != null) {
      return addAlbum(title, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_AddAlbum value) addAlbum,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddToDraft value) addToDraft,
    required TResult Function(_AddByWriter value) addByWriter,
    required TResult Function(_AddToDraftByWriter value) addToDraftByWriter,
    required TResult Function(_PublishedAlbum value) publishedAlbum,
  }) {
    return addAlbum(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
  }) {
    return addAlbum?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
    required TResult orElse(),
  }) {
    if (addAlbum != null) {
      return addAlbum(this);
    }
    return orElse();
  }
}

abstract class _AddAlbum extends PlaceHolderClient {
  const factory _AddAlbum(String title, String description) = _$_AddAlbum;
  const _AddAlbum._() : super._();

  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AddAlbumCopyWith<_AddAlbum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddFileCopyWith<$Res> {
  factory _$AddFileCopyWith(_AddFile value, $Res Function(_AddFile) then) =
      __$AddFileCopyWithImpl<$Res>;
  $Res call({String albumId, FormData file});
}

/// @nodoc
class __$AddFileCopyWithImpl<$Res> extends _$PlaceHolderClientCopyWithImpl<$Res>
    implements _$AddFileCopyWith<$Res> {
  __$AddFileCopyWithImpl(_AddFile _value, $Res Function(_AddFile) _then)
      : super(_value, (v) => _then(v as _AddFile));

  @override
  _AddFile get _value => super._value as _AddFile;

  @override
  $Res call({
    Object? albumId = freezed,
    Object? file = freezed,
  }) {
    return _then(_AddFile(
      albumId == freezed
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as String,
      file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as FormData,
    ));
  }
}

/// @nodoc

class _$_AddFile extends _AddFile with DiagnosticableTreeMixin {
  const _$_AddFile(this.albumId, this.file) : super._();

  @override
  final String albumId;
  @override
  final FormData file;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceHolderClient.addFile(albumId: $albumId, file: $file)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaceHolderClient.addFile'))
      ..add(DiagnosticsProperty('albumId', albumId))
      ..add(DiagnosticsProperty('file', file));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddFile &&
            (identical(other.albumId, albumId) ||
                const DeepCollectionEquality()
                    .equals(other.albumId, albumId)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(albumId) ^
      const DeepCollectionEquality().hash(file);

  @JsonKey(ignore: true)
  @override
  _$AddFileCopyWith<_AddFile> get copyWith =>
      __$AddFileCopyWithImpl<_AddFile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String name, String email, String password)
        register,
    required TResult Function(String title, String description) addAlbum,
    required TResult Function(String albumId, FormData file) addFile,
    required TResult Function(String title, String description) addToDraft,
    required TResult Function(String title, String description) addByWriter,
    required TResult Function(String title, String description)
        addToDraftByWriter,
    required TResult Function() publishedAlbum,
  }) {
    return addFile(albumId, file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
  }) {
    return addFile?.call(albumId, file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
    required TResult orElse(),
  }) {
    if (addFile != null) {
      return addFile(albumId, file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_AddAlbum value) addAlbum,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddToDraft value) addToDraft,
    required TResult Function(_AddByWriter value) addByWriter,
    required TResult Function(_AddToDraftByWriter value) addToDraftByWriter,
    required TResult Function(_PublishedAlbum value) publishedAlbum,
  }) {
    return addFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
  }) {
    return addFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
    required TResult orElse(),
  }) {
    if (addFile != null) {
      return addFile(this);
    }
    return orElse();
  }
}

abstract class _AddFile extends PlaceHolderClient {
  const factory _AddFile(String albumId, FormData file) = _$_AddFile;
  const _AddFile._() : super._();

  String get albumId => throw _privateConstructorUsedError;
  FormData get file => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AddFileCopyWith<_AddFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddToDraftCopyWith<$Res> {
  factory _$AddToDraftCopyWith(
          _AddToDraft value, $Res Function(_AddToDraft) then) =
      __$AddToDraftCopyWithImpl<$Res>;
  $Res call({String title, String description});
}

/// @nodoc
class __$AddToDraftCopyWithImpl<$Res>
    extends _$PlaceHolderClientCopyWithImpl<$Res>
    implements _$AddToDraftCopyWith<$Res> {
  __$AddToDraftCopyWithImpl(
      _AddToDraft _value, $Res Function(_AddToDraft) _then)
      : super(_value, (v) => _then(v as _AddToDraft));

  @override
  _AddToDraft get _value => super._value as _AddToDraft;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_AddToDraft(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddToDraft extends _AddToDraft with DiagnosticableTreeMixin {
  const _$_AddToDraft(this.title, this.description) : super._();

  @override
  final String title;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceHolderClient.addToDraft(title: $title, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaceHolderClient.addToDraft'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddToDraft &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$AddToDraftCopyWith<_AddToDraft> get copyWith =>
      __$AddToDraftCopyWithImpl<_AddToDraft>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String name, String email, String password)
        register,
    required TResult Function(String title, String description) addAlbum,
    required TResult Function(String albumId, FormData file) addFile,
    required TResult Function(String title, String description) addToDraft,
    required TResult Function(String title, String description) addByWriter,
    required TResult Function(String title, String description)
        addToDraftByWriter,
    required TResult Function() publishedAlbum,
  }) {
    return addToDraft(title, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
  }) {
    return addToDraft?.call(title, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
    required TResult orElse(),
  }) {
    if (addToDraft != null) {
      return addToDraft(title, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_AddAlbum value) addAlbum,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddToDraft value) addToDraft,
    required TResult Function(_AddByWriter value) addByWriter,
    required TResult Function(_AddToDraftByWriter value) addToDraftByWriter,
    required TResult Function(_PublishedAlbum value) publishedAlbum,
  }) {
    return addToDraft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
  }) {
    return addToDraft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
    required TResult orElse(),
  }) {
    if (addToDraft != null) {
      return addToDraft(this);
    }
    return orElse();
  }
}

abstract class _AddToDraft extends PlaceHolderClient {
  const factory _AddToDraft(String title, String description) = _$_AddToDraft;
  const _AddToDraft._() : super._();

  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AddToDraftCopyWith<_AddToDraft> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddByWriterCopyWith<$Res> {
  factory _$AddByWriterCopyWith(
          _AddByWriter value, $Res Function(_AddByWriter) then) =
      __$AddByWriterCopyWithImpl<$Res>;
  $Res call({String title, String description});
}

/// @nodoc
class __$AddByWriterCopyWithImpl<$Res>
    extends _$PlaceHolderClientCopyWithImpl<$Res>
    implements _$AddByWriterCopyWith<$Res> {
  __$AddByWriterCopyWithImpl(
      _AddByWriter _value, $Res Function(_AddByWriter) _then)
      : super(_value, (v) => _then(v as _AddByWriter));

  @override
  _AddByWriter get _value => super._value as _AddByWriter;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_AddByWriter(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddByWriter extends _AddByWriter with DiagnosticableTreeMixin {
  const _$_AddByWriter(this.title, this.description) : super._();

  @override
  final String title;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceHolderClient.addByWriter(title: $title, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaceHolderClient.addByWriter'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddByWriter &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$AddByWriterCopyWith<_AddByWriter> get copyWith =>
      __$AddByWriterCopyWithImpl<_AddByWriter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String name, String email, String password)
        register,
    required TResult Function(String title, String description) addAlbum,
    required TResult Function(String albumId, FormData file) addFile,
    required TResult Function(String title, String description) addToDraft,
    required TResult Function(String title, String description) addByWriter,
    required TResult Function(String title, String description)
        addToDraftByWriter,
    required TResult Function() publishedAlbum,
  }) {
    return addByWriter(title, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
  }) {
    return addByWriter?.call(title, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
    required TResult orElse(),
  }) {
    if (addByWriter != null) {
      return addByWriter(title, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_AddAlbum value) addAlbum,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddToDraft value) addToDraft,
    required TResult Function(_AddByWriter value) addByWriter,
    required TResult Function(_AddToDraftByWriter value) addToDraftByWriter,
    required TResult Function(_PublishedAlbum value) publishedAlbum,
  }) {
    return addByWriter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
  }) {
    return addByWriter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
    required TResult orElse(),
  }) {
    if (addByWriter != null) {
      return addByWriter(this);
    }
    return orElse();
  }
}

abstract class _AddByWriter extends PlaceHolderClient {
  const factory _AddByWriter(String title, String description) = _$_AddByWriter;
  const _AddByWriter._() : super._();

  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AddByWriterCopyWith<_AddByWriter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddToDraftByWriterCopyWith<$Res> {
  factory _$AddToDraftByWriterCopyWith(
          _AddToDraftByWriter value, $Res Function(_AddToDraftByWriter) then) =
      __$AddToDraftByWriterCopyWithImpl<$Res>;
  $Res call({String title, String description});
}

/// @nodoc
class __$AddToDraftByWriterCopyWithImpl<$Res>
    extends _$PlaceHolderClientCopyWithImpl<$Res>
    implements _$AddToDraftByWriterCopyWith<$Res> {
  __$AddToDraftByWriterCopyWithImpl(
      _AddToDraftByWriter _value, $Res Function(_AddToDraftByWriter) _then)
      : super(_value, (v) => _then(v as _AddToDraftByWriter));

  @override
  _AddToDraftByWriter get _value => super._value as _AddToDraftByWriter;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_AddToDraftByWriter(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddToDraftByWriter extends _AddToDraftByWriter
    with DiagnosticableTreeMixin {
  const _$_AddToDraftByWriter(this.title, this.description) : super._();

  @override
  final String title;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceHolderClient.addToDraftByWriter(title: $title, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaceHolderClient.addToDraftByWriter'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddToDraftByWriter &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$AddToDraftByWriterCopyWith<_AddToDraftByWriter> get copyWith =>
      __$AddToDraftByWriterCopyWithImpl<_AddToDraftByWriter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String name, String email, String password)
        register,
    required TResult Function(String title, String description) addAlbum,
    required TResult Function(String albumId, FormData file) addFile,
    required TResult Function(String title, String description) addToDraft,
    required TResult Function(String title, String description) addByWriter,
    required TResult Function(String title, String description)
        addToDraftByWriter,
    required TResult Function() publishedAlbum,
  }) {
    return addToDraftByWriter(title, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
  }) {
    return addToDraftByWriter?.call(title, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
    required TResult orElse(),
  }) {
    if (addToDraftByWriter != null) {
      return addToDraftByWriter(title, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_AddAlbum value) addAlbum,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddToDraft value) addToDraft,
    required TResult Function(_AddByWriter value) addByWriter,
    required TResult Function(_AddToDraftByWriter value) addToDraftByWriter,
    required TResult Function(_PublishedAlbum value) publishedAlbum,
  }) {
    return addToDraftByWriter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
  }) {
    return addToDraftByWriter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
    required TResult orElse(),
  }) {
    if (addToDraftByWriter != null) {
      return addToDraftByWriter(this);
    }
    return orElse();
  }
}

abstract class _AddToDraftByWriter extends PlaceHolderClient {
  const factory _AddToDraftByWriter(String title, String description) =
      _$_AddToDraftByWriter;
  const _AddToDraftByWriter._() : super._();

  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AddToDraftByWriterCopyWith<_AddToDraftByWriter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PublishedAlbumCopyWith<$Res> {
  factory _$PublishedAlbumCopyWith(
          _PublishedAlbum value, $Res Function(_PublishedAlbum) then) =
      __$PublishedAlbumCopyWithImpl<$Res>;
}

/// @nodoc
class __$PublishedAlbumCopyWithImpl<$Res>
    extends _$PlaceHolderClientCopyWithImpl<$Res>
    implements _$PublishedAlbumCopyWith<$Res> {
  __$PublishedAlbumCopyWithImpl(
      _PublishedAlbum _value, $Res Function(_PublishedAlbum) _then)
      : super(_value, (v) => _then(v as _PublishedAlbum));

  @override
  _PublishedAlbum get _value => super._value as _PublishedAlbum;
}

/// @nodoc

class _$_PublishedAlbum extends _PublishedAlbum with DiagnosticableTreeMixin {
  const _$_PublishedAlbum() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceHolderClient.publishedAlbum()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaceHolderClient.publishedAlbum'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PublishedAlbum);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function(String name, String email, String password)
        register,
    required TResult Function(String title, String description) addAlbum,
    required TResult Function(String albumId, FormData file) addFile,
    required TResult Function(String title, String description) addToDraft,
    required TResult Function(String title, String description) addByWriter,
    required TResult Function(String title, String description)
        addToDraftByWriter,
    required TResult Function() publishedAlbum,
  }) {
    return publishedAlbum();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
  }) {
    return publishedAlbum?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function(String name, String email, String password)? register,
    TResult Function(String title, String description)? addAlbum,
    TResult Function(String albumId, FormData file)? addFile,
    TResult Function(String title, String description)? addToDraft,
    TResult Function(String title, String description)? addByWriter,
    TResult Function(String title, String description)? addToDraftByWriter,
    TResult Function()? publishedAlbum,
    required TResult orElse(),
  }) {
    if (publishedAlbum != null) {
      return publishedAlbum();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Register value) register,
    required TResult Function(_AddAlbum value) addAlbum,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddToDraft value) addToDraft,
    required TResult Function(_AddByWriter value) addByWriter,
    required TResult Function(_AddToDraftByWriter value) addToDraftByWriter,
    required TResult Function(_PublishedAlbum value) publishedAlbum,
  }) {
    return publishedAlbum(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
  }) {
    return publishedAlbum?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Register value)? register,
    TResult Function(_AddAlbum value)? addAlbum,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddToDraft value)? addToDraft,
    TResult Function(_AddByWriter value)? addByWriter,
    TResult Function(_AddToDraftByWriter value)? addToDraftByWriter,
    TResult Function(_PublishedAlbum value)? publishedAlbum,
    required TResult orElse(),
  }) {
    if (publishedAlbum != null) {
      return publishedAlbum(this);
    }
    return orElse();
  }
}

abstract class _PublishedAlbum extends PlaceHolderClient {
  const factory _PublishedAlbum() = _$_PublishedAlbum;
  const _PublishedAlbum._() : super._();
}
