# Test Configuration
# This suite is run during CI tests. We should make sure to include all available
# statements here to know that they work.

Feature: showing off behave
    As a developer
    I want to ensure that all of the available test statements work

    Scenario: run a simple test
        Given we have behave installed
        When we implement a test
        Then behave will test it for us!


    Scenario: Test if the demo app has the title "Hello World"
        Given that the browser is at "localhost-hello"
        Then the page title should be "Hello World"
        Then the "h1" contains the text "Hello World"
        Then take a screen shot


    Scenario: Test if the demo app has fields in the right order
        Given that the browser is at "localhost-hello"
        Then the 2nd label in the "form" contains the text "Optional input"
        Then take a screen shot

    @Example_App
    Scenario: Test if the demo app fields accept the right data.
        Given that the browser is at "localhost-hello"

        When the file "uploadable-file.txt" has been added to the "file_field" field

        Then the "optional_field" field is not required
        Then the "required_field" field is required

        Then the "enabled_field" field is enabled
        Then the "disabled_field" field is not enabled

        Then the "text_field" field does accept text
        Then the "text_field" field does not accept numbers
        Then the "number_field" field does accept numbers
        Then the "number_field" field does not accept passwords

        Then the "file_field" field does accept files

        Then write the "Random Number" generated by the system

        Then take a screen shot


    @Example_App
    Scenario: Test that the user can explicitly switch page contexts
        Given that the browser is at "localhost-hello"
        Then write the "Random Number" generated by the system
        Then take a screen shot

        Given that the browser is at "other-page"
        Then write the "Other Random Number" generated by the system
        Then take a screen shot

    @Example_App
    Scenario: Test that the user can implicitly switch page contexts
        Given that the browser is at "localhost-hello"
        Then take a screen shot

        When the user clicks the "Other Page Link"
        Then the browser should be at "other-page"
        Then write the "Other Random Number" generated by the system
        And take a screen shot

    @Example_App
    Scenario: Test if the demo app can accept large content into a text area
      Given that the browser is at "localhost-hello"
      When the content from "copyable-file.txt" is entered into the "textarea_field"
      Then take a screen shot
