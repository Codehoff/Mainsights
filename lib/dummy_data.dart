import "./models/flashcard.dart";

var dummyFlashcards = [
  Flashcard(
    id: 'q1',
    question:
        'How can Chewbacca live on Endor with the Ewoks, when he is clearly a Wookie that should be on Kashyyk?',
    answer: "Oh well that is a good question, I don't know",
    category: Category.Process,
    complexity: Complexity.Advanced,
  ),
  Flashcard(
    id: 'q2',
    question: 'What is your name?',
    answer: "'tis Arthur, King of the Britains",
    category: Category.Process,
    complexity: Complexity.Indermediate,
  ),
  Flashcard(
    id: 'q3',
    question: 'What is your quest?',
    answer: "To seek the holy grail!",
    category: Category.Valuation,
    complexity: Complexity.Basic,
  ),
];
