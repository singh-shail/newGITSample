*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary
Library    DateTime
Library    XML
Library    OperatingSystem
Library    String
Library    Collections
Library    ExcelLibrary
*** Test Cases ***
Extracting the Time taken for launching a URL
    [Tags]    DEBUG
    Open Browser    https://www.inventrust.com/sitemap.xml    GC
    #Sleep    2s
    #@{list1}=    Get All Links
    ${text}=    Get Source
    Log    ${text}
    Create File    ${Dir}/sample.xml    content=${text}
    ${lines}=    get lines containing string    ${text}    <loc>
    log    ${lines}
    @{lines_list}=    split to lines    ${lines}
    @{main_list}=    create list
    :FOR    ${i}    IN    @{lines_list}
    \    ${str}=    remove string    ${i}    <loc>    </loc>
    #\    log    ${str}
    \    append to list    ${main_list}    ${str}
    log    ${main_list}
    writing file    1    ${main_list}
    @{time_list}=    create list
    :FOR    ${j}    IN    @{main_list}
    \    ${Tot}=    Calculating Time    ${j}
    \    append to list    ${time_list}    ${Tot}
    \    Close Browser
    writing file    2    ${time_list}
    #Calculating Time    @{main_list}[0]
    #IMP${first}=    get line    ${lines}    0
    #IMP${str}=    remove string    ${first}    <loc>    </loc>
    #${first}=    Get Line    ${string}    0
    #${element}=    parse xml  ${Dir}/sample_1.xml
    #@{text}=    XML.get elements texts  ${Dir}/sample1.xml  xpath=url/loc
    Close All Browsers



#Extracting Web Elements From Page
 #   [Tags]    Debug
  #  Open Browser    https://www.zeeve.io    GC
   # ${sample}=    Get All Links
    #${element}=    Get WebElements    ${sample}[3]
    #Click Element    ${element}
*** Keywords ***
Calculating Time
    [Arguments]    ${URL}
    ${Current}=    Get Current Date    result_format=epoch
    Open Browser    ${URL}    GC
    #Close Browser
    ${After}=    Get Current Date    result_format=epoch
    ${Total}=    Evaluate    ${After}-${Current}
    [Return]    ${Total}
    #append to file    ${PATH}/test.xls    ${Total}
    #open excel document    ${PATH}/test.xls    ${
    #CLOSE BROWSER

Writing File
    [Arguments]    ${COLUMN_NUM}    ${DATA_LIST}
    create excel document    doc_id=sample
    close current excel document
    open excel document    ${PATH}\\test.xlsx    doc_id=sample
    write excel column    ${COLUMN_NUM}    ${DATA_LIST}    row_offset=1    sheet_name=Sheet1
    save excel document    filename=${PATH}\\test.xlsx
    CLOSE ALL EXCEL DOCUMENTS
*** Variables ***
${Dir}    E:/Sofocle/Automation
${PATH}    E:\\Sofocle\\Automation