DateTime fromGraphQLTimestampToDartDateTime(int data) =>
    DateTime.fromMillisecondsSinceEpoch(data);
int fromDartDateTimeToGraphQLTimestamp(DateTime data) =>
    data.millisecondsSinceEpoch;

int? fromDartDateTimeNullableToGraphQLTimestampNullable(DateTime? datetime) =>
    datetime?.millisecondsSinceEpoch;

DateTime? fromGraphQLTimestampNullableToDartDateTimeNullable(
        int? milSinceEpoch) =>
    milSinceEpoch != null
        ? DateTime.fromMillisecondsSinceEpoch(milSinceEpoch)
        : null;
