import "./models/flashcard.dart";

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
  Flashcard(
    id: "5",
    question: "What are the three key financial statements?",
    answer:
        "The three key financial statements are the Balance Sheet, the Income Statement and the Cash Flow Statement.",
    complexity: "Basic",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "6",
    question: "What are the other financial statements?",
    answer:
        "According to the International Financial Reporting Standards (IFRS), there are six financial statements: the three key financial statements (income statement, balance sheet and cash flow statement) and the Financial Statement of Comprehensive Income, the Financial statement of changes in equity and Notes.",
    complexity: "Intermediate",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "7",
    question: "How do the three financial statements connect?",
    answer:
        "First, the Net Income from the Income Statement links to the Shareholders' Equity (Retained Earnings) on the Balance Sheet and is at the same time the first line on the Cash Flow Statement. Second, changes in the various Balance Sheet positions link to the three sections of the Cash Flow Statement. Third, the net change in cash (which is the final line on the Cash Flow Statement) links back to the Balance Sheet. ",
    complexity: "Basic",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "8",
    question:
        "Which business situation triggers only changes in two of the three key financial statements?",
    answer:
        "Anything that flows through the income statement links automatically to the other two financial statements. As such the common business situation in which only two statements are affected are earnings-neutral activities such as buying inventory with cash or paying accounts payable with debt (Aktiv- und Passivtausch).",
    complexity: "Intermediate",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "9",
    question: "What is the Equity-to-EV bridge?",
    answer:
        "The Equity-to-EV bridge leads to the Enterprise Value by adding the net debt position to the Equity Value (e.g. which can be easily observered for public companies).",
    complexity: "Basic",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "10",
    question:
        "What is the difference between the EV-to-Equity bridge and the Equity-to-EV bridge?",
    answer:
        "The only difference between the two bridges is the starting point. Whereas the Equity-to-EV bridge starts with the Equity Value, adds the net debt and thus leads to the Enterprise Value, the respective is true for the EV-to-Equity bridge.",
    complexity: "Basic",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "11",
    question:
        "What is the common range of values Terminal Value can assume of EV (in %)?",
    answer:
        "The terminal value (TV) is often a critical component of the EV assuming values commonly above 50% up to 80% or 90% as the prepetual forecast overweights the relatively short projection period.",
    complexity: "Intermediate",
    category: "Valuation",
    subcategory: "DCF",
  ),
  Flashcard(
    id: "12",
    question:
        "Can you imagine a situation in which the Terminal value can assume values greater than 100% of EV?",
    answer:
        "The TV can also assume values above 100% (e.g. negative cash flows during the holding period that are offset by the positive TV can yield a TV weight higher than 100%).",
    complexity: "Advanced",
    category: "Valuation",
    subcategory: "DCF",
  ),
  Flashcard(
    id: "13",
    question: "What are the components of Shareholders' Equity?",
    answer:
        "There are five components according to IFRS a) Common Stock b) Additional Paid-In Capital c) Retained Earnings d) Accumulated Other Comprehensive Income e) Treasury Stock.",
    complexity: "Intermediate",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "14",
    question: "How do you recognize dividends on the balance sheet?",
    answer:
        "Dividends are paid out of the Retained Earnings. Retained Earnings is one of the five positions within the shareholders' equity balance sheet position.",
    complexity: "Intermediate",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "15",
    question:
        "How do you calculate the retained earnings position within the shareholders' equity?",
    answer:
        "This year's retained earnings are calculated by starting with last year's retained earnings, adding this year's net income and (if any) subtract dividends paid.",
    complexity: "Intermediate",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "16",
    question:
        "What does pro forma mean in the context of financial statements?",
    answer:
        "Pro forma - financial statements / financial figures / metrics are based on assumptions / projections and are not “real”, e.g. they are hypothetical. Common examples are M&A pro-forma full year figures even though the target was acquired within the year and financial figures excluding certain events such as restructuring or legislation effects. ",
    complexity: "Intermediate",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "17",
    question: "Why do companies provide pro forma metrics?",
    answer:
        "Companies provide pro-forma metrics because in their view, the self-chosen metrics better / more accurately describe and present the business performance. Inherently, in such process is the idea that a company can make itself more attractive to potential investors by presenting its results in a more attractive way.",
    complexity: "Intermediate",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "18",
    question: "How do you calculate Last Twelve Month?",
    answer:
        "LTM is calculated by starting with the most recent quarterly figures, e.g. Q1 / Q1-Q2 / Q1-Q3 figures, adding the most recent annual figures and subtracting the last quarterly figures, e.g. Q1 / Q1-Q2 / Q1-Q3 figures. ",
    complexity: "Intermediate",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "19",
    question: "What are dilutive securities?",
    answer:
        "Commonly, dilutive securities are options, warrants and convertible securities (e.g. convertible bonds and convertible preferred stock).",
    complexity: "Intermediate",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "20",
    question: "What is the Parri Passu clause?",
    answer:
        "The Parri Passu clause refers to debt agreement and describes the hierarchy of lenders. Parri passu refers to the situation in which intra-instrument lenders are considered to be equal (in terms of claiming the companys assets). The only difference between lenders arises for example between senior or junior debt. ",
    complexity: "Advanced",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "21",
    question:
        "How do you recognise pension plan overfunding in the Equity-to-EV bridge?",
    answer:
        "Generally, you would consider pension plan overfunding as cash in the equity-to-EV bridge. The logical explanation behind such assumption is that you don’t have to provide cash in the future to fulfil the pension obligations (to the extent of the overfunding).",
    complexity: "Advanced",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "22",
    question:
        "What is a common rule of thumb for estimating the effect of dilutive securities (in % of basic share count)?",
    answer:
        "A common rule of thumb is roughly 10%, whereas higher or lower figures are also plausible and widely seen. Just having a rough feeling for what would be considered rather high and rather low is helpful.",
    complexity: "Intermediate",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "23",
    question: "What is a Discounted Cash Flow analysis?",
    answer:
        "A Discounted Cash Flow (DCF) analysis yields the present value of a company by discounting its future cash flows. This analysis is commonly based on a summation of one (or multiple) projection period(s) and an assigned terminal value.",
    complexity: "Basic",
    category: "Valuation",
    subcategory: "DCF",
  ),
  Flashcard(
    id: "24",
    question: "Are there other components in the WACC calculation?",
    answer:
        "The WACC calculation refers usually to the cost of equity and cost of debt. In case other financing resources such as preferred stock are used by the company, it is important to recognise those as well. The process of weighing each financing instrument's cost remains unchanged no matter how many different financing instruments are considered as part of the WACC calculation.",
    complexity: "Intermediate",
    category: "Valuation",
    subcategory: "DCF",
  ),
  Flashcard(
    id: "25",
    question: "What is an IPO?",
    answer:
        "IPO stands for Initial Public Offering and describes the process of a previously private company trading on a stock exchange, e.g. going public for the first time.",
    complexity: "Basic",
    category: "Process",
    subcategory: "General",
  ),
  Flashcard(
    id: "26",
    question: "What is a payment-in-kind loan?",
    answer:
        "The payment-in-kind (PIK) loan refers to a debt instrument in which the debtor doesn’t have to pay interest in cash. Rather than paying interest in cash, alternatively the interest can be paid in other securities (such as stock options) or more commonly as accrued interest (which increases consequently the outstanding debt balance). Often shareholder loans are structured as accruing PIK loans.",
    complexity: "Intermediate",
    category: "Valuation",
    subcategory: "LBO",
  ),
  Flashcard(
    id: "27",
    question:
        "Imagine a valuation based on a relevant, specific industry multiple. Would you rather use EV or Equity Value?",
    answer:
        "Generally, you would refer to EV-multiples as most specific industry multiple metrics can't be distinguished between value attributable to equity investors and all investors. Thus, you would create a specific EV / industry-metric multiple.",
    complexity: "Basic",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "28",
    question:
        "Imagine a situation in which you can choose between various research reports for your forecasts, which one do you choose?",
    answer:
        "Generally, you would always favour the most detailed and most comprehensive research reports. Sometimes it makes sense to exclude certain brokers / research reports (e.g. even though being very detailed) because for example they are outdated (e.g. published before a material event happened) or show totally different forecasts and projections. In case the forecasts and projections differ significantly from other reports, it is crucial to understand the underlying reasons and if plausible to consider those forecasts as a different scenarios.",
    complexity: "Basic",
    category: "Process",
    subcategory: "General",
  ),
  Flashcard(
    id: "29",
    question: "What's the difference between gross and net CAPEX?",
    answer:
        "Gross CAPEX refers only to the cash outflow (investments) associated with fixed assets, whereas net CAPEX refers to both the cash outflow and cash inflow (divestments) associated with fixed assets.",
    complexity: "Intermediate",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "30",
    question: "What is the interest deduction limit (Zinsschranke)?",
    answer:
        "The interest deduction limit (Zinsschranke) refers to the maximum amount of interest that is tax-deductible and thus limits the tax-shield effect of debt. Commonly, the sum of both interest income and 30% of operating income are considered to be the maximum interest expense amount that is tax-deductible (e.g. 100 operating income and 10 interest income leads to a maximum of 40 interest expense that is tax-deductible).",
    complexity: "Advanced",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "31",
    question: "Why do think buying an overvalued company makes sense?",
    answer:
        "This question links back to the difference between price and value. Commonly, a company is considered overvalued based on certain multiples such as P/E, EV/EBITDA or others and is an individual interpretation of the price. The price (e.g. market cap) is easily observable whereas the individual value for prospective buyers is not. That discrepancy opens the possibility that a company that is considered overvalued by one party is undervalued (e.g. highly valuable) for another party.",
    complexity: "Intermediate",
    category: "Process",
    subcategory: "General",
  ),
  Flashcard(
    id: "32",
    question: "What are real options?",
    answer:
        "Real options are based on financial options translated into the real world. Real options give a company‘s management (or any other descision maker) the contractual decision power to among other possibilites postpone / accelerate / switch and terminate business activities such as opening new stores, extending the lease or pre-terminating a lease contract. ",
    complexity: "Basic",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "33",
    question:
        "What are the different ways of accounting for an interest / investment in another company?",
    answer:
        "There are three different ways to reflect an interest / investment in another company. The cost method, the equity method and the consolidation method.",
    complexity: "Basic",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "34",
    question: "What is the difference between value and price?",
    answer:
        "Price is the amount of money paid or requested for the asset / company and observable or determined through negotiations. Value is an abstract and individual figure that is associated to assets / companies and mostly differs for each party (e.g. respective usefulness for the buyer / synergies for a strategic investor). Think of Oskar Wilde who is credited with saying 'Nowadays people know the price of everything and the value of nothing'.",
    complexity: "Intermediate",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "35",
    question: "What does MD&A stand for?",
    answer:
        "MD&A stands for Management Discussion and Analysis and is part of the annual report. The MD&A is a qualitative and quantitative assessment of the company's performance in all material aspects.",
    complexity: "Intermediate",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "36",
    question: "What does IFRS stand for?",
    answer:
        "IFRS stands for International Financial Reporting Standards and are developed and published by the International Accounting Standards Board (IASB).",
    complexity: "Basic",
    category: "Accounting",
    subcategory: "General",
  ),
  Flashcard(
    id: "37",
    question:
        "What is the difference between Gordon-Growth formula and perpetuity (perpetual annuity)?",
    answer:
        "A perpetuity describes a constant cash flow that continues into perpetuity. The Gordon-Growth formula also describe a perpetual cash flow, but additionally accounts for constant growth of that cash flow.",
    complexity: "Intermediate",
    category: "Valuation",
    subcategory: "General",
  ),
  Flashcard(
    id: "38",
    question:
        "Why would a financial investor choose to conduct an all-equity transaction?",
    answer:
        "The financial investor would choose to conduct an all-equity transaction to increase the transaction certainty and thereby make its offer more attractive to the seller. Further, the financial investor is in a stronger position to negotiate with debt providers in case he is already in control of the asset. This extraordinary process requires a certain fund structure that allows for that kind of process.",
    complexity: "Advanced",
    category: "Process",
    subcategory: "General",
  ),
  Flashcard(
    id: "39",
    question:
        "What is the rationale behind presenting the results of a DCF expressed with implied multiples?",
    answer:
        "Presenting the valuation results of a DCF provides a better informed way to compare the valuation and thus also gain a sense check. As the DCF results in a value for a specific company that value does not yield any insights whether the valuation is high, low or in line with peers. Expressing the valuation results with implied multiples permits the comparison with the CCA and CTA analyses. ",
    complexity: "Intermediate",
    category: "Valuation",
    subcategory: "DCF",
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
