import "./models/flashcard.dart";
import "dart:math";

final List categories = ["Process", "Valuation", "Accounting"];
final List subcategories = ["LBO", "DCF", "Comps", "Merger Model", "General"];
final List complexity = ["Basic", "Intermediate", "Advanced"];

var _dummyFlashcards = [];
var counter = 0;

void generateSeeds() {
  for (int i = 0; i < 10; i++) {
    Random random = new Random();

    var _editedFlashcard = Flashcard(
      id: i.toString(),
      category: categories[random.nextInt(3)],
      subcategory: subcategories[random.nextInt(5)],
      complexity: complexity[random.nextInt(3)],
      question: "Question $i",
      answer: "Answer $i",
    );

    _dummyFlashcards.add(_editedFlashcard);
  }
}

void generateLotsOfTextSeeds() {
  for (int i = 0; i < 10; i++) {
    Random random = new Random();

    var _editedFlashcard = Flashcard(
      id: i.toString(),
      category: categories[random.nextInt(3)],
      subcategory: subcategories[random.nextInt(5)],
      complexity: complexity[random.nextInt(3)],
      question: "Question ${i * 10}",
      answer:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
    );

    _dummyFlashcards.add(_editedFlashcard);
  }
}

List get dummyFlashcards {
  generateSeeds();
  generateLotsOfTextSeeds();
  return _dummyFlashcards;
}
