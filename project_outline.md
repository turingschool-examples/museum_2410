# Museum Project Outline

## 1. Overview and Goals

- My goal for this project is to create classes that model museum-related objects and behaviors, including visitors, exhibits, and patron interests.
- I’ll be implementing core classes such as `Museum`, `Exhibit`, and `Patron`, which will interact to reflect visitors' interests in specific exhibits within the museum.

## 2. Core Components and Class Overview

- **Patron**: Represents museum visitors, with attributes for each patron's name and interests.
- **Exhibit**: Models the exhibits available at the museum, with properties such as `name` and `cost`.
- **Museum**: Manages the museum's exhibits and interactions, handling tasks such as admitting patrons and managing revenue generated from exhibit admissions.

## 3. Project Requirements (TDD Approach)

- **Patron Tests**: I will develop test cases for `Patron` attributes (`name` and `interests`) and for behaviors related to adding interests.
- **Exhibit Tests**: I’ll write tests to ensure that exhibit properties, specifically `name` and `cost`, are accessible and correct.
- **Museum Tests**: I’ll write tests for `Museum` methods that manage adding patrons, processing payments, and listing exhibits based on visitor interests.

## 4. Suggested Flow

- I’ll begin with the `Exhibit` class and its tests, as this class is simpler and foundational to the museum structure.
- Next, I’ll move on to the `Patron` class to implement patron interests.
- Finally, I’ll build out the `Museum` class, which integrates both exhibits and patrons to complete the project.

## 5. Documentation and Code Comments

- I’ll use structured comments and annotations within the code, but I plan to hold off on detailed commenting until I have all functionality implemented.
- I’ll consider adding additional markdown files to document each class and test structure to provide clarity and organization.


Iteration 3: Exhibit Interests and Lottery

	•	Objectives:
	•	Extend the Museum class to handle:
	•	patrons_by_exhibit_interest: Returns a hash mapping exhibits to patrons interested in them.
	•	ticket_lottery_contestants: Identifies patrons with insufficient funds but interest in specific exhibits.
	•	draw_lottery_winner and announce_lottery_winner: Randomly select a lottery winner from contestants.

Iteration 4: Admission and Revenue Tracking

	•	Objectives:
	•	Update Museum so patrons can attend exhibits based on available funds and interests, prioritizing higher-cost exhibits.
	•	Track revenue and generate a patrons_of_exhibits hash showing which patrons attended each exhibit.
	•	Implement a revenue method to calculate the total collected from patron spending.
