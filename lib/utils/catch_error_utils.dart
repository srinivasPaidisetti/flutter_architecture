import 'package:flutter/foundation.dart';

T? catchError<T>(ValueGetter<T> run,
    {T? defaultValue, String? tag, ValueSetter<Error>? catchBlock}) {
  try {
    var output;
    Future.sync(() {
      output = run();
    }).catchError((error) {
      if (catchBlock != null) {
        print('handled -> ${'$tag :' ?? ''}$error');
        catchBlock(error);
      } else {
        print('${tag ?? 'catchError'} : $error');
      }
    });
    return output;
  } catch (error) {
    if (catchBlock != null) {
      print('handled -> ${'$tag :' ?? ''}$error');
      catchBlock(error as Error);
    } else {
      print('${tag ?? 'catchError'} : $error');
    }
  }

  return defaultValue;
}
