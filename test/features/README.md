# Acceptance tests

Acceptance tests for CKAN - Data Curator integration are 

- written using the [Gherkin language](https://cucumber.io/docs/reference#gherkin) 
- [stored in GitHub](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/test/features).
- [shared](https://app.cucumber.pro/projects/ckan-data-curator-integration/documents/branch/master) using [Cucumber Pro](https://cucumber.io/pro) beta 

Writing a test
==============

Markdown tips
-------------

- add two trailing spaces to the end of user stories to make a [soft line break](http://spec.commonmark.org/0.28/#soft-line-breaks). Check that your editor doesn't automatically remove trailing spaces
- use the [underline method for headings](http://spec.commonmark.org/0.28/#setext-heading-underline) in feature descriptions
- Name readme's README.md (case matters)

General Rules
-------------

- the feature name should be some terse yet descriptive text of what is desired
- Don't put "or" in the Given/When/Then statements - these statements should be pulled out into two different scenarios.
- Don't put conditions in  When/Then statements. An if statement can be changed into two different scenarios and the if condition put up into the Given statement.
- Use "quotes" around named things in the Application, e.g. a "Menu item name"
- Use "double quotes" not 'single quotes'


Rules for Given
---------------

- Write in [third person, not first person](https://automationpanda.com/2017/01/18/should-gherkin-steps-use-first-person-or-third-person/); Using the pronoun "I" is an [anti-pattern](https://cucumber.io/blog/2016/08/31/cucumber-anti-patterns-part-two#scenarios-that-use-i-as-in-the-personal-pronoun)

Rules for When
--------------

- Don't drive the User Interface in the When statement. Say what happened, not how it happened.
- Single When per scenario

Rules for Then
--------------

- Use "should" in Then statement

Tags
====

We use @tags to help organise and search for tests:

- @draft tests
- @backlog for features not in our [release plans](https://github.com/ODIQueensland/ckan-data-curator-integration/milestone/10)
