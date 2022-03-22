const Duration maxCacheAge = Duration(hours: 1);

class CachedResponse {
  final dynamic responseData;
  final DateTime age;

  CachedResponse({
    required this.responseData,
    required this.age,
  });

  bool get isValid => DateTime.now().isBefore(age.add(maxCacheAge));

  factory CachedResponse.fromJson(Map<String, dynamic> json) {
    return CachedResponse(
      responseData: json['responseData'],
      age: DateTime.parse(json['age']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'responseData': responseData,
      'age': age.toString(),
    };
  }
}
