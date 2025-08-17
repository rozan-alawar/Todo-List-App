import 'package:dart_mappable/dart_mappable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class XFileToMultipartFileHook extends MappingHook {
  const XFileToMultipartFileHook();

  @override
  Object? beforeEncode(Object? value) {
    if (value is XFile) {
      return _multipartFromFile(value);
    }
    return value;
  }
}

MultipartFile _multipartFromFile(XFile file) {
  return MultipartFile.fromFileSync(
    file.path,
    filename: path.basename(file.path),
  );
}

class TimeOfDayHook extends MappingHook {
  const TimeOfDayHook();

  @override
  Object? beforeEncode(Object? value) {
    if (value is String) {
      final parts = value.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      return TimeOfDay(hour: hour, minute: minute);
    }
    return super.beforeEncode(value);
  }

  @override
  Object? beforeDecode(Object? value) {
    if (value is TimeOfDay) {
      return '${value.hour}:${value.minute}';
    }
    return super.beforeDecode(value);
  }
}

class ConvertorDateHook extends MappingHook {
  const ConvertorDateHook();

  @override
  Object? beforeEncode(Object? value) {
    if (value is DateTime) {
      return value.toUtc();
    }
    return value;
  }

  @override
  Object? beforeDecode(Object? value) {
    if (value is String && isValidDate(value)) {
      return DateTime.parse(value).toLocal();
    }
    return value;
  }
}

bool isValidDate(String input) {
  try {
    DateTime.parse(input);
    return true;
  } catch (e) {
    throw Exception('Invalid date: $input  - $e');
  }
}

class DateTimeRangeHook extends MappingHook {
  const DateTimeRangeHook({this.startKey = 'start_time', this.endKey = 'end_time'});

  final String startKey;
  final String endKey;

  @override
  Object? beforeDecode(Object? value) {
    if (value is Map) {
      return DateTimeRange(
        start: DateTime.parse(value[startKey] as String),
        end: DateTime.parse(value[endKey] as String),
      );
    }
    return value;
  }
}
