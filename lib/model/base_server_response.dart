import 'dart:convert';

import 'package:equatable/equatable.dart';

class BaseServerResponse<T> extends Equatable {
  BaseServerResponse();

  T fromString(String? jsonString) {
    return fromJson(json.decode(jsonString!));
  }

  T fromJson(Map<dynamic, dynamic>? json) {
    return fromJson(json);
  }

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
