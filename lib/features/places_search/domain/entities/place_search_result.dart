class PlaceSearchResult {
  const PlaceSearchResult({
    required this.placeId,
    required this.description,
  });

  final String placeId;
  final String description;

  @override
  String toString() {
    return 'PlaceSearchResult{placeId: $placeId, description: $description}';
  }
}
