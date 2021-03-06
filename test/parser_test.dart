import 'package:test/test.dart';
import 'package:cmustify/src/parser.dart';

main() {
  group('Status', () {
    test('should parse status', () {
      var parser = new Parser();

      var result = parser.parse("status playing");

      expect(result.getTagValue("status"), "playing");
    });

    test('should support multiple words status', () {
      var parser = new Parser();

      var result = parser.parse("status playing loud");

      expect(result.getTagValue("status"), "playing loud");
    });

    test('should support status with title', () {
      var parser = new Parser();

      var result = parser.parse("status playing loud title Dance");

      expect(result.getTagValue("status"), "playing loud");
    });
  });

  group('Title', () {
    test('should support title', () {
      var parser = new Parser();

      var result = parser.parse("title Dancing with the stars");

      expect(result.getTagValue("title"), "Dancing with the stars");
    });
    test('should support multiple words title', () {
      var parser = new Parser();

      var result = parser.parse("status playing title Dancing with the stars");

      expect(result.getTagValue("title"), "Dancing with the stars");
    });
  });
  group('Album', () {
    test('should support Album', () {
      var parser = new Parser();

      var result = parser
          .parse("status playing title Dancing with the stars album Best hits");

      expect(result.getTagValue("album"), "Best hits");
    });
  });
}
