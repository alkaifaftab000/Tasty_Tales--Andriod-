class Recipe {
  final String? appLabel;
  final String? appImgurl;
  final double? appCalories;
  final String? appUrl;

  // New fields
  final String? source;
  final double? yield;
  final List<String>? dietLabels;
  final List<String>? healthLabels;
  final List<String>? cautions;
  final String? uri;
  final String? shareAs;

  Recipe({
    this.appLabel,
    this.appImgurl,
    this.appCalories,
    this.appUrl,
    this.source,
    this.yield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.uri,
    this.shareAs,
  });

  factory Recipe.fromMap(Map<String, dynamic> recipe) {
    return Recipe(
      appLabel: recipe['label'] as String?,
      appCalories: (recipe['calories'] as num?)?.toDouble(),
      appImgurl: recipe['image'] as String?,
      appUrl: recipe['url'] as String?,
      source: recipe['source'] as String?,
      yield: recipe['yield'] as double?,
      dietLabels: (recipe['dietLabels'] as List<dynamic>?)?.cast<String>(),
      healthLabels: (recipe['healthLabels'] as List<dynamic>?)?.cast<String>(),
      cautions: (recipe['cautions'] as List<dynamic>?)?.cast<String>(),
      uri: recipe['uri'] as String?,
      shareAs: recipe['shareAs'] as String?,
    );
  }
}
