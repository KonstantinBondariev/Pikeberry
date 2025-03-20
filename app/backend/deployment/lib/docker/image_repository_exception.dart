class InvalidImageException implements Exception {
  final String message;

  InvalidImageException(this.message);

  @override
  String toString() => 'InvalidImageException: $message';
}
