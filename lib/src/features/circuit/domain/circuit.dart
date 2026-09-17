class Circuit {
  final String id;
  final String name;
  final String? description;
  final List<String>? tags;
  final List<String>? geotags;
  final String? country;
  final String? city;
  final String? lengthKm;
  final String? pitboxes;
  final String? run;
  final int? yearCreation;
  final String? highestPoint;
  final String? lowestPoint;
  final String? preview;
  final String? outline;
  final String? location;

  Circuit({
    required this.id,
    required this.name,
    this.description,
    this.tags,
    this.geotags,
    this.country,
    this.city,
    this.lengthKm,
    this.pitboxes,
    this.run,
    this.yearCreation,
    this.highestPoint,
    this.lowestPoint,
    this.preview,
    this.outline,
    this.location,
  });
}
