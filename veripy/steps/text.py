import logging

from behave import then


logger = logging.getLogger('text')


@then('the page title should be "{title}"')
def check_page_title(context, title):
    """ Asserts that the browser page's current title is the given value. """
    logger.info(f'Asserting that the page title is "{title}".')
    assert context.page.browser.title == title, (
        f'The page title was supposed to be "{title}" but was not.'
    )


@then('the "{element}" contains the text "{text}"')
def check_element_text(context, element, text):
    """ Asserts that the element contains the given value as text. """
    logger.info(f'Asserting that the element "{element}" contains the text "{text}".')
    assert text in context.page[element].text, (
        f'"{element}" was supposed to contain "{text}" and did not.'
    )


@then('the "{element}" is {not_:optional_not}visible')
def check_element_visible(context, element, not_):
    """ Asserts that the element is the visible on the page. """
    try:
        assert context.page[element].visible != not_, (
            f'The element "{element}" was supposed to be visible and was not.'
        )
    except AttributeError:
        assert not_, (
            f'The element "{element}" was not supposed to be visible and was.'
        )


@then('the {position:d}{ordinal:ordinal_indicator} {sub_element:w} in the "{element_name}" \
contains the text "{text}"')
def check_nth_element_text(context, position, ordinal, sub_element, element_name, text):
    """ Asserts that the nth element contains the given value as text
    ::

        the 3rd label of the "Form" contains the text "First Name"
    """
    logger.info(f'Asserting that the {position}{ordinal} "{sub_element}" \
    of the element: "{element_name}" contains the text "{text}".')
    chosen_elements = context.page.find_children(sub_element, parent=element_name)
    assert text in chosen_elements[position-1].text


@then('write the "{element}" generated by the system')
def write_element_text(context, element):
    """ Given an element, record the value of the element for later display
    in the report.

    ::

        Then write the "{element}" generated by the system.

    """
    text = context.page[element].text
    context.step.stored_value = text
