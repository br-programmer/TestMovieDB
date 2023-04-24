extension IntX on int {
  String get gender {
    switch (this) {
      case 1:
        return 'Female';
      default:
        return 'Male';
    }
  }
}
