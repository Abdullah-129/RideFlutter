DateTime fromGraphQLDateTimeToDartDateTime(int data) =>
    DateTime.fromMillisecondsSinceEpoch(data);
int fromDartDateTimeToGraphQLDateTime(DateTime data) =>
    data.millisecondsSinceEpoch;

int? fromDartDateTimeNullableToGraphQLDateTimeNullable(DateTime? datetime) =>
    datetime?.millisecondsSinceEpoch;

DateTime? fromGraphQLDateTimeNullableToDartDateTimeNullable(
        int? milSinceEpoch) =>
    milSinceEpoch != null
        ? DateTime.fromMillisecondsSinceEpoch(milSinceEpoch)
        : null;
