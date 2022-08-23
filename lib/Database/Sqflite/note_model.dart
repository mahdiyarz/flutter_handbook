final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    id,
    isImportant,
    number,
    title,
    description,
    createdTime,
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String createdTime = 'createdTime';
}

class NoteModel {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const NoteModel({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  NoteModel copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      NoteModel(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static NoteModel fromJson(Map<String, Object?> myJson) => NoteModel(
        id: myJson[NoteFields.id] as int?,
        isImportant: myJson[NoteFields.isImportant] == 1 ? true : false,
        number: myJson[NoteFields.number] as int,
        title: myJson[NoteFields.title] as String,
        description: myJson[NoteFields.description] as String,
        createdTime: DateTime.parse(myJson[NoteFields.createdTime] as String),
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.number: number,
        NoteFields.title: title,
        NoteFields.description: description,
        NoteFields.createdTime: createdTime.toIso8601String(),
      };
}
