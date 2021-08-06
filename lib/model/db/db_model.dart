mixin DbModel<T> {
  Map<String, dynamic> toJson() {
    print('toJson not implemented');
    return Map<String, dynamic>();
  }

  T? fromJson(Map<String, dynamic> json) {
    print('fromJson not implemented');
    return null;
  }

  final kTableName = 'table name not implemented';
  final kCreateTable = 'create table not implemented';
}
