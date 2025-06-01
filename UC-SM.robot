*** Settings ***
Library    AppiumLibrary 
Library    Collections
Library    Process
Resource    ./allLocalKeywords.txt
Resource    ./Variables.txt

*** Test Cases ***
Test Rename Subscribed Podcast With Empty name
    [Tags]    TC-SM-02-01
    [Setup]    Run Keywords     Open AntennaPod 
    ...               AND    Go To Add Podcast Page
    ...               AND    Subscribe Podcast    1
    ...               AND    Rename Podcast    ${Empty}
    Verify Renamed Title Should Be Correct    ${PODCAST_TITLE_1}
    [Teardown]    Teardown And Clear App
    

Test Rename Subscribed Podcast
    [Tags]    TC-SM-02-02
    [Setup]    Run Keywords    Open AntennaPod 
    ...               AND    Go To Add Podcast Page
    ...               AND    Subscribe Podcast    1
    ...               AND    Rename Podcast    123
    Verify Renamed Title Should Be Correct    123
    [Teardown]    Teardown And Clear App

Test Delete The Only Podcast
    [Tags]    TC-SM-03-01
    [Setup]    Run Keywords    Open AntennaPod
    ...               AND   Go To Add Podcast Page
    ...               AND   Subscribe Podcast    1
    ...               AND   Go Back To Previous Page
    ...               AND   Go To Subscription Page
    ...               AND   Remove Podcast    1
    ...               AND   Go To Subscription Page
    Verify Subscription List Is Empty

Test Delete Subscribed Podcast
    [Tags]    TC-SM-03-02
    [Setup]    Run Keywords    Open AntennaPod
    ...               AND   Go To Add Podcast Page
    ...               AND   Subscribe Podcast    1
    ...               AND   Go Back To Previous Page
    ...               AND   Subscribe Podcast    2
    ...               AND   Go Back To Previous Page
    ...               AND   Go To Subscription Page
    ...               AND   Remove Podcast    1
    Verify Subscription List After Delete
    [Teardown]    Teardown And Clear App

Test Sort Alphabetically Without Subscription
    [Tags]    TC-SM-04-01
    [Setup]    Run Keywords    Open AntennaPod
    ...               AND    Go To Subscription Page
    ...               AND    Sort Alphabetically
    Verify Subscription List Is Empty
    [Teardown]    Teardown And Clear App

Test Sort Alphabetically With Only One Subscription
    [Tags]    TC-SM-04-02
    [Setup]    Run Keywords    Open AntennaPod
    ...               AND   Go To Add Podcast Page
    ...               AND   Subscribe Podcast    1
    ...               AND   Go Back To Previous Page
    ...               AND   Go To Subscription Page
    ...               AND   Sort Alphabetically
    Verify Sorted Subscription List
    [Teardown]    Teardown And Clear App

Test Sort Alphabetically With Two Subscriptions
    [Tags]    TC-SM-04-03
    [Setup]    Run Keywords    Open AntennaPod
    ...               AND   Go To Add Podcast Page
    ...               AND   Subscribe Podcast    1
    ...               AND   Go Back To Previous Page
    ...               AND   Subscribe Podcast    2
    ...               AND   Go Back To Previous Page
    ...               AND   Go To Subscription Page
    ...               AND   Sort Alphabetically
    Verify Sorted Subscription List
    [Teardown]    Teardown And Clear App

Test Kept Updated Filter Without Subscriptions
    [Tags]    TC-SM-05-01
    [Setup]    Run Keywords    Open AntennaPod
    ...               AND    Go To Subscription Page
    ...               AND    Apply Kept Updated Filter
    Verify Subscription List Is Empty
    [Teardown]    Teardown And Clear App

Test Kept Updated Filter With Multiple subscriptions
    [Tags]    TC-SM-05-02
    [Setup]    Run Keywords    Open AntennaPod
    ...               AND   Go To Add Podcast Page
    ...               AND   Subscribe Podcast    1
    ...               AND   Go Back To Previous Page
    ...               AND   Subscribe Podcast    2
    ...               AND   Change Podcast Settings
    ...               AND   Go Back To Previous Page
    ...               AND   Go Back To Previous Page
    ...               AND   Go To Subscription Page
    ...               AND    Apply Kept Updated Filter
    Verify Filtered Subscription List
    [Teardown]    Teardown And Clear App