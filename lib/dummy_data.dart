import "./models/flashcard.dart";

var dummyFlashcards = [
  Flashcard(
    id: 'q1',
    question: 'What is your name?',
    answer: "'tis Arthur, King of the Britains'",
    category: Category.Process,
    complexity: Complexity.Advanced,
  ),
  Flashcard(
    id: 'q2',
    question: 'What is your quest?',
    answer: "To seek the holy grail!",
    category: Category.Process,
    complexity: Complexity.Indermediate,
  ),
  Flashcard(
    id: 'q3',
    question: 'What is the airspeed velocity of an unladen swallow?',
    answer: "What do you mean? African or american swallow?",
    category: Category.Valuation,
    complexity: Complexity.Basic,
  ),
];
