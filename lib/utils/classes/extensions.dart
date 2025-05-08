extension StringCasingExtension on String {
  String get capitalizeFirstLetterOfEachWord {
    return split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}