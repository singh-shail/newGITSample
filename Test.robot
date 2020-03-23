*** Settings ***
Documentation    Suite description
Documentation  this is for checking the submit button over prolitus website
Library  SeleniumLibrary
Library  OperatingSystem
*** Test Cases ***
Submit button Check
    [Tags]    DEBUG
    Open Browser    https://www.prolitus.com/    GC
    Click Button    xpath=//*[@id="callus"]/div/div[9]/input[5]
*** Keywords ***
Provided precondition
    Setup system under test