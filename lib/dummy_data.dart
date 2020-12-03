import "./models/flashcard.dart";
import "dart:math";

final List _flashcards = [
  Flashcard(
    id: "1",
    question: "What is Equity Value?",
    answer:
        "The Equity Value, also called Market Capitalization or Market Cap refers to the market value of the the shareholders' interest in the company. Commonly, the shareholders' interest is just called equity and refers to the issued shares of the company.",
    complexity: "Basic",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "2",
    question: "How do you calculate Equity Value?",
    answer:
        "The Equity Value is calculated by multiplying the shares outstanding by the share price observed in the market.",
    complexity: "Basic",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "3",
    question: "What is Shareholders' Equity?",
    answer:
        "Shareholders' Equity is a balance sheet position which quantifies the remaining (residual) claim on the company's assets after servicing debt investors. ",
    complexity: "Basic",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "4",
    question: "What is Enterprise Value?",
    answer:
        "Enterprise Value is the value assigned to a company attributable to all investors (traditionally, both equity and debt investors).",
    complexity: "Basic",
    category: "Valuation",
    subcategory: "General",
  ),
];

List get dummyFlashcards {
  return _flashcards;
}

/* final List categories = ["Process", "Valuation", "Accounting"];
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
 */
