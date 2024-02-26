part of './sabowsla_stream_builder.dart';

class SabowslaStreamFilterBuilder extends SabowslaStreamBuilder {
  SabowslaStreamFilterBuilder({
    required super.queryBuilder,
    required super.realtimeTopic,
    required super.realtimeClient,
    required super.schema,
    required super.table,
    required super.primaryKey,
  });

  /// Filters the results where [column] equals [value].
  ///
  /// Only one filter can be applied to `.stream()`.
  ///
  /// ```dart
  /// sabowsla.from('users').stream(primaryKey: ['id']).eq('name', 'Sabowsla');
  /// ```
  SabowslaStreamBuilder eq(String column, Object value) {
    _streamFilter = _StreamPostgrestFilter(
      type: PostgresChangeFilterType.eq,
      column: column,
      value: value,
    );
    return this;
  }

  /// Filters the results where [column] does not equal [value].
  ///
  /// Only one filter can be applied to `.stream()`.
  ///
  /// ```dart
  /// sabowsla.from('users').stream(primaryKey: ['id']).neq('name', 'Sabowsla');
  /// ```
  SabowslaStreamBuilder neq(String column, Object value) {
    _streamFilter = _StreamPostgrestFilter(
      type: PostgresChangeFilterType.neq,
      column: column,
      value: value,
    );
    return this;
  }

  /// Filters the results where [column] is less than [value].
  ///
  /// Only one filter can be applied to `.stream()`.
  ///
  /// ```dart
  /// sabowsla.from('users').stream(primaryKey: ['id']).lt('likes', 100);
  /// ```
  SabowslaStreamBuilder lt(String column, Object value) {
    _streamFilter = _StreamPostgrestFilter(
      type: PostgresChangeFilterType.lt,
      column: column,
      value: value,
    );
    return this;
  }

  /// Filters the results where [column] is less than or equal to [value].
  ///
  /// Only one filter can be applied to `.stream()`.
  ///
  /// ```dart
  /// sabowsla.from('users').stream(primaryKey: ['id']).lte('likes', 100);
  /// ```
  SabowslaStreamBuilder lte(String column, Object value) {
    _streamFilter = _StreamPostgrestFilter(
      type: PostgresChangeFilterType.lte,
      column: column,
      value: value,
    );
    return this;
  }

  /// Filters the results where [column] is greater than [value].
  ///
  /// Only one filter can be applied to `.stream()`.
  ///
  /// ```dart
  /// sabowsla.from('users').stream(primaryKey: ['id']).gt('likes', '100');
  /// ```
  SabowslaStreamBuilder gt(String column, Object value) {
    _streamFilter = _StreamPostgrestFilter(
      type: PostgresChangeFilterType.gt,
      column: column,
      value: value,
    );
    return this;
  }

  /// Filters the results where [column] is greater than or equal to [value].
  ///
  /// Only one filter can be applied to `.stream()`.
  ///
  /// ```dart
  /// sabowsla.from('users').stream(primaryKey: ['id']).gte('likes', 100);
  /// ```
  SabowslaStreamBuilder gte(String column, Object value) {
    _streamFilter = _StreamPostgrestFilter(
      type: PostgresChangeFilterType.gte,
      column: column,
      value: value,
    );
    return this;
  }

  /// Filters the results where [column] is included in [value].
  ///
  /// Only one filter can be applied to `.stream()`.
  ///
  /// ```dart
  /// sabowsla.from('users').stream(primaryKey: ['id']).inFilter('name', ['Andy', 'Amy', 'Terry']);
  /// ```
  SabowslaStreamBuilder inFilter(String column, List<Object> values) {
    _streamFilter = _StreamPostgrestFilter(
      type: PostgresChangeFilterType.inFilter,
      column: column,
      value: values,
    );
    return this;
  }
}
