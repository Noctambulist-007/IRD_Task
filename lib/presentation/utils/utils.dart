String arabicToBengali(int number) {
  final bengaliNumerals = ['১', '২', '৩', '৪', '৫', '৬', '৭'];
  final arabicString = number.toString();
  final StringBuffer bengaliBuffer = StringBuffer();
  for (int i = 0; i < arabicString.length; i++) {
    bengaliBuffer.write(bengaliNumerals[int.parse(arabicString[i]) - 1]);
  }
  return bengaliBuffer.toString();
}