// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task.dart';

class TaskStatusMapper extends EnumMapper<TaskStatus> {
  TaskStatusMapper._();

  static TaskStatusMapper? _instance;
  static TaskStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskStatusMapper._());
    }
    return _instance!;
  }

  static TaskStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TaskStatus decode(dynamic value) {
    switch (value) {
      case r'toDo':
        return TaskStatus.toDo;
      case r'inProgress':
        return TaskStatus.inProgress;
      case r'completed':
        return TaskStatus.completed;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TaskStatus self) {
    switch (self) {
      case TaskStatus.toDo:
        return r'toDo';
      case TaskStatus.inProgress:
        return r'inProgress';
      case TaskStatus.completed:
        return r'completed';
    }
  }
}

extension TaskStatusMapperExtension on TaskStatus {
  String toValue() {
    TaskStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TaskStatus>(this) as String;
  }
}

class TaskPriorityMapper extends EnumMapper<TaskPriority> {
  TaskPriorityMapper._();

  static TaskPriorityMapper? _instance;
  static TaskPriorityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskPriorityMapper._());
    }
    return _instance!;
  }

  static TaskPriority fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TaskPriority decode(dynamic value) {
    switch (value) {
      case r'low':
        return TaskPriority.low;
      case r'medium':
        return TaskPriority.medium;
      case r'high':
        return TaskPriority.high;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TaskPriority self) {
    switch (self) {
      case TaskPriority.low:
        return r'low';
      case TaskPriority.medium:
        return r'medium';
      case TaskPriority.high:
        return r'high';
    }
  }
}

extension TaskPriorityMapperExtension on TaskPriority {
  String toValue() {
    TaskPriorityMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TaskPriority>(this) as String;
  }
}

class TaskMapper extends ClassMapperBase<Task> {
  TaskMapper._();

  static TaskMapper? _instance;
  static TaskMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskMapper._());
      TaskStatusMapper.ensureInitialized();
      TaskPriorityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Task';

  static String _$id(Task v) => v.id;
  static const Field<Task, String> _f$id = Field('id', _$id);
  static String _$title(Task v) => v.title;
  static const Field<Task, String> _f$title = Field('title', _$title);
  static String _$description(Task v) => v.description;
  static const Field<Task, String> _f$description =
      Field('description', _$description);
  static DateTime _$startDate(Task v) => v.startDate;
  static const Field<Task, DateTime> _f$startDate =
      Field('startDate', _$startDate);
  static DateTime _$endDate(Task v) => v.endDate;
  static const Field<Task, DateTime> _f$endDate = Field('endDate', _$endDate);
  static TaskStatus _$status(Task v) => v.status;
  static const Field<Task, TaskStatus> _f$status = Field('status', _$status);
  static String _$time(Task v) => v.time;
  static const Field<Task, String> _f$time = Field('time', _$time);
  static String _$userId(Task v) => v.userId;
  static const Field<Task, String> _f$userId = Field('userId', _$userId);
  static TaskPriority _$priority(Task v) => v.priority;
  static const Field<Task, TaskPriority> _f$priority =
      Field('priority', _$priority);

  @override
  final MappableFields<Task> fields = const {
    #id: _f$id,
    #title: _f$title,
    #description: _f$description,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #status: _f$status,
    #time: _f$time,
    #userId: _f$userId,
    #priority: _f$priority,
  };

  static Task _instantiate(DecodingData data) {
    return Task(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        status: data.dec(_f$status),
        time: data.dec(_f$time),
        userId: data.dec(_f$userId),
        priority: data.dec(_f$priority));
  }

  @override
  final Function instantiate = _instantiate;

  static Task fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Task>(map);
  }

  static Task deserialize(String json) {
    return ensureInitialized().decodeJson<Task>(json);
  }
}

mixin TaskMappable {
  String serialize() {
    return TaskMapper.ensureInitialized().encodeJson<Task>(this as Task);
  }

  Map<String, dynamic> toJson() {
    return TaskMapper.ensureInitialized().encodeMap<Task>(this as Task);
  }

  TaskCopyWith<Task, Task, Task> get copyWith =>
      _TaskCopyWithImpl<Task, Task>(this as Task, $identity, $identity);
  @override
  String toString() {
    return TaskMapper.ensureInitialized().stringifyValue(this as Task);
  }

  @override
  bool operator ==(Object other) {
    return TaskMapper.ensureInitialized().equalsValue(this as Task, other);
  }

  @override
  int get hashCode {
    return TaskMapper.ensureInitialized().hashValue(this as Task);
  }
}

extension TaskValueCopy<$R, $Out> on ObjectCopyWith<$R, Task, $Out> {
  TaskCopyWith<$R, Task, $Out> get $asTask =>
      $base.as((v, t, t2) => _TaskCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TaskCopyWith<$R, $In extends Task, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? title,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      TaskStatus? status,
      String? time,
      String? userId,
      TaskPriority? priority});
  TaskCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Task, $Out>
    implements TaskCopyWith<$R, Task, $Out> {
  _TaskCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Task> $mapper = TaskMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? title,
          String? description,
          DateTime? startDate,
          DateTime? endDate,
          TaskStatus? status,
          String? time,
          String? userId,
          TaskPriority? priority}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (description != null) #description: description,
        if (startDate != null) #startDate: startDate,
        if (endDate != null) #endDate: endDate,
        if (status != null) #status: status,
        if (time != null) #time: time,
        if (userId != null) #userId: userId,
        if (priority != null) #priority: priority
      }));
  @override
  Task $make(CopyWithData data) => Task(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      description: data.get(#description, or: $value.description),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate),
      status: data.get(#status, or: $value.status),
      time: data.get(#time, or: $value.time),
      userId: data.get(#userId, or: $value.userId),
      priority: data.get(#priority, or: $value.priority));

  @override
  TaskCopyWith<$R2, Task, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TaskCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
