// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// ignore_for_file: type=lint
class $BooksFolderInfoTableTable extends BooksFolderInfoTable
    with TableInfo<$BooksFolderInfoTableTable, BooksFolderInfoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksFolderInfoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _books_folder_idMeta =
      const VerificationMeta('books_folder_id');
  @override
  late final GeneratedColumn<int> books_folder_id = GeneratedColumn<int>(
      'books_folder_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _books_folder_nameMeta =
      const VerificationMeta('books_folder_name');
  @override
  late final GeneratedColumn<String> books_folder_name =
      GeneratedColumn<String>('books_folder_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _font_styleMeta =
      const VerificationMeta('font_style');
  @override
  late final GeneratedColumn<String> font_style = GeneratedColumn<String>(
      'font_style', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _font_colorMeta =
      const VerificationMeta('font_color');
  @override
  late final GeneratedColumn<String> font_color = GeneratedColumn<String>(
      'font_color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [books_folder_id, books_folder_name, font_style, font_color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books_folder_info_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BooksFolderInfoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('books_folder_id')) {
      context.handle(
          _books_folder_idMeta,
          books_folder_id.isAcceptableOrUnknown(
              data['books_folder_id']!, _books_folder_idMeta));
    }
    if (data.containsKey('books_folder_name')) {
      context.handle(
          _books_folder_nameMeta,
          books_folder_name.isAcceptableOrUnknown(
              data['books_folder_name']!, _books_folder_nameMeta));
    } else if (isInserting) {
      context.missing(_books_folder_nameMeta);
    }
    if (data.containsKey('font_style')) {
      context.handle(
          _font_styleMeta,
          font_style.isAcceptableOrUnknown(
              data['font_style']!, _font_styleMeta));
    }
    if (data.containsKey('font_color')) {
      context.handle(
          _font_colorMeta,
          font_color.isAcceptableOrUnknown(
              data['font_color']!, _font_colorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {books_folder_id};
  @override
  BooksFolderInfoTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BooksFolderInfoTableData(
      books_folder_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}books_folder_id'])!,
      books_folder_name: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}books_folder_name'])!,
      font_style: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_style']),
      font_color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_color']),
    );
  }

  @override
  $BooksFolderInfoTableTable createAlias(String alias) {
    return $BooksFolderInfoTableTable(attachedDatabase, alias);
  }
}

class BooksFolderInfoTableData extends DataClass
    implements Insertable<BooksFolderInfoTableData> {
  final int books_folder_id;
  final String books_folder_name;
  final String? font_style;
  final String? font_color;
  const BooksFolderInfoTableData(
      {required this.books_folder_id,
      required this.books_folder_name,
      this.font_style,
      this.font_color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['books_folder_id'] = Variable<int>(books_folder_id);
    map['books_folder_name'] = Variable<String>(books_folder_name);
    if (!nullToAbsent || font_style != null) {
      map['font_style'] = Variable<String>(font_style);
    }
    if (!nullToAbsent || font_color != null) {
      map['font_color'] = Variable<String>(font_color);
    }
    return map;
  }

  BooksFolderInfoTableCompanion toCompanion(bool nullToAbsent) {
    return BooksFolderInfoTableCompanion(
      books_folder_id: Value(books_folder_id),
      books_folder_name: Value(books_folder_name),
      font_style: font_style == null && nullToAbsent
          ? const Value.absent()
          : Value(font_style),
      font_color: font_color == null && nullToAbsent
          ? const Value.absent()
          : Value(font_color),
    );
  }

  factory BooksFolderInfoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BooksFolderInfoTableData(
      books_folder_id: serializer.fromJson<int>(json['books_folder_id']),
      books_folder_name: serializer.fromJson<String>(json['books_folder_name']),
      font_style: serializer.fromJson<String?>(json['font_style']),
      font_color: serializer.fromJson<String?>(json['font_color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'books_folder_id': serializer.toJson<int>(books_folder_id),
      'books_folder_name': serializer.toJson<String>(books_folder_name),
      'font_style': serializer.toJson<String?>(font_style),
      'font_color': serializer.toJson<String?>(font_color),
    };
  }

  BooksFolderInfoTableData copyWith(
          {int? books_folder_id,
          String? books_folder_name,
          Value<String?> font_style = const Value.absent(),
          Value<String?> font_color = const Value.absent()}) =>
      BooksFolderInfoTableData(
        books_folder_id: books_folder_id ?? this.books_folder_id,
        books_folder_name: books_folder_name ?? this.books_folder_name,
        font_style: font_style.present ? font_style.value : this.font_style,
        font_color: font_color.present ? font_color.value : this.font_color,
      );
  BooksFolderInfoTableData copyWithCompanion(
      BooksFolderInfoTableCompanion data) {
    return BooksFolderInfoTableData(
      books_folder_id: data.books_folder_id.present
          ? data.books_folder_id.value
          : this.books_folder_id,
      books_folder_name: data.books_folder_name.present
          ? data.books_folder_name.value
          : this.books_folder_name,
      font_style:
          data.font_style.present ? data.font_style.value : this.font_style,
      font_color:
          data.font_color.present ? data.font_color.value : this.font_color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BooksFolderInfoTableData(')
          ..write('books_folder_id: $books_folder_id, ')
          ..write('books_folder_name: $books_folder_name, ')
          ..write('font_style: $font_style, ')
          ..write('font_color: $font_color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(books_folder_id, books_folder_name, font_style, font_color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BooksFolderInfoTableData &&
          other.books_folder_id == this.books_folder_id &&
          other.books_folder_name == this.books_folder_name &&
          other.font_style == this.font_style &&
          other.font_color == this.font_color);
}

class BooksFolderInfoTableCompanion
    extends UpdateCompanion<BooksFolderInfoTableData> {
  final Value<int> books_folder_id;
  final Value<String> books_folder_name;
  final Value<String?> font_style;
  final Value<String?> font_color;
  const BooksFolderInfoTableCompanion({
    this.books_folder_id = const Value.absent(),
    this.books_folder_name = const Value.absent(),
    this.font_style = const Value.absent(),
    this.font_color = const Value.absent(),
  });
  BooksFolderInfoTableCompanion.insert({
    this.books_folder_id = const Value.absent(),
    required String books_folder_name,
    this.font_style = const Value.absent(),
    this.font_color = const Value.absent(),
  }) : books_folder_name = Value(books_folder_name);
  static Insertable<BooksFolderInfoTableData> custom({
    Expression<int>? books_folder_id,
    Expression<String>? books_folder_name,
    Expression<String>? font_style,
    Expression<String>? font_color,
  }) {
    return RawValuesInsertable({
      if (books_folder_id != null) 'books_folder_id': books_folder_id,
      if (books_folder_name != null) 'books_folder_name': books_folder_name,
      if (font_style != null) 'font_style': font_style,
      if (font_color != null) 'font_color': font_color,
    });
  }

  BooksFolderInfoTableCompanion copyWith(
      {Value<int>? books_folder_id,
      Value<String>? books_folder_name,
      Value<String?>? font_style,
      Value<String?>? font_color}) {
    return BooksFolderInfoTableCompanion(
      books_folder_id: books_folder_id ?? this.books_folder_id,
      books_folder_name: books_folder_name ?? this.books_folder_name,
      font_style: font_style ?? this.font_style,
      font_color: font_color ?? this.font_color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (books_folder_id.present) {
      map['books_folder_id'] = Variable<int>(books_folder_id.value);
    }
    if (books_folder_name.present) {
      map['books_folder_name'] = Variable<String>(books_folder_name.value);
    }
    if (font_style.present) {
      map['font_style'] = Variable<String>(font_style.value);
    }
    if (font_color.present) {
      map['font_color'] = Variable<String>(font_color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksFolderInfoTableCompanion(')
          ..write('books_folder_id: $books_folder_id, ')
          ..write('books_folder_name: $books_folder_name, ')
          ..write('font_style: $font_style, ')
          ..write('font_color: $font_color')
          ..write(')'))
        .toString();
  }
}

class $AuthorsInfoTableTable extends AuthorsInfoTable
    with TableInfo<$AuthorsInfoTableTable, AuthorsInfoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthorsInfoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _author_idMeta =
      const VerificationMeta('author_id');
  @override
  late final GeneratedColumn<int> author_id = GeneratedColumn<int>(
      'author_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _author_fullnameMeta =
      const VerificationMeta('author_fullname');
  @override
  late final GeneratedColumn<String> author_fullname = GeneratedColumn<String>(
      'author_fullname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [author_id, author_fullname];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'authors_info_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AuthorsInfoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('author_id')) {
      context.handle(_author_idMeta,
          author_id.isAcceptableOrUnknown(data['author_id']!, _author_idMeta));
    }
    if (data.containsKey('author_fullname')) {
      context.handle(
          _author_fullnameMeta,
          author_fullname.isAcceptableOrUnknown(
              data['author_fullname']!, _author_fullnameMeta));
    } else if (isInserting) {
      context.missing(_author_fullnameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {author_id};
  @override
  AuthorsInfoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthorsInfoTableData(
      author_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}author_id'])!,
      author_fullname: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}author_fullname'])!,
    );
  }

  @override
  $AuthorsInfoTableTable createAlias(String alias) {
    return $AuthorsInfoTableTable(attachedDatabase, alias);
  }
}

class AuthorsInfoTableData extends DataClass
    implements Insertable<AuthorsInfoTableData> {
  final int author_id;
  final String author_fullname;
  const AuthorsInfoTableData(
      {required this.author_id, required this.author_fullname});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['author_id'] = Variable<int>(author_id);
    map['author_fullname'] = Variable<String>(author_fullname);
    return map;
  }

  AuthorsInfoTableCompanion toCompanion(bool nullToAbsent) {
    return AuthorsInfoTableCompanion(
      author_id: Value(author_id),
      author_fullname: Value(author_fullname),
    );
  }

  factory AuthorsInfoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthorsInfoTableData(
      author_id: serializer.fromJson<int>(json['author_id']),
      author_fullname: serializer.fromJson<String>(json['author_fullname']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'author_id': serializer.toJson<int>(author_id),
      'author_fullname': serializer.toJson<String>(author_fullname),
    };
  }

  AuthorsInfoTableData copyWith({int? author_id, String? author_fullname}) =>
      AuthorsInfoTableData(
        author_id: author_id ?? this.author_id,
        author_fullname: author_fullname ?? this.author_fullname,
      );
  AuthorsInfoTableData copyWithCompanion(AuthorsInfoTableCompanion data) {
    return AuthorsInfoTableData(
      author_id: data.author_id.present ? data.author_id.value : this.author_id,
      author_fullname: data.author_fullname.present
          ? data.author_fullname.value
          : this.author_fullname,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthorsInfoTableData(')
          ..write('author_id: $author_id, ')
          ..write('author_fullname: $author_fullname')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(author_id, author_fullname);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthorsInfoTableData &&
          other.author_id == this.author_id &&
          other.author_fullname == this.author_fullname);
}

class AuthorsInfoTableCompanion extends UpdateCompanion<AuthorsInfoTableData> {
  final Value<int> author_id;
  final Value<String> author_fullname;
  const AuthorsInfoTableCompanion({
    this.author_id = const Value.absent(),
    this.author_fullname = const Value.absent(),
  });
  AuthorsInfoTableCompanion.insert({
    this.author_id = const Value.absent(),
    required String author_fullname,
  }) : author_fullname = Value(author_fullname);
  static Insertable<AuthorsInfoTableData> custom({
    Expression<int>? author_id,
    Expression<String>? author_fullname,
  }) {
    return RawValuesInsertable({
      if (author_id != null) 'author_id': author_id,
      if (author_fullname != null) 'author_fullname': author_fullname,
    });
  }

  AuthorsInfoTableCompanion copyWith(
      {Value<int>? author_id, Value<String>? author_fullname}) {
    return AuthorsInfoTableCompanion(
      author_id: author_id ?? this.author_id,
      author_fullname: author_fullname ?? this.author_fullname,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (author_id.present) {
      map['author_id'] = Variable<int>(author_id.value);
    }
    if (author_fullname.present) {
      map['author_fullname'] = Variable<String>(author_fullname.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthorsInfoTableCompanion(')
          ..write('author_id: $author_id, ')
          ..write('author_fullname: $author_fullname')
          ..write(')'))
        .toString();
  }
}

class $GenresInfoTableTable extends GenresInfoTable
    with TableInfo<$GenresInfoTableTable, GenresInfoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenresInfoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _genre_idMeta =
      const VerificationMeta('genre_id');
  @override
  late final GeneratedColumn<int> genre_id = GeneratedColumn<int>(
      'genre_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _genre_nameMeta =
      const VerificationMeta('genre_name');
  @override
  late final GeneratedColumn<String> genre_name = GeneratedColumn<String>(
      'genre_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _built_inMeta =
      const VerificationMeta('built_in');
  @override
  late final GeneratedColumn<bool> built_in = GeneratedColumn<bool>(
      'built_in', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("built_in" IN (0, 1))'),
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [genre_id, genre_name, built_in];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'genres_info_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<GenresInfoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('genre_id')) {
      context.handle(_genre_idMeta,
          genre_id.isAcceptableOrUnknown(data['genre_id']!, _genre_idMeta));
    }
    if (data.containsKey('genre_name')) {
      context.handle(
          _genre_nameMeta,
          genre_name.isAcceptableOrUnknown(
              data['genre_name']!, _genre_nameMeta));
    } else if (isInserting) {
      context.missing(_genre_nameMeta);
    }
    if (data.containsKey('built_in')) {
      context.handle(_built_inMeta,
          built_in.isAcceptableOrUnknown(data['built_in']!, _built_inMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {genre_id};
  @override
  GenresInfoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GenresInfoTableData(
      genre_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}genre_id'])!,
      genre_name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genre_name'])!,
      built_in: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}built_in'])!,
    );
  }

  @override
  $GenresInfoTableTable createAlias(String alias) {
    return $GenresInfoTableTable(attachedDatabase, alias);
  }
}

class GenresInfoTableData extends DataClass
    implements Insertable<GenresInfoTableData> {
  final int genre_id;
  final String genre_name;
  final bool built_in;
  const GenresInfoTableData(
      {required this.genre_id,
      required this.genre_name,
      required this.built_in});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['genre_id'] = Variable<int>(genre_id);
    map['genre_name'] = Variable<String>(genre_name);
    map['built_in'] = Variable<bool>(built_in);
    return map;
  }

  GenresInfoTableCompanion toCompanion(bool nullToAbsent) {
    return GenresInfoTableCompanion(
      genre_id: Value(genre_id),
      genre_name: Value(genre_name),
      built_in: Value(built_in),
    );
  }

  factory GenresInfoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GenresInfoTableData(
      genre_id: serializer.fromJson<int>(json['genre_id']),
      genre_name: serializer.fromJson<String>(json['genre_name']),
      built_in: serializer.fromJson<bool>(json['built_in']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'genre_id': serializer.toJson<int>(genre_id),
      'genre_name': serializer.toJson<String>(genre_name),
      'built_in': serializer.toJson<bool>(built_in),
    };
  }

  GenresInfoTableData copyWith(
          {int? genre_id, String? genre_name, bool? built_in}) =>
      GenresInfoTableData(
        genre_id: genre_id ?? this.genre_id,
        genre_name: genre_name ?? this.genre_name,
        built_in: built_in ?? this.built_in,
      );
  GenresInfoTableData copyWithCompanion(GenresInfoTableCompanion data) {
    return GenresInfoTableData(
      genre_id: data.genre_id.present ? data.genre_id.value : this.genre_id,
      genre_name:
          data.genre_name.present ? data.genre_name.value : this.genre_name,
      built_in: data.built_in.present ? data.built_in.value : this.built_in,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GenresInfoTableData(')
          ..write('genre_id: $genre_id, ')
          ..write('genre_name: $genre_name, ')
          ..write('built_in: $built_in')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(genre_id, genre_name, built_in);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GenresInfoTableData &&
          other.genre_id == this.genre_id &&
          other.genre_name == this.genre_name &&
          other.built_in == this.built_in);
}

class GenresInfoTableCompanion extends UpdateCompanion<GenresInfoTableData> {
  final Value<int> genre_id;
  final Value<String> genre_name;
  final Value<bool> built_in;
  const GenresInfoTableCompanion({
    this.genre_id = const Value.absent(),
    this.genre_name = const Value.absent(),
    this.built_in = const Value.absent(),
  });
  GenresInfoTableCompanion.insert({
    this.genre_id = const Value.absent(),
    required String genre_name,
    this.built_in = const Value.absent(),
  }) : genre_name = Value(genre_name);
  static Insertable<GenresInfoTableData> custom({
    Expression<int>? genre_id,
    Expression<String>? genre_name,
    Expression<bool>? built_in,
  }) {
    return RawValuesInsertable({
      if (genre_id != null) 'genre_id': genre_id,
      if (genre_name != null) 'genre_name': genre_name,
      if (built_in != null) 'built_in': built_in,
    });
  }

  GenresInfoTableCompanion copyWith(
      {Value<int>? genre_id,
      Value<String>? genre_name,
      Value<bool>? built_in}) {
    return GenresInfoTableCompanion(
      genre_id: genre_id ?? this.genre_id,
      genre_name: genre_name ?? this.genre_name,
      built_in: built_in ?? this.built_in,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (genre_id.present) {
      map['genre_id'] = Variable<int>(genre_id.value);
    }
    if (genre_name.present) {
      map['genre_name'] = Variable<String>(genre_name.value);
    }
    if (built_in.present) {
      map['built_in'] = Variable<bool>(built_in.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenresInfoTableCompanion(')
          ..write('genre_id: $genre_id, ')
          ..write('genre_name: $genre_name, ')
          ..write('built_in: $built_in')
          ..write(')'))
        .toString();
  }
}

class $BookInfoTableTable extends BookInfoTable
    with TableInfo<$BookInfoTableTable, BookInfoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookInfoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _book_idMeta =
      const VerificationMeta('book_id');
  @override
  late final GeneratedColumn<int> book_id = GeneratedColumn<int>(
      'book_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _books_folder_idMeta =
      const VerificationMeta('books_folder_id');
  @override
  late final GeneratedColumn<int> books_folder_id = GeneratedColumn<int>(
      'books_folder_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES books_folder_info_table (books_folder_id)'),
      defaultValue: Constant(0));
  static const VerificationMeta _book_nameMeta =
      const VerificationMeta('book_name');
  @override
  late final GeneratedColumn<String> book_name = GeneratedColumn<String>(
      'book_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _image_pathMeta =
      const VerificationMeta('image_path');
  @override
  late final GeneratedColumn<String> image_path = GeneratedColumn<String>(
      'image_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _image_source_typeMeta =
      const VerificationMeta('image_source_type');
  @override
  late final GeneratedColumn<bool> image_source_type = GeneratedColumn<bool>(
      'image_source_type', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("image_source_type" IN (0, 1))'));
  static const VerificationMeta _read_pagesMeta =
      const VerificationMeta('read_pages');
  @override
  late final GeneratedColumn<int> read_pages = GeneratedColumn<int>(
      'read_pages', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _number_of_pagesMeta =
      const VerificationMeta('number_of_pages');
  @override
  late final GeneratedColumn<int> number_of_pages = GeneratedColumn<int>(
      'number_of_pages', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<bool> status = GeneratedColumn<bool>(
      'status', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("status" IN (0, 1))'));
  static const VerificationMeta _gradeMeta = const VerificationMeta('grade');
  @override
  late final GeneratedColumn<int> grade = GeneratedColumn<int>(
      'grade', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _author_idMeta =
      const VerificationMeta('author_id');
  @override
  late final GeneratedColumn<int> author_id = GeneratedColumn<int>(
      'author_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES authors_info_table (author_id)'));
  static const VerificationMeta _genre_idMeta =
      const VerificationMeta('genre_id');
  @override
  late final GeneratedColumn<int> genre_id = GeneratedColumn<int>(
      'genre_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES genres_info_table (genre_id)'));
  @override
  List<GeneratedColumn> get $columns => [
        book_id,
        books_folder_id,
        book_name,
        image_path,
        image_source_type,
        read_pages,
        number_of_pages,
        status,
        grade,
        author_id,
        genre_id
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'book_info_table';
  @override
  VerificationContext validateIntegrity(Insertable<BookInfoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('book_id')) {
      context.handle(_book_idMeta,
          book_id.isAcceptableOrUnknown(data['book_id']!, _book_idMeta));
    }
    if (data.containsKey('books_folder_id')) {
      context.handle(
          _books_folder_idMeta,
          books_folder_id.isAcceptableOrUnknown(
              data['books_folder_id']!, _books_folder_idMeta));
    }
    if (data.containsKey('book_name')) {
      context.handle(_book_nameMeta,
          book_name.isAcceptableOrUnknown(data['book_name']!, _book_nameMeta));
    } else if (isInserting) {
      context.missing(_book_nameMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
          _image_pathMeta,
          image_path.isAcceptableOrUnknown(
              data['image_path']!, _image_pathMeta));
    } else if (isInserting) {
      context.missing(_image_pathMeta);
    }
    if (data.containsKey('image_source_type')) {
      context.handle(
          _image_source_typeMeta,
          image_source_type.isAcceptableOrUnknown(
              data['image_source_type']!, _image_source_typeMeta));
    } else if (isInserting) {
      context.missing(_image_source_typeMeta);
    }
    if (data.containsKey('read_pages')) {
      context.handle(
          _read_pagesMeta,
          read_pages.isAcceptableOrUnknown(
              data['read_pages']!, _read_pagesMeta));
    } else if (isInserting) {
      context.missing(_read_pagesMeta);
    }
    if (data.containsKey('number_of_pages')) {
      context.handle(
          _number_of_pagesMeta,
          number_of_pages.isAcceptableOrUnknown(
              data['number_of_pages']!, _number_of_pagesMeta));
    } else if (isInserting) {
      context.missing(_number_of_pagesMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('grade')) {
      context.handle(
          _gradeMeta, grade.isAcceptableOrUnknown(data['grade']!, _gradeMeta));
    } else if (isInserting) {
      context.missing(_gradeMeta);
    }
    if (data.containsKey('author_id')) {
      context.handle(_author_idMeta,
          author_id.isAcceptableOrUnknown(data['author_id']!, _author_idMeta));
    } else if (isInserting) {
      context.missing(_author_idMeta);
    }
    if (data.containsKey('genre_id')) {
      context.handle(_genre_idMeta,
          genre_id.isAcceptableOrUnknown(data['genre_id']!, _genre_idMeta));
    } else if (isInserting) {
      context.missing(_genre_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {book_id};
  @override
  BookInfoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookInfoTableData(
      book_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}book_id'])!,
      books_folder_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}books_folder_id'])!,
      book_name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}book_name'])!,
      image_path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path'])!,
      image_source_type: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}image_source_type'])!,
      read_pages: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}read_pages'])!,
      number_of_pages: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number_of_pages'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}status'])!,
      grade: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grade'])!,
      author_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}author_id'])!,
      genre_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}genre_id'])!,
    );
  }

  @override
  $BookInfoTableTable createAlias(String alias) {
    return $BookInfoTableTable(attachedDatabase, alias);
  }
}

class BookInfoTableData extends DataClass
    implements Insertable<BookInfoTableData> {
  final int book_id;
  final int books_folder_id;
  final String book_name;
  final String image_path;
  final bool image_source_type;
  final int read_pages;
  final int number_of_pages;
  final bool status;
  final int grade;
  final int author_id;
  final int genre_id;
  const BookInfoTableData(
      {required this.book_id,
      required this.books_folder_id,
      required this.book_name,
      required this.image_path,
      required this.image_source_type,
      required this.read_pages,
      required this.number_of_pages,
      required this.status,
      required this.grade,
      required this.author_id,
      required this.genre_id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['book_id'] = Variable<int>(book_id);
    map['books_folder_id'] = Variable<int>(books_folder_id);
    map['book_name'] = Variable<String>(book_name);
    map['image_path'] = Variable<String>(image_path);
    map['image_source_type'] = Variable<bool>(image_source_type);
    map['read_pages'] = Variable<int>(read_pages);
    map['number_of_pages'] = Variable<int>(number_of_pages);
    map['status'] = Variable<bool>(status);
    map['grade'] = Variable<int>(grade);
    map['author_id'] = Variable<int>(author_id);
    map['genre_id'] = Variable<int>(genre_id);
    return map;
  }

  BookInfoTableCompanion toCompanion(bool nullToAbsent) {
    return BookInfoTableCompanion(
      book_id: Value(book_id),
      books_folder_id: Value(books_folder_id),
      book_name: Value(book_name),
      image_path: Value(image_path),
      image_source_type: Value(image_source_type),
      read_pages: Value(read_pages),
      number_of_pages: Value(number_of_pages),
      status: Value(status),
      grade: Value(grade),
      author_id: Value(author_id),
      genre_id: Value(genre_id),
    );
  }

  factory BookInfoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookInfoTableData(
      book_id: serializer.fromJson<int>(json['book_id']),
      books_folder_id: serializer.fromJson<int>(json['books_folder_id']),
      book_name: serializer.fromJson<String>(json['book_name']),
      image_path: serializer.fromJson<String>(json['image_path']),
      image_source_type: serializer.fromJson<bool>(json['image_source_type']),
      read_pages: serializer.fromJson<int>(json['read_pages']),
      number_of_pages: serializer.fromJson<int>(json['number_of_pages']),
      status: serializer.fromJson<bool>(json['status']),
      grade: serializer.fromJson<int>(json['grade']),
      author_id: serializer.fromJson<int>(json['author_id']),
      genre_id: serializer.fromJson<int>(json['genre_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'book_id': serializer.toJson<int>(book_id),
      'books_folder_id': serializer.toJson<int>(books_folder_id),
      'book_name': serializer.toJson<String>(book_name),
      'image_path': serializer.toJson<String>(image_path),
      'image_source_type': serializer.toJson<bool>(image_source_type),
      'read_pages': serializer.toJson<int>(read_pages),
      'number_of_pages': serializer.toJson<int>(number_of_pages),
      'status': serializer.toJson<bool>(status),
      'grade': serializer.toJson<int>(grade),
      'author_id': serializer.toJson<int>(author_id),
      'genre_id': serializer.toJson<int>(genre_id),
    };
  }

  BookInfoTableData copyWith(
          {int? book_id,
          int? books_folder_id,
          String? book_name,
          String? image_path,
          bool? image_source_type,
          int? read_pages,
          int? number_of_pages,
          bool? status,
          int? grade,
          int? author_id,
          int? genre_id}) =>
      BookInfoTableData(
        book_id: book_id ?? this.book_id,
        books_folder_id: books_folder_id ?? this.books_folder_id,
        book_name: book_name ?? this.book_name,
        image_path: image_path ?? this.image_path,
        image_source_type: image_source_type ?? this.image_source_type,
        read_pages: read_pages ?? this.read_pages,
        number_of_pages: number_of_pages ?? this.number_of_pages,
        status: status ?? this.status,
        grade: grade ?? this.grade,
        author_id: author_id ?? this.author_id,
        genre_id: genre_id ?? this.genre_id,
      );
  BookInfoTableData copyWithCompanion(BookInfoTableCompanion data) {
    return BookInfoTableData(
      book_id: data.book_id.present ? data.book_id.value : this.book_id,
      books_folder_id: data.books_folder_id.present
          ? data.books_folder_id.value
          : this.books_folder_id,
      book_name: data.book_name.present ? data.book_name.value : this.book_name,
      image_path:
          data.image_path.present ? data.image_path.value : this.image_path,
      image_source_type: data.image_source_type.present
          ? data.image_source_type.value
          : this.image_source_type,
      read_pages:
          data.read_pages.present ? data.read_pages.value : this.read_pages,
      number_of_pages: data.number_of_pages.present
          ? data.number_of_pages.value
          : this.number_of_pages,
      status: data.status.present ? data.status.value : this.status,
      grade: data.grade.present ? data.grade.value : this.grade,
      author_id: data.author_id.present ? data.author_id.value : this.author_id,
      genre_id: data.genre_id.present ? data.genre_id.value : this.genre_id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookInfoTableData(')
          ..write('book_id: $book_id, ')
          ..write('books_folder_id: $books_folder_id, ')
          ..write('book_name: $book_name, ')
          ..write('image_path: $image_path, ')
          ..write('image_source_type: $image_source_type, ')
          ..write('read_pages: $read_pages, ')
          ..write('number_of_pages: $number_of_pages, ')
          ..write('status: $status, ')
          ..write('grade: $grade, ')
          ..write('author_id: $author_id, ')
          ..write('genre_id: $genre_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      book_id,
      books_folder_id,
      book_name,
      image_path,
      image_source_type,
      read_pages,
      number_of_pages,
      status,
      grade,
      author_id,
      genre_id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookInfoTableData &&
          other.book_id == this.book_id &&
          other.books_folder_id == this.books_folder_id &&
          other.book_name == this.book_name &&
          other.image_path == this.image_path &&
          other.image_source_type == this.image_source_type &&
          other.read_pages == this.read_pages &&
          other.number_of_pages == this.number_of_pages &&
          other.status == this.status &&
          other.grade == this.grade &&
          other.author_id == this.author_id &&
          other.genre_id == this.genre_id);
}

class BookInfoTableCompanion extends UpdateCompanion<BookInfoTableData> {
  final Value<int> book_id;
  final Value<int> books_folder_id;
  final Value<String> book_name;
  final Value<String> image_path;
  final Value<bool> image_source_type;
  final Value<int> read_pages;
  final Value<int> number_of_pages;
  final Value<bool> status;
  final Value<int> grade;
  final Value<int> author_id;
  final Value<int> genre_id;
  const BookInfoTableCompanion({
    this.book_id = const Value.absent(),
    this.books_folder_id = const Value.absent(),
    this.book_name = const Value.absent(),
    this.image_path = const Value.absent(),
    this.image_source_type = const Value.absent(),
    this.read_pages = const Value.absent(),
    this.number_of_pages = const Value.absent(),
    this.status = const Value.absent(),
    this.grade = const Value.absent(),
    this.author_id = const Value.absent(),
    this.genre_id = const Value.absent(),
  });
  BookInfoTableCompanion.insert({
    this.book_id = const Value.absent(),
    this.books_folder_id = const Value.absent(),
    required String book_name,
    required String image_path,
    required bool image_source_type,
    required int read_pages,
    required int number_of_pages,
    required bool status,
    required int grade,
    required int author_id,
    required int genre_id,
  })  : book_name = Value(book_name),
        image_path = Value(image_path),
        image_source_type = Value(image_source_type),
        read_pages = Value(read_pages),
        number_of_pages = Value(number_of_pages),
        status = Value(status),
        grade = Value(grade),
        author_id = Value(author_id),
        genre_id = Value(genre_id);
  static Insertable<BookInfoTableData> custom({
    Expression<int>? book_id,
    Expression<int>? books_folder_id,
    Expression<String>? book_name,
    Expression<String>? image_path,
    Expression<bool>? image_source_type,
    Expression<int>? read_pages,
    Expression<int>? number_of_pages,
    Expression<bool>? status,
    Expression<int>? grade,
    Expression<int>? author_id,
    Expression<int>? genre_id,
  }) {
    return RawValuesInsertable({
      if (book_id != null) 'book_id': book_id,
      if (books_folder_id != null) 'books_folder_id': books_folder_id,
      if (book_name != null) 'book_name': book_name,
      if (image_path != null) 'image_path': image_path,
      if (image_source_type != null) 'image_source_type': image_source_type,
      if (read_pages != null) 'read_pages': read_pages,
      if (number_of_pages != null) 'number_of_pages': number_of_pages,
      if (status != null) 'status': status,
      if (grade != null) 'grade': grade,
      if (author_id != null) 'author_id': author_id,
      if (genre_id != null) 'genre_id': genre_id,
    });
  }

  BookInfoTableCompanion copyWith(
      {Value<int>? book_id,
      Value<int>? books_folder_id,
      Value<String>? book_name,
      Value<String>? image_path,
      Value<bool>? image_source_type,
      Value<int>? read_pages,
      Value<int>? number_of_pages,
      Value<bool>? status,
      Value<int>? grade,
      Value<int>? author_id,
      Value<int>? genre_id}) {
    return BookInfoTableCompanion(
      book_id: book_id ?? this.book_id,
      books_folder_id: books_folder_id ?? this.books_folder_id,
      book_name: book_name ?? this.book_name,
      image_path: image_path ?? this.image_path,
      image_source_type: image_source_type ?? this.image_source_type,
      read_pages: read_pages ?? this.read_pages,
      number_of_pages: number_of_pages ?? this.number_of_pages,
      status: status ?? this.status,
      grade: grade ?? this.grade,
      author_id: author_id ?? this.author_id,
      genre_id: genre_id ?? this.genre_id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (book_id.present) {
      map['book_id'] = Variable<int>(book_id.value);
    }
    if (books_folder_id.present) {
      map['books_folder_id'] = Variable<int>(books_folder_id.value);
    }
    if (book_name.present) {
      map['book_name'] = Variable<String>(book_name.value);
    }
    if (image_path.present) {
      map['image_path'] = Variable<String>(image_path.value);
    }
    if (image_source_type.present) {
      map['image_source_type'] = Variable<bool>(image_source_type.value);
    }
    if (read_pages.present) {
      map['read_pages'] = Variable<int>(read_pages.value);
    }
    if (number_of_pages.present) {
      map['number_of_pages'] = Variable<int>(number_of_pages.value);
    }
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
    }
    if (grade.present) {
      map['grade'] = Variable<int>(grade.value);
    }
    if (author_id.present) {
      map['author_id'] = Variable<int>(author_id.value);
    }
    if (genre_id.present) {
      map['genre_id'] = Variable<int>(genre_id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookInfoTableCompanion(')
          ..write('book_id: $book_id, ')
          ..write('books_folder_id: $books_folder_id, ')
          ..write('book_name: $book_name, ')
          ..write('image_path: $image_path, ')
          ..write('image_source_type: $image_source_type, ')
          ..write('read_pages: $read_pages, ')
          ..write('number_of_pages: $number_of_pages, ')
          ..write('status: $status, ')
          ..write('grade: $grade, ')
          ..write('author_id: $author_id, ')
          ..write('genre_id: $genre_id')
          ..write(')'))
        .toString();
  }
}

class $ReadingUpdateInfoTable extends ReadingUpdateInfo
    with TableInfo<$ReadingUpdateInfoTable, ReadingUpdateInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReadingUpdateInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _update_idMeta =
      const VerificationMeta('update_id');
  @override
  late final GeneratedColumn<int> update_id = GeneratedColumn<int>(
      'update_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _book_idMeta =
      const VerificationMeta('book_id');
  @override
  late final GeneratedColumn<int> book_id = GeneratedColumn<int>(
      'book_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES book_info_table (book_id)'));
  static const VerificationMeta _update_timeMeta =
      const VerificationMeta('update_time');
  @override
  late final GeneratedColumn<DateTime> update_time = GeneratedColumn<DateTime>(
      'update_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _page_numberMeta =
      const VerificationMeta('page_number');
  @override
  late final GeneratedColumn<int> page_number = GeneratedColumn<int>(
      'page_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [update_id, book_id, update_time, page_number];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reading_update_info';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReadingUpdateInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('update_id')) {
      context.handle(_update_idMeta,
          update_id.isAcceptableOrUnknown(data['update_id']!, _update_idMeta));
    }
    if (data.containsKey('book_id')) {
      context.handle(_book_idMeta,
          book_id.isAcceptableOrUnknown(data['book_id']!, _book_idMeta));
    } else if (isInserting) {
      context.missing(_book_idMeta);
    }
    if (data.containsKey('update_time')) {
      context.handle(
          _update_timeMeta,
          update_time.isAcceptableOrUnknown(
              data['update_time']!, _update_timeMeta));
    }
    if (data.containsKey('page_number')) {
      context.handle(
          _page_numberMeta,
          page_number.isAcceptableOrUnknown(
              data['page_number']!, _page_numberMeta));
    } else if (isInserting) {
      context.missing(_page_numberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {update_id};
  @override
  ReadingUpdateInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReadingUpdateInfoData(
      update_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}update_id'])!,
      book_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}book_id'])!,
      update_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time'])!,
      page_number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}page_number'])!,
    );
  }

  @override
  $ReadingUpdateInfoTable createAlias(String alias) {
    return $ReadingUpdateInfoTable(attachedDatabase, alias);
  }
}

class ReadingUpdateInfoData extends DataClass
    implements Insertable<ReadingUpdateInfoData> {
  final int update_id;
  final int book_id;
  final DateTime update_time;
  final int page_number;
  const ReadingUpdateInfoData(
      {required this.update_id,
      required this.book_id,
      required this.update_time,
      required this.page_number});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['update_id'] = Variable<int>(update_id);
    map['book_id'] = Variable<int>(book_id);
    map['update_time'] = Variable<DateTime>(update_time);
    map['page_number'] = Variable<int>(page_number);
    return map;
  }

  ReadingUpdateInfoCompanion toCompanion(bool nullToAbsent) {
    return ReadingUpdateInfoCompanion(
      update_id: Value(update_id),
      book_id: Value(book_id),
      update_time: Value(update_time),
      page_number: Value(page_number),
    );
  }

  factory ReadingUpdateInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReadingUpdateInfoData(
      update_id: serializer.fromJson<int>(json['update_id']),
      book_id: serializer.fromJson<int>(json['book_id']),
      update_time: serializer.fromJson<DateTime>(json['update_time']),
      page_number: serializer.fromJson<int>(json['page_number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'update_id': serializer.toJson<int>(update_id),
      'book_id': serializer.toJson<int>(book_id),
      'update_time': serializer.toJson<DateTime>(update_time),
      'page_number': serializer.toJson<int>(page_number),
    };
  }

  ReadingUpdateInfoData copyWith(
          {int? update_id,
          int? book_id,
          DateTime? update_time,
          int? page_number}) =>
      ReadingUpdateInfoData(
        update_id: update_id ?? this.update_id,
        book_id: book_id ?? this.book_id,
        update_time: update_time ?? this.update_time,
        page_number: page_number ?? this.page_number,
      );
  ReadingUpdateInfoData copyWithCompanion(ReadingUpdateInfoCompanion data) {
    return ReadingUpdateInfoData(
      update_id: data.update_id.present ? data.update_id.value : this.update_id,
      book_id: data.book_id.present ? data.book_id.value : this.book_id,
      update_time:
          data.update_time.present ? data.update_time.value : this.update_time,
      page_number:
          data.page_number.present ? data.page_number.value : this.page_number,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReadingUpdateInfoData(')
          ..write('update_id: $update_id, ')
          ..write('book_id: $book_id, ')
          ..write('update_time: $update_time, ')
          ..write('page_number: $page_number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(update_id, book_id, update_time, page_number);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReadingUpdateInfoData &&
          other.update_id == this.update_id &&
          other.book_id == this.book_id &&
          other.update_time == this.update_time &&
          other.page_number == this.page_number);
}

class ReadingUpdateInfoCompanion
    extends UpdateCompanion<ReadingUpdateInfoData> {
  final Value<int> update_id;
  final Value<int> book_id;
  final Value<DateTime> update_time;
  final Value<int> page_number;
  const ReadingUpdateInfoCompanion({
    this.update_id = const Value.absent(),
    this.book_id = const Value.absent(),
    this.update_time = const Value.absent(),
    this.page_number = const Value.absent(),
  });
  ReadingUpdateInfoCompanion.insert({
    this.update_id = const Value.absent(),
    required int book_id,
    this.update_time = const Value.absent(),
    required int page_number,
  })  : book_id = Value(book_id),
        page_number = Value(page_number);
  static Insertable<ReadingUpdateInfoData> custom({
    Expression<int>? update_id,
    Expression<int>? book_id,
    Expression<DateTime>? update_time,
    Expression<int>? page_number,
  }) {
    return RawValuesInsertable({
      if (update_id != null) 'update_id': update_id,
      if (book_id != null) 'book_id': book_id,
      if (update_time != null) 'update_time': update_time,
      if (page_number != null) 'page_number': page_number,
    });
  }

  ReadingUpdateInfoCompanion copyWith(
      {Value<int>? update_id,
      Value<int>? book_id,
      Value<DateTime>? update_time,
      Value<int>? page_number}) {
    return ReadingUpdateInfoCompanion(
      update_id: update_id ?? this.update_id,
      book_id: book_id ?? this.book_id,
      update_time: update_time ?? this.update_time,
      page_number: page_number ?? this.page_number,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (update_id.present) {
      map['update_id'] = Variable<int>(update_id.value);
    }
    if (book_id.present) {
      map['book_id'] = Variable<int>(book_id.value);
    }
    if (update_time.present) {
      map['update_time'] = Variable<DateTime>(update_time.value);
    }
    if (page_number.present) {
      map['page_number'] = Variable<int>(page_number.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadingUpdateInfoCompanion(')
          ..write('update_id: $update_id, ')
          ..write('book_id: $book_id, ')
          ..write('update_time: $update_time, ')
          ..write('page_number: $page_number')
          ..write(')'))
        .toString();
  }
}

class $BookmarksFolderInfoTable extends BookmarksFolderInfo
    with TableInfo<$BookmarksFolderInfoTable, BookmarksFolderInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarksFolderInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bookmarks_folder_idMeta =
      const VerificationMeta('bookmarks_folder_id');
  @override
  late final GeneratedColumn<int> bookmarks_folder_id = GeneratedColumn<int>(
      'bookmarks_folder_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _book_idMeta =
      const VerificationMeta('book_id');
  @override
  late final GeneratedColumn<int> book_id = GeneratedColumn<int>(
      'book_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES book_info_table (book_id)'));
  static const VerificationMeta _bookmarks_folder_nameMeta =
      const VerificationMeta('bookmarks_folder_name');
  @override
  late final GeneratedColumn<String> bookmarks_folder_name =
      GeneratedColumn<String>('bookmarks_folder_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bookmarks_folder_colorMeta =
      const VerificationMeta('bookmarks_folder_color');
  @override
  late final GeneratedColumn<String> bookmarks_folder_color =
      GeneratedColumn<String>('bookmarks_folder_color', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        bookmarks_folder_id,
        book_id,
        bookmarks_folder_name,
        bookmarks_folder_color
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmarks_folder_info';
  @override
  VerificationContext validateIntegrity(
      Insertable<BookmarksFolderInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bookmarks_folder_id')) {
      context.handle(
          _bookmarks_folder_idMeta,
          bookmarks_folder_id.isAcceptableOrUnknown(
              data['bookmarks_folder_id']!, _bookmarks_folder_idMeta));
    }
    if (data.containsKey('book_id')) {
      context.handle(_book_idMeta,
          book_id.isAcceptableOrUnknown(data['book_id']!, _book_idMeta));
    } else if (isInserting) {
      context.missing(_book_idMeta);
    }
    if (data.containsKey('bookmarks_folder_name')) {
      context.handle(
          _bookmarks_folder_nameMeta,
          bookmarks_folder_name.isAcceptableOrUnknown(
              data['bookmarks_folder_name']!, _bookmarks_folder_nameMeta));
    } else if (isInserting) {
      context.missing(_bookmarks_folder_nameMeta);
    }
    if (data.containsKey('bookmarks_folder_color')) {
      context.handle(
          _bookmarks_folder_colorMeta,
          bookmarks_folder_color.isAcceptableOrUnknown(
              data['bookmarks_folder_color']!, _bookmarks_folder_colorMeta));
    } else if (isInserting) {
      context.missing(_bookmarks_folder_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {bookmarks_folder_id};
  @override
  BookmarksFolderInfoData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarksFolderInfoData(
      bookmarks_folder_id: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}bookmarks_folder_id'])!,
      book_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}book_id'])!,
      bookmarks_folder_name: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}bookmarks_folder_name'])!,
      bookmarks_folder_color: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}bookmarks_folder_color'])!,
    );
  }

  @override
  $BookmarksFolderInfoTable createAlias(String alias) {
    return $BookmarksFolderInfoTable(attachedDatabase, alias);
  }
}

class BookmarksFolderInfoData extends DataClass
    implements Insertable<BookmarksFolderInfoData> {
  final int bookmarks_folder_id;
  final int book_id;
  final String bookmarks_folder_name;
  final String bookmarks_folder_color;
  const BookmarksFolderInfoData(
      {required this.bookmarks_folder_id,
      required this.book_id,
      required this.bookmarks_folder_name,
      required this.bookmarks_folder_color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['bookmarks_folder_id'] = Variable<int>(bookmarks_folder_id);
    map['book_id'] = Variable<int>(book_id);
    map['bookmarks_folder_name'] = Variable<String>(bookmarks_folder_name);
    map['bookmarks_folder_color'] = Variable<String>(bookmarks_folder_color);
    return map;
  }

  BookmarksFolderInfoCompanion toCompanion(bool nullToAbsent) {
    return BookmarksFolderInfoCompanion(
      bookmarks_folder_id: Value(bookmarks_folder_id),
      book_id: Value(book_id),
      bookmarks_folder_name: Value(bookmarks_folder_name),
      bookmarks_folder_color: Value(bookmarks_folder_color),
    );
  }

  factory BookmarksFolderInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarksFolderInfoData(
      bookmarks_folder_id:
          serializer.fromJson<int>(json['bookmarks_folder_id']),
      book_id: serializer.fromJson<int>(json['book_id']),
      bookmarks_folder_name:
          serializer.fromJson<String>(json['bookmarks_folder_name']),
      bookmarks_folder_color:
          serializer.fromJson<String>(json['bookmarks_folder_color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bookmarks_folder_id': serializer.toJson<int>(bookmarks_folder_id),
      'book_id': serializer.toJson<int>(book_id),
      'bookmarks_folder_name': serializer.toJson<String>(bookmarks_folder_name),
      'bookmarks_folder_color':
          serializer.toJson<String>(bookmarks_folder_color),
    };
  }

  BookmarksFolderInfoData copyWith(
          {int? bookmarks_folder_id,
          int? book_id,
          String? bookmarks_folder_name,
          String? bookmarks_folder_color}) =>
      BookmarksFolderInfoData(
        bookmarks_folder_id: bookmarks_folder_id ?? this.bookmarks_folder_id,
        book_id: book_id ?? this.book_id,
        bookmarks_folder_name:
            bookmarks_folder_name ?? this.bookmarks_folder_name,
        bookmarks_folder_color:
            bookmarks_folder_color ?? this.bookmarks_folder_color,
      );
  BookmarksFolderInfoData copyWithCompanion(BookmarksFolderInfoCompanion data) {
    return BookmarksFolderInfoData(
      bookmarks_folder_id: data.bookmarks_folder_id.present
          ? data.bookmarks_folder_id.value
          : this.bookmarks_folder_id,
      book_id: data.book_id.present ? data.book_id.value : this.book_id,
      bookmarks_folder_name: data.bookmarks_folder_name.present
          ? data.bookmarks_folder_name.value
          : this.bookmarks_folder_name,
      bookmarks_folder_color: data.bookmarks_folder_color.present
          ? data.bookmarks_folder_color.value
          : this.bookmarks_folder_color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarksFolderInfoData(')
          ..write('bookmarks_folder_id: $bookmarks_folder_id, ')
          ..write('book_id: $book_id, ')
          ..write('bookmarks_folder_name: $bookmarks_folder_name, ')
          ..write('bookmarks_folder_color: $bookmarks_folder_color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(bookmarks_folder_id, book_id,
      bookmarks_folder_name, bookmarks_folder_color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarksFolderInfoData &&
          other.bookmarks_folder_id == this.bookmarks_folder_id &&
          other.book_id == this.book_id &&
          other.bookmarks_folder_name == this.bookmarks_folder_name &&
          other.bookmarks_folder_color == this.bookmarks_folder_color);
}

class BookmarksFolderInfoCompanion
    extends UpdateCompanion<BookmarksFolderInfoData> {
  final Value<int> bookmarks_folder_id;
  final Value<int> book_id;
  final Value<String> bookmarks_folder_name;
  final Value<String> bookmarks_folder_color;
  const BookmarksFolderInfoCompanion({
    this.bookmarks_folder_id = const Value.absent(),
    this.book_id = const Value.absent(),
    this.bookmarks_folder_name = const Value.absent(),
    this.bookmarks_folder_color = const Value.absent(),
  });
  BookmarksFolderInfoCompanion.insert({
    this.bookmarks_folder_id = const Value.absent(),
    required int book_id,
    required String bookmarks_folder_name,
    required String bookmarks_folder_color,
  })  : book_id = Value(book_id),
        bookmarks_folder_name = Value(bookmarks_folder_name),
        bookmarks_folder_color = Value(bookmarks_folder_color);
  static Insertable<BookmarksFolderInfoData> custom({
    Expression<int>? bookmarks_folder_id,
    Expression<int>? book_id,
    Expression<String>? bookmarks_folder_name,
    Expression<String>? bookmarks_folder_color,
  }) {
    return RawValuesInsertable({
      if (bookmarks_folder_id != null)
        'bookmarks_folder_id': bookmarks_folder_id,
      if (book_id != null) 'book_id': book_id,
      if (bookmarks_folder_name != null)
        'bookmarks_folder_name': bookmarks_folder_name,
      if (bookmarks_folder_color != null)
        'bookmarks_folder_color': bookmarks_folder_color,
    });
  }

  BookmarksFolderInfoCompanion copyWith(
      {Value<int>? bookmarks_folder_id,
      Value<int>? book_id,
      Value<String>? bookmarks_folder_name,
      Value<String>? bookmarks_folder_color}) {
    return BookmarksFolderInfoCompanion(
      bookmarks_folder_id: bookmarks_folder_id ?? this.bookmarks_folder_id,
      book_id: book_id ?? this.book_id,
      bookmarks_folder_name:
          bookmarks_folder_name ?? this.bookmarks_folder_name,
      bookmarks_folder_color:
          bookmarks_folder_color ?? this.bookmarks_folder_color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bookmarks_folder_id.present) {
      map['bookmarks_folder_id'] = Variable<int>(bookmarks_folder_id.value);
    }
    if (book_id.present) {
      map['book_id'] = Variable<int>(book_id.value);
    }
    if (bookmarks_folder_name.present) {
      map['bookmarks_folder_name'] =
          Variable<String>(bookmarks_folder_name.value);
    }
    if (bookmarks_folder_color.present) {
      map['bookmarks_folder_color'] =
          Variable<String>(bookmarks_folder_color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarksFolderInfoCompanion(')
          ..write('bookmarks_folder_id: $bookmarks_folder_id, ')
          ..write('book_id: $book_id, ')
          ..write('bookmarks_folder_name: $bookmarks_folder_name, ')
          ..write('bookmarks_folder_color: $bookmarks_folder_color')
          ..write(')'))
        .toString();
  }
}

class $BookmarkInfoTable extends BookmarkInfo
    with TableInfo<$BookmarkInfoTable, BookmarkInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bookmark_idMeta =
      const VerificationMeta('bookmark_id');
  @override
  late final GeneratedColumn<int> bookmark_id = GeneratedColumn<int>(
      'bookmark_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _bookmarks_folder_idMeta =
      const VerificationMeta('bookmarks_folder_id');
  @override
  late final GeneratedColumn<int> bookmarks_folder_id = GeneratedColumn<int>(
      'bookmarks_folder_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES bookmarks_folder_info (bookmarks_folder_id)'),
      defaultValue: Constant(0));
  static const VerificationMeta _bookmark_titleMeta =
      const VerificationMeta('bookmark_title');
  @override
  late final GeneratedColumn<String> bookmark_title = GeneratedColumn<String>(
      'bookmark_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bookmark_textMeta =
      const VerificationMeta('bookmark_text');
  @override
  late final GeneratedColumn<String> bookmark_text = GeneratedColumn<String>(
      'bookmark_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [bookmark_id, bookmarks_folder_id, bookmark_title, bookmark_text];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmark_info';
  @override
  VerificationContext validateIntegrity(Insertable<BookmarkInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bookmark_id')) {
      context.handle(
          _bookmark_idMeta,
          bookmark_id.isAcceptableOrUnknown(
              data['bookmark_id']!, _bookmark_idMeta));
    }
    if (data.containsKey('bookmarks_folder_id')) {
      context.handle(
          _bookmarks_folder_idMeta,
          bookmarks_folder_id.isAcceptableOrUnknown(
              data['bookmarks_folder_id']!, _bookmarks_folder_idMeta));
    }
    if (data.containsKey('bookmark_title')) {
      context.handle(
          _bookmark_titleMeta,
          bookmark_title.isAcceptableOrUnknown(
              data['bookmark_title']!, _bookmark_titleMeta));
    }
    if (data.containsKey('bookmark_text')) {
      context.handle(
          _bookmark_textMeta,
          bookmark_text.isAcceptableOrUnknown(
              data['bookmark_text']!, _bookmark_textMeta));
    } else if (isInserting) {
      context.missing(_bookmark_textMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {bookmark_id};
  @override
  BookmarkInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkInfoData(
      bookmark_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bookmark_id'])!,
      bookmarks_folder_id: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}bookmarks_folder_id'])!,
      bookmark_title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bookmark_title']),
      bookmark_text: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bookmark_text'])!,
    );
  }

  @override
  $BookmarkInfoTable createAlias(String alias) {
    return $BookmarkInfoTable(attachedDatabase, alias);
  }
}

class BookmarkInfoData extends DataClass
    implements Insertable<BookmarkInfoData> {
  final int bookmark_id;
  final int bookmarks_folder_id;
  final String? bookmark_title;
  final String bookmark_text;
  const BookmarkInfoData(
      {required this.bookmark_id,
      required this.bookmarks_folder_id,
      this.bookmark_title,
      required this.bookmark_text});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['bookmark_id'] = Variable<int>(bookmark_id);
    map['bookmarks_folder_id'] = Variable<int>(bookmarks_folder_id);
    if (!nullToAbsent || bookmark_title != null) {
      map['bookmark_title'] = Variable<String>(bookmark_title);
    }
    map['bookmark_text'] = Variable<String>(bookmark_text);
    return map;
  }

  BookmarkInfoCompanion toCompanion(bool nullToAbsent) {
    return BookmarkInfoCompanion(
      bookmark_id: Value(bookmark_id),
      bookmarks_folder_id: Value(bookmarks_folder_id),
      bookmark_title: bookmark_title == null && nullToAbsent
          ? const Value.absent()
          : Value(bookmark_title),
      bookmark_text: Value(bookmark_text),
    );
  }

  factory BookmarkInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkInfoData(
      bookmark_id: serializer.fromJson<int>(json['bookmark_id']),
      bookmarks_folder_id:
          serializer.fromJson<int>(json['bookmarks_folder_id']),
      bookmark_title: serializer.fromJson<String?>(json['bookmark_title']),
      bookmark_text: serializer.fromJson<String>(json['bookmark_text']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bookmark_id': serializer.toJson<int>(bookmark_id),
      'bookmarks_folder_id': serializer.toJson<int>(bookmarks_folder_id),
      'bookmark_title': serializer.toJson<String?>(bookmark_title),
      'bookmark_text': serializer.toJson<String>(bookmark_text),
    };
  }

  BookmarkInfoData copyWith(
          {int? bookmark_id,
          int? bookmarks_folder_id,
          Value<String?> bookmark_title = const Value.absent(),
          String? bookmark_text}) =>
      BookmarkInfoData(
        bookmark_id: bookmark_id ?? this.bookmark_id,
        bookmarks_folder_id: bookmarks_folder_id ?? this.bookmarks_folder_id,
        bookmark_title:
            bookmark_title.present ? bookmark_title.value : this.bookmark_title,
        bookmark_text: bookmark_text ?? this.bookmark_text,
      );
  BookmarkInfoData copyWithCompanion(BookmarkInfoCompanion data) {
    return BookmarkInfoData(
      bookmark_id:
          data.bookmark_id.present ? data.bookmark_id.value : this.bookmark_id,
      bookmarks_folder_id: data.bookmarks_folder_id.present
          ? data.bookmarks_folder_id.value
          : this.bookmarks_folder_id,
      bookmark_title: data.bookmark_title.present
          ? data.bookmark_title.value
          : this.bookmark_title,
      bookmark_text: data.bookmark_text.present
          ? data.bookmark_text.value
          : this.bookmark_text,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkInfoData(')
          ..write('bookmark_id: $bookmark_id, ')
          ..write('bookmarks_folder_id: $bookmarks_folder_id, ')
          ..write('bookmark_title: $bookmark_title, ')
          ..write('bookmark_text: $bookmark_text')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      bookmark_id, bookmarks_folder_id, bookmark_title, bookmark_text);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkInfoData &&
          other.bookmark_id == this.bookmark_id &&
          other.bookmarks_folder_id == this.bookmarks_folder_id &&
          other.bookmark_title == this.bookmark_title &&
          other.bookmark_text == this.bookmark_text);
}

class BookmarkInfoCompanion extends UpdateCompanion<BookmarkInfoData> {
  final Value<int> bookmark_id;
  final Value<int> bookmarks_folder_id;
  final Value<String?> bookmark_title;
  final Value<String> bookmark_text;
  const BookmarkInfoCompanion({
    this.bookmark_id = const Value.absent(),
    this.bookmarks_folder_id = const Value.absent(),
    this.bookmark_title = const Value.absent(),
    this.bookmark_text = const Value.absent(),
  });
  BookmarkInfoCompanion.insert({
    this.bookmark_id = const Value.absent(),
    this.bookmarks_folder_id = const Value.absent(),
    this.bookmark_title = const Value.absent(),
    required String bookmark_text,
  }) : bookmark_text = Value(bookmark_text);
  static Insertable<BookmarkInfoData> custom({
    Expression<int>? bookmark_id,
    Expression<int>? bookmarks_folder_id,
    Expression<String>? bookmark_title,
    Expression<String>? bookmark_text,
  }) {
    return RawValuesInsertable({
      if (bookmark_id != null) 'bookmark_id': bookmark_id,
      if (bookmarks_folder_id != null)
        'bookmarks_folder_id': bookmarks_folder_id,
      if (bookmark_title != null) 'bookmark_title': bookmark_title,
      if (bookmark_text != null) 'bookmark_text': bookmark_text,
    });
  }

  BookmarkInfoCompanion copyWith(
      {Value<int>? bookmark_id,
      Value<int>? bookmarks_folder_id,
      Value<String?>? bookmark_title,
      Value<String>? bookmark_text}) {
    return BookmarkInfoCompanion(
      bookmark_id: bookmark_id ?? this.bookmark_id,
      bookmarks_folder_id: bookmarks_folder_id ?? this.bookmarks_folder_id,
      bookmark_title: bookmark_title ?? this.bookmark_title,
      bookmark_text: bookmark_text ?? this.bookmark_text,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bookmark_id.present) {
      map['bookmark_id'] = Variable<int>(bookmark_id.value);
    }
    if (bookmarks_folder_id.present) {
      map['bookmarks_folder_id'] = Variable<int>(bookmarks_folder_id.value);
    }
    if (bookmark_title.present) {
      map['bookmark_title'] = Variable<String>(bookmark_title.value);
    }
    if (bookmark_text.present) {
      map['bookmark_text'] = Variable<String>(bookmark_text.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkInfoCompanion(')
          ..write('bookmark_id: $bookmark_id, ')
          ..write('bookmarks_folder_id: $bookmarks_folder_id, ')
          ..write('bookmark_title: $bookmark_title, ')
          ..write('bookmark_text: $bookmark_text')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $BooksFolderInfoTableTable booksFolderInfoTable =
      $BooksFolderInfoTableTable(this);
  late final $AuthorsInfoTableTable authorsInfoTable =
      $AuthorsInfoTableTable(this);
  late final $GenresInfoTableTable genresInfoTable =
      $GenresInfoTableTable(this);
  late final $BookInfoTableTable bookInfoTable = $BookInfoTableTable(this);
  late final $ReadingUpdateInfoTable readingUpdateInfo =
      $ReadingUpdateInfoTable(this);
  late final $BookmarksFolderInfoTable bookmarksFolderInfo =
      $BookmarksFolderInfoTable(this);
  late final $BookmarkInfoTable bookmarkInfo = $BookmarkInfoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        booksFolderInfoTable,
        authorsInfoTable,
        genresInfoTable,
        bookInfoTable,
        readingUpdateInfo,
        bookmarksFolderInfo,
        bookmarkInfo
      ];
}

typedef $$BooksFolderInfoTableTableCreateCompanionBuilder
    = BooksFolderInfoTableCompanion Function({
  Value<int> books_folder_id,
  required String books_folder_name,
  Value<String?> font_style,
  Value<String?> font_color,
});
typedef $$BooksFolderInfoTableTableUpdateCompanionBuilder
    = BooksFolderInfoTableCompanion Function({
  Value<int> books_folder_id,
  Value<String> books_folder_name,
  Value<String?> font_style,
  Value<String?> font_color,
});

final class $$BooksFolderInfoTableTableReferences extends BaseReferences<
    _$Database, $BooksFolderInfoTableTable, BooksFolderInfoTableData> {
  $$BooksFolderInfoTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BookInfoTableTable, List<BookInfoTableData>>
      _bookInfoTableRefsTable(_$Database db) =>
          MultiTypedResultKey.fromTable(db.bookInfoTable,
              aliasName: $_aliasNameGenerator(
                  db.booksFolderInfoTable.books_folder_id,
                  db.bookInfoTable.books_folder_id));

  $$BookInfoTableTableProcessedTableManager get bookInfoTableRefs {
    final manager = $$BookInfoTableTableTableManager($_db, $_db.bookInfoTable)
        .filter((f) => f.books_folder_id.books_folder_id
            .sqlEquals($_itemColumn<int>('books_folder_id')!));

    final cache = $_typedResult.readTableOrNull(_bookInfoTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BooksFolderInfoTableTableFilterComposer
    extends Composer<_$Database, $BooksFolderInfoTableTable> {
  $$BooksFolderInfoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get books_folder_id => $composableBuilder(
      column: $table.books_folder_id,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get books_folder_name => $composableBuilder(
      column: $table.books_folder_name,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get font_style => $composableBuilder(
      column: $table.font_style, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get font_color => $composableBuilder(
      column: $table.font_color, builder: (column) => ColumnFilters(column));

  Expression<bool> bookInfoTableRefs(
      Expression<bool> Function($$BookInfoTableTableFilterComposer f) f) {
    final $$BookInfoTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.books_folder_id,
        referencedTable: $db.bookInfoTable,
        getReferencedColumn: (t) => t.books_folder_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookInfoTableTableFilterComposer(
              $db: $db,
              $table: $db.bookInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BooksFolderInfoTableTableOrderingComposer
    extends Composer<_$Database, $BooksFolderInfoTableTable> {
  $$BooksFolderInfoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get books_folder_id => $composableBuilder(
      column: $table.books_folder_id,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get books_folder_name => $composableBuilder(
      column: $table.books_folder_name,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get font_style => $composableBuilder(
      column: $table.font_style, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get font_color => $composableBuilder(
      column: $table.font_color, builder: (column) => ColumnOrderings(column));
}

class $$BooksFolderInfoTableTableAnnotationComposer
    extends Composer<_$Database, $BooksFolderInfoTableTable> {
  $$BooksFolderInfoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get books_folder_id => $composableBuilder(
      column: $table.books_folder_id, builder: (column) => column);

  GeneratedColumn<String> get books_folder_name => $composableBuilder(
      column: $table.books_folder_name, builder: (column) => column);

  GeneratedColumn<String> get font_style => $composableBuilder(
      column: $table.font_style, builder: (column) => column);

  GeneratedColumn<String> get font_color => $composableBuilder(
      column: $table.font_color, builder: (column) => column);

  Expression<T> bookInfoTableRefs<T extends Object>(
      Expression<T> Function($$BookInfoTableTableAnnotationComposer a) f) {
    final $$BookInfoTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.books_folder_id,
        referencedTable: $db.bookInfoTable,
        getReferencedColumn: (t) => t.books_folder_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookInfoTableTableAnnotationComposer(
              $db: $db,
              $table: $db.bookInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BooksFolderInfoTableTableTableManager extends RootTableManager<
    _$Database,
    $BooksFolderInfoTableTable,
    BooksFolderInfoTableData,
    $$BooksFolderInfoTableTableFilterComposer,
    $$BooksFolderInfoTableTableOrderingComposer,
    $$BooksFolderInfoTableTableAnnotationComposer,
    $$BooksFolderInfoTableTableCreateCompanionBuilder,
    $$BooksFolderInfoTableTableUpdateCompanionBuilder,
    (BooksFolderInfoTableData, $$BooksFolderInfoTableTableReferences),
    BooksFolderInfoTableData,
    PrefetchHooks Function({bool bookInfoTableRefs})> {
  $$BooksFolderInfoTableTableTableManager(
      _$Database db, $BooksFolderInfoTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BooksFolderInfoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BooksFolderInfoTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BooksFolderInfoTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> books_folder_id = const Value.absent(),
            Value<String> books_folder_name = const Value.absent(),
            Value<String?> font_style = const Value.absent(),
            Value<String?> font_color = const Value.absent(),
          }) =>
              BooksFolderInfoTableCompanion(
            books_folder_id: books_folder_id,
            books_folder_name: books_folder_name,
            font_style: font_style,
            font_color: font_color,
          ),
          createCompanionCallback: ({
            Value<int> books_folder_id = const Value.absent(),
            required String books_folder_name,
            Value<String?> font_style = const Value.absent(),
            Value<String?> font_color = const Value.absent(),
          }) =>
              BooksFolderInfoTableCompanion.insert(
            books_folder_id: books_folder_id,
            books_folder_name: books_folder_name,
            font_style: font_style,
            font_color: font_color,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BooksFolderInfoTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({bookInfoTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (bookInfoTableRefs) db.bookInfoTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bookInfoTableRefs)
                    await $_getPrefetchedData<BooksFolderInfoTableData,
                            $BooksFolderInfoTableTable, BookInfoTableData>(
                        currentTable: table,
                        referencedTable: $$BooksFolderInfoTableTableReferences
                            ._bookInfoTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BooksFolderInfoTableTableReferences(db, table, p0)
                                .bookInfoTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) =>
                                    e.books_folder_id == item.books_folder_id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$BooksFolderInfoTableTableProcessedTableManager
    = ProcessedTableManager<
        _$Database,
        $BooksFolderInfoTableTable,
        BooksFolderInfoTableData,
        $$BooksFolderInfoTableTableFilterComposer,
        $$BooksFolderInfoTableTableOrderingComposer,
        $$BooksFolderInfoTableTableAnnotationComposer,
        $$BooksFolderInfoTableTableCreateCompanionBuilder,
        $$BooksFolderInfoTableTableUpdateCompanionBuilder,
        (BooksFolderInfoTableData, $$BooksFolderInfoTableTableReferences),
        BooksFolderInfoTableData,
        PrefetchHooks Function({bool bookInfoTableRefs})>;
typedef $$AuthorsInfoTableTableCreateCompanionBuilder
    = AuthorsInfoTableCompanion Function({
  Value<int> author_id,
  required String author_fullname,
});
typedef $$AuthorsInfoTableTableUpdateCompanionBuilder
    = AuthorsInfoTableCompanion Function({
  Value<int> author_id,
  Value<String> author_fullname,
});

final class $$AuthorsInfoTableTableReferences extends BaseReferences<_$Database,
    $AuthorsInfoTableTable, AuthorsInfoTableData> {
  $$AuthorsInfoTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BookInfoTableTable, List<BookInfoTableData>>
      _bookInfoTableRefsTable(_$Database db) =>
          MultiTypedResultKey.fromTable(db.bookInfoTable,
              aliasName: $_aliasNameGenerator(
                  db.authorsInfoTable.author_id, db.bookInfoTable.author_id));

  $$BookInfoTableTableProcessedTableManager get bookInfoTableRefs {
    final manager = $$BookInfoTableTableTableManager($_db, $_db.bookInfoTable)
        .filter((f) =>
            f.author_id.author_id.sqlEquals($_itemColumn<int>('author_id')!));

    final cache = $_typedResult.readTableOrNull(_bookInfoTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AuthorsInfoTableTableFilterComposer
    extends Composer<_$Database, $AuthorsInfoTableTable> {
  $$AuthorsInfoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get author_id => $composableBuilder(
      column: $table.author_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get author_fullname => $composableBuilder(
      column: $table.author_fullname,
      builder: (column) => ColumnFilters(column));

  Expression<bool> bookInfoTableRefs(
      Expression<bool> Function($$BookInfoTableTableFilterComposer f) f) {
    final $$BookInfoTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.author_id,
        referencedTable: $db.bookInfoTable,
        getReferencedColumn: (t) => t.author_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookInfoTableTableFilterComposer(
              $db: $db,
              $table: $db.bookInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AuthorsInfoTableTableOrderingComposer
    extends Composer<_$Database, $AuthorsInfoTableTable> {
  $$AuthorsInfoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get author_id => $composableBuilder(
      column: $table.author_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get author_fullname => $composableBuilder(
      column: $table.author_fullname,
      builder: (column) => ColumnOrderings(column));
}

class $$AuthorsInfoTableTableAnnotationComposer
    extends Composer<_$Database, $AuthorsInfoTableTable> {
  $$AuthorsInfoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get author_id =>
      $composableBuilder(column: $table.author_id, builder: (column) => column);

  GeneratedColumn<String> get author_fullname => $composableBuilder(
      column: $table.author_fullname, builder: (column) => column);

  Expression<T> bookInfoTableRefs<T extends Object>(
      Expression<T> Function($$BookInfoTableTableAnnotationComposer a) f) {
    final $$BookInfoTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.author_id,
        referencedTable: $db.bookInfoTable,
        getReferencedColumn: (t) => t.author_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookInfoTableTableAnnotationComposer(
              $db: $db,
              $table: $db.bookInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AuthorsInfoTableTableTableManager extends RootTableManager<
    _$Database,
    $AuthorsInfoTableTable,
    AuthorsInfoTableData,
    $$AuthorsInfoTableTableFilterComposer,
    $$AuthorsInfoTableTableOrderingComposer,
    $$AuthorsInfoTableTableAnnotationComposer,
    $$AuthorsInfoTableTableCreateCompanionBuilder,
    $$AuthorsInfoTableTableUpdateCompanionBuilder,
    (AuthorsInfoTableData, $$AuthorsInfoTableTableReferences),
    AuthorsInfoTableData,
    PrefetchHooks Function({bool bookInfoTableRefs})> {
  $$AuthorsInfoTableTableTableManager(
      _$Database db, $AuthorsInfoTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthorsInfoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthorsInfoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthorsInfoTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> author_id = const Value.absent(),
            Value<String> author_fullname = const Value.absent(),
          }) =>
              AuthorsInfoTableCompanion(
            author_id: author_id,
            author_fullname: author_fullname,
          ),
          createCompanionCallback: ({
            Value<int> author_id = const Value.absent(),
            required String author_fullname,
          }) =>
              AuthorsInfoTableCompanion.insert(
            author_id: author_id,
            author_fullname: author_fullname,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AuthorsInfoTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({bookInfoTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (bookInfoTableRefs) db.bookInfoTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bookInfoTableRefs)
                    await $_getPrefetchedData<AuthorsInfoTableData,
                            $AuthorsInfoTableTable, BookInfoTableData>(
                        currentTable: table,
                        referencedTable: $$AuthorsInfoTableTableReferences
                            ._bookInfoTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AuthorsInfoTableTableReferences(db, table, p0)
                                .bookInfoTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.author_id == item.author_id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AuthorsInfoTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $AuthorsInfoTableTable,
    AuthorsInfoTableData,
    $$AuthorsInfoTableTableFilterComposer,
    $$AuthorsInfoTableTableOrderingComposer,
    $$AuthorsInfoTableTableAnnotationComposer,
    $$AuthorsInfoTableTableCreateCompanionBuilder,
    $$AuthorsInfoTableTableUpdateCompanionBuilder,
    (AuthorsInfoTableData, $$AuthorsInfoTableTableReferences),
    AuthorsInfoTableData,
    PrefetchHooks Function({bool bookInfoTableRefs})>;
typedef $$GenresInfoTableTableCreateCompanionBuilder = GenresInfoTableCompanion
    Function({
  Value<int> genre_id,
  required String genre_name,
  Value<bool> built_in,
});
typedef $$GenresInfoTableTableUpdateCompanionBuilder = GenresInfoTableCompanion
    Function({
  Value<int> genre_id,
  Value<String> genre_name,
  Value<bool> built_in,
});

final class $$GenresInfoTableTableReferences extends BaseReferences<_$Database,
    $GenresInfoTableTable, GenresInfoTableData> {
  $$GenresInfoTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BookInfoTableTable, List<BookInfoTableData>>
      _bookInfoTableRefsTable(_$Database db) =>
          MultiTypedResultKey.fromTable(db.bookInfoTable,
              aliasName: $_aliasNameGenerator(
                  db.genresInfoTable.genre_id, db.bookInfoTable.genre_id));

  $$BookInfoTableTableProcessedTableManager get bookInfoTableRefs {
    final manager = $$BookInfoTableTableTableManager($_db, $_db.bookInfoTable)
        .filter((f) =>
            f.genre_id.genre_id.sqlEquals($_itemColumn<int>('genre_id')!));

    final cache = $_typedResult.readTableOrNull(_bookInfoTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GenresInfoTableTableFilterComposer
    extends Composer<_$Database, $GenresInfoTableTable> {
  $$GenresInfoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get genre_id => $composableBuilder(
      column: $table.genre_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get genre_name => $composableBuilder(
      column: $table.genre_name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get built_in => $composableBuilder(
      column: $table.built_in, builder: (column) => ColumnFilters(column));

  Expression<bool> bookInfoTableRefs(
      Expression<bool> Function($$BookInfoTableTableFilterComposer f) f) {
    final $$BookInfoTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genre_id,
        referencedTable: $db.bookInfoTable,
        getReferencedColumn: (t) => t.genre_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookInfoTableTableFilterComposer(
              $db: $db,
              $table: $db.bookInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GenresInfoTableTableOrderingComposer
    extends Composer<_$Database, $GenresInfoTableTable> {
  $$GenresInfoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get genre_id => $composableBuilder(
      column: $table.genre_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get genre_name => $composableBuilder(
      column: $table.genre_name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get built_in => $composableBuilder(
      column: $table.built_in, builder: (column) => ColumnOrderings(column));
}

class $$GenresInfoTableTableAnnotationComposer
    extends Composer<_$Database, $GenresInfoTableTable> {
  $$GenresInfoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get genre_id =>
      $composableBuilder(column: $table.genre_id, builder: (column) => column);

  GeneratedColumn<String> get genre_name => $composableBuilder(
      column: $table.genre_name, builder: (column) => column);

  GeneratedColumn<bool> get built_in =>
      $composableBuilder(column: $table.built_in, builder: (column) => column);

  Expression<T> bookInfoTableRefs<T extends Object>(
      Expression<T> Function($$BookInfoTableTableAnnotationComposer a) f) {
    final $$BookInfoTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genre_id,
        referencedTable: $db.bookInfoTable,
        getReferencedColumn: (t) => t.genre_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookInfoTableTableAnnotationComposer(
              $db: $db,
              $table: $db.bookInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GenresInfoTableTableTableManager extends RootTableManager<
    _$Database,
    $GenresInfoTableTable,
    GenresInfoTableData,
    $$GenresInfoTableTableFilterComposer,
    $$GenresInfoTableTableOrderingComposer,
    $$GenresInfoTableTableAnnotationComposer,
    $$GenresInfoTableTableCreateCompanionBuilder,
    $$GenresInfoTableTableUpdateCompanionBuilder,
    (GenresInfoTableData, $$GenresInfoTableTableReferences),
    GenresInfoTableData,
    PrefetchHooks Function({bool bookInfoTableRefs})> {
  $$GenresInfoTableTableTableManager(_$Database db, $GenresInfoTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GenresInfoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GenresInfoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GenresInfoTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> genre_id = const Value.absent(),
            Value<String> genre_name = const Value.absent(),
            Value<bool> built_in = const Value.absent(),
          }) =>
              GenresInfoTableCompanion(
            genre_id: genre_id,
            genre_name: genre_name,
            built_in: built_in,
          ),
          createCompanionCallback: ({
            Value<int> genre_id = const Value.absent(),
            required String genre_name,
            Value<bool> built_in = const Value.absent(),
          }) =>
              GenresInfoTableCompanion.insert(
            genre_id: genre_id,
            genre_name: genre_name,
            built_in: built_in,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GenresInfoTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({bookInfoTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (bookInfoTableRefs) db.bookInfoTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bookInfoTableRefs)
                    await $_getPrefetchedData<GenresInfoTableData,
                            $GenresInfoTableTable, BookInfoTableData>(
                        currentTable: table,
                        referencedTable: $$GenresInfoTableTableReferences
                            ._bookInfoTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GenresInfoTableTableReferences(db, table, p0)
                                .bookInfoTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.genre_id == item.genre_id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GenresInfoTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $GenresInfoTableTable,
    GenresInfoTableData,
    $$GenresInfoTableTableFilterComposer,
    $$GenresInfoTableTableOrderingComposer,
    $$GenresInfoTableTableAnnotationComposer,
    $$GenresInfoTableTableCreateCompanionBuilder,
    $$GenresInfoTableTableUpdateCompanionBuilder,
    (GenresInfoTableData, $$GenresInfoTableTableReferences),
    GenresInfoTableData,
    PrefetchHooks Function({bool bookInfoTableRefs})>;
typedef $$BookInfoTableTableCreateCompanionBuilder = BookInfoTableCompanion
    Function({
  Value<int> book_id,
  Value<int> books_folder_id,
  required String book_name,
  required String image_path,
  required bool image_source_type,
  required int read_pages,
  required int number_of_pages,
  required bool status,
  required int grade,
  required int author_id,
  required int genre_id,
});
typedef $$BookInfoTableTableUpdateCompanionBuilder = BookInfoTableCompanion
    Function({
  Value<int> book_id,
  Value<int> books_folder_id,
  Value<String> book_name,
  Value<String> image_path,
  Value<bool> image_source_type,
  Value<int> read_pages,
  Value<int> number_of_pages,
  Value<bool> status,
  Value<int> grade,
  Value<int> author_id,
  Value<int> genre_id,
});

final class $$BookInfoTableTableReferences
    extends BaseReferences<_$Database, $BookInfoTableTable, BookInfoTableData> {
  $$BookInfoTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BooksFolderInfoTableTable _books_folder_idTable(_$Database db) =>
      db.booksFolderInfoTable.createAlias($_aliasNameGenerator(
          db.bookInfoTable.books_folder_id,
          db.booksFolderInfoTable.books_folder_id));

  $$BooksFolderInfoTableTableProcessedTableManager get books_folder_id {
    final $_column = $_itemColumn<int>('books_folder_id')!;

    final manager =
        $$BooksFolderInfoTableTableTableManager($_db, $_db.booksFolderInfoTable)
            .filter((f) => f.books_folder_id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_books_folder_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AuthorsInfoTableTable _author_idTable(_$Database db) =>
      db.authorsInfoTable.createAlias($_aliasNameGenerator(
          db.bookInfoTable.author_id, db.authorsInfoTable.author_id));

  $$AuthorsInfoTableTableProcessedTableManager get author_id {
    final $_column = $_itemColumn<int>('author_id')!;

    final manager =
        $$AuthorsInfoTableTableTableManager($_db, $_db.authorsInfoTable)
            .filter((f) => f.author_id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_author_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GenresInfoTableTable _genre_idTable(_$Database db) =>
      db.genresInfoTable.createAlias($_aliasNameGenerator(
          db.bookInfoTable.genre_id, db.genresInfoTable.genre_id));

  $$GenresInfoTableTableProcessedTableManager get genre_id {
    final $_column = $_itemColumn<int>('genre_id')!;

    final manager =
        $$GenresInfoTableTableTableManager($_db, $_db.genresInfoTable)
            .filter((f) => f.genre_id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_genre_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ReadingUpdateInfoTable,
      List<ReadingUpdateInfoData>> _readingUpdateInfoRefsTable(
          _$Database db) =>
      MultiTypedResultKey.fromTable(db.readingUpdateInfo,
          aliasName: $_aliasNameGenerator(
              db.bookInfoTable.book_id, db.readingUpdateInfo.book_id));

  $$ReadingUpdateInfoTableProcessedTableManager get readingUpdateInfoRefs {
    final manager = $$ReadingUpdateInfoTableTableManager(
            $_db, $_db.readingUpdateInfo)
        .filter(
            (f) => f.book_id.book_id.sqlEquals($_itemColumn<int>('book_id')!));

    final cache =
        $_typedResult.readTableOrNull(_readingUpdateInfoRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BookmarksFolderInfoTable,
      List<BookmarksFolderInfoData>> _bookmarksFolderInfoRefsTable(
          _$Database db) =>
      MultiTypedResultKey.fromTable(db.bookmarksFolderInfo,
          aliasName: $_aliasNameGenerator(
              db.bookInfoTable.book_id, db.bookmarksFolderInfo.book_id));

  $$BookmarksFolderInfoTableProcessedTableManager get bookmarksFolderInfoRefs {
    final manager = $$BookmarksFolderInfoTableTableManager(
            $_db, $_db.bookmarksFolderInfo)
        .filter(
            (f) => f.book_id.book_id.sqlEquals($_itemColumn<int>('book_id')!));

    final cache =
        $_typedResult.readTableOrNull(_bookmarksFolderInfoRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BookInfoTableTableFilterComposer
    extends Composer<_$Database, $BookInfoTableTable> {
  $$BookInfoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get book_id => $composableBuilder(
      column: $table.book_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get book_name => $composableBuilder(
      column: $table.book_name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image_path => $composableBuilder(
      column: $table.image_path, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get image_source_type => $composableBuilder(
      column: $table.image_source_type,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get read_pages => $composableBuilder(
      column: $table.read_pages, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get number_of_pages => $composableBuilder(
      column: $table.number_of_pages,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get grade => $composableBuilder(
      column: $table.grade, builder: (column) => ColumnFilters(column));

  $$BooksFolderInfoTableTableFilterComposer get books_folder_id {
    final $$BooksFolderInfoTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.books_folder_id,
        referencedTable: $db.booksFolderInfoTable,
        getReferencedColumn: (t) => t.books_folder_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BooksFolderInfoTableTableFilterComposer(
              $db: $db,
              $table: $db.booksFolderInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AuthorsInfoTableTableFilterComposer get author_id {
    final $$AuthorsInfoTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.author_id,
        referencedTable: $db.authorsInfoTable,
        getReferencedColumn: (t) => t.author_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AuthorsInfoTableTableFilterComposer(
              $db: $db,
              $table: $db.authorsInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GenresInfoTableTableFilterComposer get genre_id {
    final $$GenresInfoTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genre_id,
        referencedTable: $db.genresInfoTable,
        getReferencedColumn: (t) => t.genre_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GenresInfoTableTableFilterComposer(
              $db: $db,
              $table: $db.genresInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> readingUpdateInfoRefs(
      Expression<bool> Function($$ReadingUpdateInfoTableFilterComposer f) f) {
    final $$ReadingUpdateInfoTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.book_id,
        referencedTable: $db.readingUpdateInfo,
        getReferencedColumn: (t) => t.book_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReadingUpdateInfoTableFilterComposer(
              $db: $db,
              $table: $db.readingUpdateInfo,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> bookmarksFolderInfoRefs(
      Expression<bool> Function($$BookmarksFolderInfoTableFilterComposer f) f) {
    final $$BookmarksFolderInfoTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.book_id,
        referencedTable: $db.bookmarksFolderInfo,
        getReferencedColumn: (t) => t.book_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarksFolderInfoTableFilterComposer(
              $db: $db,
              $table: $db.bookmarksFolderInfo,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BookInfoTableTableOrderingComposer
    extends Composer<_$Database, $BookInfoTableTable> {
  $$BookInfoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get book_id => $composableBuilder(
      column: $table.book_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get book_name => $composableBuilder(
      column: $table.book_name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image_path => $composableBuilder(
      column: $table.image_path, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get image_source_type => $composableBuilder(
      column: $table.image_source_type,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get read_pages => $composableBuilder(
      column: $table.read_pages, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get number_of_pages => $composableBuilder(
      column: $table.number_of_pages,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get grade => $composableBuilder(
      column: $table.grade, builder: (column) => ColumnOrderings(column));

  $$BooksFolderInfoTableTableOrderingComposer get books_folder_id {
    final $$BooksFolderInfoTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.books_folder_id,
            referencedTable: $db.booksFolderInfoTable,
            getReferencedColumn: (t) => t.books_folder_id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$BooksFolderInfoTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.booksFolderInfoTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$AuthorsInfoTableTableOrderingComposer get author_id {
    final $$AuthorsInfoTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.author_id,
        referencedTable: $db.authorsInfoTable,
        getReferencedColumn: (t) => t.author_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AuthorsInfoTableTableOrderingComposer(
              $db: $db,
              $table: $db.authorsInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GenresInfoTableTableOrderingComposer get genre_id {
    final $$GenresInfoTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genre_id,
        referencedTable: $db.genresInfoTable,
        getReferencedColumn: (t) => t.genre_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GenresInfoTableTableOrderingComposer(
              $db: $db,
              $table: $db.genresInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BookInfoTableTableAnnotationComposer
    extends Composer<_$Database, $BookInfoTableTable> {
  $$BookInfoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get book_id =>
      $composableBuilder(column: $table.book_id, builder: (column) => column);

  GeneratedColumn<String> get book_name =>
      $composableBuilder(column: $table.book_name, builder: (column) => column);

  GeneratedColumn<String> get image_path => $composableBuilder(
      column: $table.image_path, builder: (column) => column);

  GeneratedColumn<bool> get image_source_type => $composableBuilder(
      column: $table.image_source_type, builder: (column) => column);

  GeneratedColumn<int> get read_pages => $composableBuilder(
      column: $table.read_pages, builder: (column) => column);

  GeneratedColumn<int> get number_of_pages => $composableBuilder(
      column: $table.number_of_pages, builder: (column) => column);

  GeneratedColumn<bool> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get grade =>
      $composableBuilder(column: $table.grade, builder: (column) => column);

  $$BooksFolderInfoTableTableAnnotationComposer get books_folder_id {
    final $$BooksFolderInfoTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.books_folder_id,
            referencedTable: $db.booksFolderInfoTable,
            getReferencedColumn: (t) => t.books_folder_id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$BooksFolderInfoTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.booksFolderInfoTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$AuthorsInfoTableTableAnnotationComposer get author_id {
    final $$AuthorsInfoTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.author_id,
        referencedTable: $db.authorsInfoTable,
        getReferencedColumn: (t) => t.author_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AuthorsInfoTableTableAnnotationComposer(
              $db: $db,
              $table: $db.authorsInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GenresInfoTableTableAnnotationComposer get genre_id {
    final $$GenresInfoTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genre_id,
        referencedTable: $db.genresInfoTable,
        getReferencedColumn: (t) => t.genre_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GenresInfoTableTableAnnotationComposer(
              $db: $db,
              $table: $db.genresInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> readingUpdateInfoRefs<T extends Object>(
      Expression<T> Function($$ReadingUpdateInfoTableAnnotationComposer a) f) {
    final $$ReadingUpdateInfoTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.book_id,
            referencedTable: $db.readingUpdateInfo,
            getReferencedColumn: (t) => t.book_id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ReadingUpdateInfoTableAnnotationComposer(
                  $db: $db,
                  $table: $db.readingUpdateInfo,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> bookmarksFolderInfoRefs<T extends Object>(
      Expression<T> Function($$BookmarksFolderInfoTableAnnotationComposer a)
          f) {
    final $$BookmarksFolderInfoTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.book_id,
            referencedTable: $db.bookmarksFolderInfo,
            getReferencedColumn: (t) => t.book_id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$BookmarksFolderInfoTableAnnotationComposer(
                  $db: $db,
                  $table: $db.bookmarksFolderInfo,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$BookInfoTableTableTableManager extends RootTableManager<
    _$Database,
    $BookInfoTableTable,
    BookInfoTableData,
    $$BookInfoTableTableFilterComposer,
    $$BookInfoTableTableOrderingComposer,
    $$BookInfoTableTableAnnotationComposer,
    $$BookInfoTableTableCreateCompanionBuilder,
    $$BookInfoTableTableUpdateCompanionBuilder,
    (BookInfoTableData, $$BookInfoTableTableReferences),
    BookInfoTableData,
    PrefetchHooks Function(
        {bool books_folder_id,
        bool author_id,
        bool genre_id,
        bool readingUpdateInfoRefs,
        bool bookmarksFolderInfoRefs})> {
  $$BookInfoTableTableTableManager(_$Database db, $BookInfoTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookInfoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookInfoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookInfoTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> book_id = const Value.absent(),
            Value<int> books_folder_id = const Value.absent(),
            Value<String> book_name = const Value.absent(),
            Value<String> image_path = const Value.absent(),
            Value<bool> image_source_type = const Value.absent(),
            Value<int> read_pages = const Value.absent(),
            Value<int> number_of_pages = const Value.absent(),
            Value<bool> status = const Value.absent(),
            Value<int> grade = const Value.absent(),
            Value<int> author_id = const Value.absent(),
            Value<int> genre_id = const Value.absent(),
          }) =>
              BookInfoTableCompanion(
            book_id: book_id,
            books_folder_id: books_folder_id,
            book_name: book_name,
            image_path: image_path,
            image_source_type: image_source_type,
            read_pages: read_pages,
            number_of_pages: number_of_pages,
            status: status,
            grade: grade,
            author_id: author_id,
            genre_id: genre_id,
          ),
          createCompanionCallback: ({
            Value<int> book_id = const Value.absent(),
            Value<int> books_folder_id = const Value.absent(),
            required String book_name,
            required String image_path,
            required bool image_source_type,
            required int read_pages,
            required int number_of_pages,
            required bool status,
            required int grade,
            required int author_id,
            required int genre_id,
          }) =>
              BookInfoTableCompanion.insert(
            book_id: book_id,
            books_folder_id: books_folder_id,
            book_name: book_name,
            image_path: image_path,
            image_source_type: image_source_type,
            read_pages: read_pages,
            number_of_pages: number_of_pages,
            status: status,
            grade: grade,
            author_id: author_id,
            genre_id: genre_id,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BookInfoTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {books_folder_id = false,
              author_id = false,
              genre_id = false,
              readingUpdateInfoRefs = false,
              bookmarksFolderInfoRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (readingUpdateInfoRefs) db.readingUpdateInfo,
                if (bookmarksFolderInfoRefs) db.bookmarksFolderInfo
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (books_folder_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.books_folder_id,
                    referencedTable: $$BookInfoTableTableReferences
                        ._books_folder_idTable(db),
                    referencedColumn: $$BookInfoTableTableReferences
                        ._books_folder_idTable(db)
                        .books_folder_id,
                  ) as T;
                }
                if (author_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.author_id,
                    referencedTable:
                        $$BookInfoTableTableReferences._author_idTable(db),
                    referencedColumn: $$BookInfoTableTableReferences
                        ._author_idTable(db)
                        .author_id,
                  ) as T;
                }
                if (genre_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.genre_id,
                    referencedTable:
                        $$BookInfoTableTableReferences._genre_idTable(db),
                    referencedColumn: $$BookInfoTableTableReferences
                        ._genre_idTable(db)
                        .genre_id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (readingUpdateInfoRefs)
                    await $_getPrefetchedData<BookInfoTableData,
                            $BookInfoTableTable, ReadingUpdateInfoData>(
                        currentTable: table,
                        referencedTable: $$BookInfoTableTableReferences
                            ._readingUpdateInfoRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BookInfoTableTableReferences(db, table, p0)
                                .readingUpdateInfoRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.book_id == item.book_id),
                        typedResults: items),
                  if (bookmarksFolderInfoRefs)
                    await $_getPrefetchedData<BookInfoTableData,
                            $BookInfoTableTable, BookmarksFolderInfoData>(
                        currentTable: table,
                        referencedTable: $$BookInfoTableTableReferences
                            ._bookmarksFolderInfoRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BookInfoTableTableReferences(db, table, p0)
                                .bookmarksFolderInfoRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.book_id == item.book_id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$BookInfoTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $BookInfoTableTable,
    BookInfoTableData,
    $$BookInfoTableTableFilterComposer,
    $$BookInfoTableTableOrderingComposer,
    $$BookInfoTableTableAnnotationComposer,
    $$BookInfoTableTableCreateCompanionBuilder,
    $$BookInfoTableTableUpdateCompanionBuilder,
    (BookInfoTableData, $$BookInfoTableTableReferences),
    BookInfoTableData,
    PrefetchHooks Function(
        {bool books_folder_id,
        bool author_id,
        bool genre_id,
        bool readingUpdateInfoRefs,
        bool bookmarksFolderInfoRefs})>;
typedef $$ReadingUpdateInfoTableCreateCompanionBuilder
    = ReadingUpdateInfoCompanion Function({
  Value<int> update_id,
  required int book_id,
  Value<DateTime> update_time,
  required int page_number,
});
typedef $$ReadingUpdateInfoTableUpdateCompanionBuilder
    = ReadingUpdateInfoCompanion Function({
  Value<int> update_id,
  Value<int> book_id,
  Value<DateTime> update_time,
  Value<int> page_number,
});

final class $$ReadingUpdateInfoTableReferences extends BaseReferences<
    _$Database, $ReadingUpdateInfoTable, ReadingUpdateInfoData> {
  $$ReadingUpdateInfoTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BookInfoTableTable _book_idTable(_$Database db) =>
      db.bookInfoTable.createAlias($_aliasNameGenerator(
          db.readingUpdateInfo.book_id, db.bookInfoTable.book_id));

  $$BookInfoTableTableProcessedTableManager get book_id {
    final $_column = $_itemColumn<int>('book_id')!;

    final manager = $$BookInfoTableTableTableManager($_db, $_db.bookInfoTable)
        .filter((f) => f.book_id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_book_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ReadingUpdateInfoTableFilterComposer
    extends Composer<_$Database, $ReadingUpdateInfoTable> {
  $$ReadingUpdateInfoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get update_id => $composableBuilder(
      column: $table.update_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get update_time => $composableBuilder(
      column: $table.update_time, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get page_number => $composableBuilder(
      column: $table.page_number, builder: (column) => ColumnFilters(column));

  $$BookInfoTableTableFilterComposer get book_id {
    final $$BookInfoTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.book_id,
        referencedTable: $db.bookInfoTable,
        getReferencedColumn: (t) => t.book_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookInfoTableTableFilterComposer(
              $db: $db,
              $table: $db.bookInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReadingUpdateInfoTableOrderingComposer
    extends Composer<_$Database, $ReadingUpdateInfoTable> {
  $$ReadingUpdateInfoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get update_id => $composableBuilder(
      column: $table.update_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get update_time => $composableBuilder(
      column: $table.update_time, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get page_number => $composableBuilder(
      column: $table.page_number, builder: (column) => ColumnOrderings(column));

  $$BookInfoTableTableOrderingComposer get book_id {
    final $$BookInfoTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.book_id,
        referencedTable: $db.bookInfoTable,
        getReferencedColumn: (t) => t.book_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookInfoTableTableOrderingComposer(
              $db: $db,
              $table: $db.bookInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReadingUpdateInfoTableAnnotationComposer
    extends Composer<_$Database, $ReadingUpdateInfoTable> {
  $$ReadingUpdateInfoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get update_id =>
      $composableBuilder(column: $table.update_id, builder: (column) => column);

  GeneratedColumn<DateTime> get update_time => $composableBuilder(
      column: $table.update_time, builder: (column) => column);

  GeneratedColumn<int> get page_number => $composableBuilder(
      column: $table.page_number, builder: (column) => column);

  $$BookInfoTableTableAnnotationComposer get book_id {
    final $$BookInfoTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.book_id,
        referencedTable: $db.bookInfoTable,
        getReferencedColumn: (t) => t.book_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookInfoTableTableAnnotationComposer(
              $db: $db,
              $table: $db.bookInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReadingUpdateInfoTableTableManager extends RootTableManager<
    _$Database,
    $ReadingUpdateInfoTable,
    ReadingUpdateInfoData,
    $$ReadingUpdateInfoTableFilterComposer,
    $$ReadingUpdateInfoTableOrderingComposer,
    $$ReadingUpdateInfoTableAnnotationComposer,
    $$ReadingUpdateInfoTableCreateCompanionBuilder,
    $$ReadingUpdateInfoTableUpdateCompanionBuilder,
    (ReadingUpdateInfoData, $$ReadingUpdateInfoTableReferences),
    ReadingUpdateInfoData,
    PrefetchHooks Function({bool book_id})> {
  $$ReadingUpdateInfoTableTableManager(
      _$Database db, $ReadingUpdateInfoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReadingUpdateInfoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReadingUpdateInfoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReadingUpdateInfoTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> update_id = const Value.absent(),
            Value<int> book_id = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            Value<int> page_number = const Value.absent(),
          }) =>
              ReadingUpdateInfoCompanion(
            update_id: update_id,
            book_id: book_id,
            update_time: update_time,
            page_number: page_number,
          ),
          createCompanionCallback: ({
            Value<int> update_id = const Value.absent(),
            required int book_id,
            Value<DateTime> update_time = const Value.absent(),
            required int page_number,
          }) =>
              ReadingUpdateInfoCompanion.insert(
            update_id: update_id,
            book_id: book_id,
            update_time: update_time,
            page_number: page_number,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ReadingUpdateInfoTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({book_id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (book_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.book_id,
                    referencedTable:
                        $$ReadingUpdateInfoTableReferences._book_idTable(db),
                    referencedColumn: $$ReadingUpdateInfoTableReferences
                        ._book_idTable(db)
                        .book_id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ReadingUpdateInfoTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $ReadingUpdateInfoTable,
    ReadingUpdateInfoData,
    $$ReadingUpdateInfoTableFilterComposer,
    $$ReadingUpdateInfoTableOrderingComposer,
    $$ReadingUpdateInfoTableAnnotationComposer,
    $$ReadingUpdateInfoTableCreateCompanionBuilder,
    $$ReadingUpdateInfoTableUpdateCompanionBuilder,
    (ReadingUpdateInfoData, $$ReadingUpdateInfoTableReferences),
    ReadingUpdateInfoData,
    PrefetchHooks Function({bool book_id})>;
typedef $$BookmarksFolderInfoTableCreateCompanionBuilder
    = BookmarksFolderInfoCompanion Function({
  Value<int> bookmarks_folder_id,
  required int book_id,
  required String bookmarks_folder_name,
  required String bookmarks_folder_color,
});
typedef $$BookmarksFolderInfoTableUpdateCompanionBuilder
    = BookmarksFolderInfoCompanion Function({
  Value<int> bookmarks_folder_id,
  Value<int> book_id,
  Value<String> bookmarks_folder_name,
  Value<String> bookmarks_folder_color,
});

final class $$BookmarksFolderInfoTableReferences extends BaseReferences<
    _$Database, $BookmarksFolderInfoTable, BookmarksFolderInfoData> {
  $$BookmarksFolderInfoTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BookInfoTableTable _book_idTable(_$Database db) =>
      db.bookInfoTable.createAlias($_aliasNameGenerator(
          db.bookmarksFolderInfo.book_id, db.bookInfoTable.book_id));

  $$BookInfoTableTableProcessedTableManager get book_id {
    final $_column = $_itemColumn<int>('book_id')!;

    final manager = $$BookInfoTableTableTableManager($_db, $_db.bookInfoTable)
        .filter((f) => f.book_id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_book_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$BookmarkInfoTable, List<BookmarkInfoData>>
      _bookmarkInfoRefsTable(_$Database db) =>
          MultiTypedResultKey.fromTable(db.bookmarkInfo,
              aliasName: $_aliasNameGenerator(
                  db.bookmarksFolderInfo.bookmarks_folder_id,
                  db.bookmarkInfo.bookmarks_folder_id));

  $$BookmarkInfoTableProcessedTableManager get bookmarkInfoRefs {
    final manager = $$BookmarkInfoTableTableManager($_db, $_db.bookmarkInfo)
        .filter((f) => f.bookmarks_folder_id.bookmarks_folder_id
            .sqlEquals($_itemColumn<int>('bookmarks_folder_id')!));

    final cache = $_typedResult.readTableOrNull(_bookmarkInfoRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BookmarksFolderInfoTableFilterComposer
    extends Composer<_$Database, $BookmarksFolderInfoTable> {
  $$BookmarksFolderInfoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get bookmarks_folder_id => $composableBuilder(
      column: $table.bookmarks_folder_id,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bookmarks_folder_name => $composableBuilder(
      column: $table.bookmarks_folder_name,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bookmarks_folder_color => $composableBuilder(
      column: $table.bookmarks_folder_color,
      builder: (column) => ColumnFilters(column));

  $$BookInfoTableTableFilterComposer get book_id {
    final $$BookInfoTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.book_id,
        referencedTable: $db.bookInfoTable,
        getReferencedColumn: (t) => t.book_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookInfoTableTableFilterComposer(
              $db: $db,
              $table: $db.bookInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> bookmarkInfoRefs(
      Expression<bool> Function($$BookmarkInfoTableFilterComposer f) f) {
    final $$BookmarkInfoTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bookmarks_folder_id,
        referencedTable: $db.bookmarkInfo,
        getReferencedColumn: (t) => t.bookmarks_folder_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarkInfoTableFilterComposer(
              $db: $db,
              $table: $db.bookmarkInfo,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BookmarksFolderInfoTableOrderingComposer
    extends Composer<_$Database, $BookmarksFolderInfoTable> {
  $$BookmarksFolderInfoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get bookmarks_folder_id => $composableBuilder(
      column: $table.bookmarks_folder_id,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bookmarks_folder_name => $composableBuilder(
      column: $table.bookmarks_folder_name,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bookmarks_folder_color => $composableBuilder(
      column: $table.bookmarks_folder_color,
      builder: (column) => ColumnOrderings(column));

  $$BookInfoTableTableOrderingComposer get book_id {
    final $$BookInfoTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.book_id,
        referencedTable: $db.bookInfoTable,
        getReferencedColumn: (t) => t.book_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookInfoTableTableOrderingComposer(
              $db: $db,
              $table: $db.bookInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BookmarksFolderInfoTableAnnotationComposer
    extends Composer<_$Database, $BookmarksFolderInfoTable> {
  $$BookmarksFolderInfoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get bookmarks_folder_id => $composableBuilder(
      column: $table.bookmarks_folder_id, builder: (column) => column);

  GeneratedColumn<String> get bookmarks_folder_name => $composableBuilder(
      column: $table.bookmarks_folder_name, builder: (column) => column);

  GeneratedColumn<String> get bookmarks_folder_color => $composableBuilder(
      column: $table.bookmarks_folder_color, builder: (column) => column);

  $$BookInfoTableTableAnnotationComposer get book_id {
    final $$BookInfoTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.book_id,
        referencedTable: $db.bookInfoTable,
        getReferencedColumn: (t) => t.book_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookInfoTableTableAnnotationComposer(
              $db: $db,
              $table: $db.bookInfoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> bookmarkInfoRefs<T extends Object>(
      Expression<T> Function($$BookmarkInfoTableAnnotationComposer a) f) {
    final $$BookmarkInfoTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bookmarks_folder_id,
        referencedTable: $db.bookmarkInfo,
        getReferencedColumn: (t) => t.bookmarks_folder_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarkInfoTableAnnotationComposer(
              $db: $db,
              $table: $db.bookmarkInfo,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BookmarksFolderInfoTableTableManager extends RootTableManager<
    _$Database,
    $BookmarksFolderInfoTable,
    BookmarksFolderInfoData,
    $$BookmarksFolderInfoTableFilterComposer,
    $$BookmarksFolderInfoTableOrderingComposer,
    $$BookmarksFolderInfoTableAnnotationComposer,
    $$BookmarksFolderInfoTableCreateCompanionBuilder,
    $$BookmarksFolderInfoTableUpdateCompanionBuilder,
    (BookmarksFolderInfoData, $$BookmarksFolderInfoTableReferences),
    BookmarksFolderInfoData,
    PrefetchHooks Function({bool book_id, bool bookmarkInfoRefs})> {
  $$BookmarksFolderInfoTableTableManager(
      _$Database db, $BookmarksFolderInfoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarksFolderInfoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookmarksFolderInfoTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookmarksFolderInfoTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> bookmarks_folder_id = const Value.absent(),
            Value<int> book_id = const Value.absent(),
            Value<String> bookmarks_folder_name = const Value.absent(),
            Value<String> bookmarks_folder_color = const Value.absent(),
          }) =>
              BookmarksFolderInfoCompanion(
            bookmarks_folder_id: bookmarks_folder_id,
            book_id: book_id,
            bookmarks_folder_name: bookmarks_folder_name,
            bookmarks_folder_color: bookmarks_folder_color,
          ),
          createCompanionCallback: ({
            Value<int> bookmarks_folder_id = const Value.absent(),
            required int book_id,
            required String bookmarks_folder_name,
            required String bookmarks_folder_color,
          }) =>
              BookmarksFolderInfoCompanion.insert(
            bookmarks_folder_id: bookmarks_folder_id,
            book_id: book_id,
            bookmarks_folder_name: bookmarks_folder_name,
            bookmarks_folder_color: bookmarks_folder_color,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BookmarksFolderInfoTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({book_id = false, bookmarkInfoRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (bookmarkInfoRefs) db.bookmarkInfo],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (book_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.book_id,
                    referencedTable:
                        $$BookmarksFolderInfoTableReferences._book_idTable(db),
                    referencedColumn: $$BookmarksFolderInfoTableReferences
                        ._book_idTable(db)
                        .book_id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bookmarkInfoRefs)
                    await $_getPrefetchedData<BookmarksFolderInfoData,
                            $BookmarksFolderInfoTable, BookmarkInfoData>(
                        currentTable: table,
                        referencedTable: $$BookmarksFolderInfoTableReferences
                            ._bookmarkInfoRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BookmarksFolderInfoTableReferences(db, table, p0)
                                .bookmarkInfoRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) =>
                                    e.bookmarks_folder_id ==
                                    item.bookmarks_folder_id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$BookmarksFolderInfoTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $BookmarksFolderInfoTable,
    BookmarksFolderInfoData,
    $$BookmarksFolderInfoTableFilterComposer,
    $$BookmarksFolderInfoTableOrderingComposer,
    $$BookmarksFolderInfoTableAnnotationComposer,
    $$BookmarksFolderInfoTableCreateCompanionBuilder,
    $$BookmarksFolderInfoTableUpdateCompanionBuilder,
    (BookmarksFolderInfoData, $$BookmarksFolderInfoTableReferences),
    BookmarksFolderInfoData,
    PrefetchHooks Function({bool book_id, bool bookmarkInfoRefs})>;
typedef $$BookmarkInfoTableCreateCompanionBuilder = BookmarkInfoCompanion
    Function({
  Value<int> bookmark_id,
  Value<int> bookmarks_folder_id,
  Value<String?> bookmark_title,
  required String bookmark_text,
});
typedef $$BookmarkInfoTableUpdateCompanionBuilder = BookmarkInfoCompanion
    Function({
  Value<int> bookmark_id,
  Value<int> bookmarks_folder_id,
  Value<String?> bookmark_title,
  Value<String> bookmark_text,
});

final class $$BookmarkInfoTableReferences
    extends BaseReferences<_$Database, $BookmarkInfoTable, BookmarkInfoData> {
  $$BookmarkInfoTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BookmarksFolderInfoTable _bookmarks_folder_idTable(_$Database db) =>
      db.bookmarksFolderInfo.createAlias($_aliasNameGenerator(
          db.bookmarkInfo.bookmarks_folder_id,
          db.bookmarksFolderInfo.bookmarks_folder_id));

  $$BookmarksFolderInfoTableProcessedTableManager get bookmarks_folder_id {
    final $_column = $_itemColumn<int>('bookmarks_folder_id')!;

    final manager =
        $$BookmarksFolderInfoTableTableManager($_db, $_db.bookmarksFolderInfo)
            .filter((f) => f.bookmarks_folder_id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bookmarks_folder_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BookmarkInfoTableFilterComposer
    extends Composer<_$Database, $BookmarkInfoTable> {
  $$BookmarkInfoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get bookmark_id => $composableBuilder(
      column: $table.bookmark_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bookmark_title => $composableBuilder(
      column: $table.bookmark_title,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bookmark_text => $composableBuilder(
      column: $table.bookmark_text, builder: (column) => ColumnFilters(column));

  $$BookmarksFolderInfoTableFilterComposer get bookmarks_folder_id {
    final $$BookmarksFolderInfoTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bookmarks_folder_id,
        referencedTable: $db.bookmarksFolderInfo,
        getReferencedColumn: (t) => t.bookmarks_folder_id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BookmarksFolderInfoTableFilterComposer(
              $db: $db,
              $table: $db.bookmarksFolderInfo,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BookmarkInfoTableOrderingComposer
    extends Composer<_$Database, $BookmarkInfoTable> {
  $$BookmarkInfoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get bookmark_id => $composableBuilder(
      column: $table.bookmark_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bookmark_title => $composableBuilder(
      column: $table.bookmark_title,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bookmark_text => $composableBuilder(
      column: $table.bookmark_text,
      builder: (column) => ColumnOrderings(column));

  $$BookmarksFolderInfoTableOrderingComposer get bookmarks_folder_id {
    final $$BookmarksFolderInfoTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.bookmarks_folder_id,
            referencedTable: $db.bookmarksFolderInfo,
            getReferencedColumn: (t) => t.bookmarks_folder_id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$BookmarksFolderInfoTableOrderingComposer(
                  $db: $db,
                  $table: $db.bookmarksFolderInfo,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$BookmarkInfoTableAnnotationComposer
    extends Composer<_$Database, $BookmarkInfoTable> {
  $$BookmarkInfoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get bookmark_id => $composableBuilder(
      column: $table.bookmark_id, builder: (column) => column);

  GeneratedColumn<String> get bookmark_title => $composableBuilder(
      column: $table.bookmark_title, builder: (column) => column);

  GeneratedColumn<String> get bookmark_text => $composableBuilder(
      column: $table.bookmark_text, builder: (column) => column);

  $$BookmarksFolderInfoTableAnnotationComposer get bookmarks_folder_id {
    final $$BookmarksFolderInfoTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.bookmarks_folder_id,
            referencedTable: $db.bookmarksFolderInfo,
            getReferencedColumn: (t) => t.bookmarks_folder_id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$BookmarksFolderInfoTableAnnotationComposer(
                  $db: $db,
                  $table: $db.bookmarksFolderInfo,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$BookmarkInfoTableTableManager extends RootTableManager<
    _$Database,
    $BookmarkInfoTable,
    BookmarkInfoData,
    $$BookmarkInfoTableFilterComposer,
    $$BookmarkInfoTableOrderingComposer,
    $$BookmarkInfoTableAnnotationComposer,
    $$BookmarkInfoTableCreateCompanionBuilder,
    $$BookmarkInfoTableUpdateCompanionBuilder,
    (BookmarkInfoData, $$BookmarkInfoTableReferences),
    BookmarkInfoData,
    PrefetchHooks Function({bool bookmarks_folder_id})> {
  $$BookmarkInfoTableTableManager(_$Database db, $BookmarkInfoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookmarkInfoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookmarkInfoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookmarkInfoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> bookmark_id = const Value.absent(),
            Value<int> bookmarks_folder_id = const Value.absent(),
            Value<String?> bookmark_title = const Value.absent(),
            Value<String> bookmark_text = const Value.absent(),
          }) =>
              BookmarkInfoCompanion(
            bookmark_id: bookmark_id,
            bookmarks_folder_id: bookmarks_folder_id,
            bookmark_title: bookmark_title,
            bookmark_text: bookmark_text,
          ),
          createCompanionCallback: ({
            Value<int> bookmark_id = const Value.absent(),
            Value<int> bookmarks_folder_id = const Value.absent(),
            Value<String?> bookmark_title = const Value.absent(),
            required String bookmark_text,
          }) =>
              BookmarkInfoCompanion.insert(
            bookmark_id: bookmark_id,
            bookmarks_folder_id: bookmarks_folder_id,
            bookmark_title: bookmark_title,
            bookmark_text: bookmark_text,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BookmarkInfoTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({bookmarks_folder_id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (bookmarks_folder_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.bookmarks_folder_id,
                    referencedTable: $$BookmarkInfoTableReferences
                        ._bookmarks_folder_idTable(db),
                    referencedColumn: $$BookmarkInfoTableReferences
                        ._bookmarks_folder_idTable(db)
                        .bookmarks_folder_id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BookmarkInfoTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $BookmarkInfoTable,
    BookmarkInfoData,
    $$BookmarkInfoTableFilterComposer,
    $$BookmarkInfoTableOrderingComposer,
    $$BookmarkInfoTableAnnotationComposer,
    $$BookmarkInfoTableCreateCompanionBuilder,
    $$BookmarkInfoTableUpdateCompanionBuilder,
    (BookmarkInfoData, $$BookmarkInfoTableReferences),
    BookmarkInfoData,
    PrefetchHooks Function({bool bookmarks_folder_id})>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$BooksFolderInfoTableTableTableManager get booksFolderInfoTable =>
      $$BooksFolderInfoTableTableTableManager(_db, _db.booksFolderInfoTable);
  $$AuthorsInfoTableTableTableManager get authorsInfoTable =>
      $$AuthorsInfoTableTableTableManager(_db, _db.authorsInfoTable);
  $$GenresInfoTableTableTableManager get genresInfoTable =>
      $$GenresInfoTableTableTableManager(_db, _db.genresInfoTable);
  $$BookInfoTableTableTableManager get bookInfoTable =>
      $$BookInfoTableTableTableManager(_db, _db.bookInfoTable);
  $$ReadingUpdateInfoTableTableManager get readingUpdateInfo =>
      $$ReadingUpdateInfoTableTableManager(_db, _db.readingUpdateInfo);
  $$BookmarksFolderInfoTableTableManager get bookmarksFolderInfo =>
      $$BookmarksFolderInfoTableTableManager(_db, _db.bookmarksFolderInfo);
  $$BookmarkInfoTableTableManager get bookmarkInfo =>
      $$BookmarkInfoTableTableManager(_db, _db.bookmarkInfo);
}
