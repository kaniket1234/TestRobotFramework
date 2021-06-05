Automation Exercise



# Test Tool

**Robot Framework** ([https://robotframework.org/](https://robotframework.org/))

Robot framework is open source automation framework. It can be used to create flexible automation frameworks for web applications, desktop applications, API and backend component testing.

# Test Repository

Repo: [https://github.com/kaniket1234/TestRobotFramework](https://github.com/kaniket1234/TestRobotFramework)

# Design

The idea behind designing the framework was to showcase different features and use cases of the framework. The framework showcases both approaches: TDD and BDD. The TDD based test cases show tests driven via test data and keywords, whereas, the BDD tests uses gherkin language syntax to implement the test case.

The framework highlights traditional Selenium Webdriver controls (to navigate through various web elements in the page) and it also implements logical loops to show incorporation custom logic (iterating through all headings in contents box), if required.

It also shows the option to create our own custom keywords (for e.g. Scroll To Element). The framework can be easily extended to test API calls, verify database connections, etc.

# Prerequisites

This is python based framework. So the precondition is availability of Python (2.7 or above) on the system where this framework will run. Apart from Python, there are few other libraries required for execution. These dependencies are mentioned in requirements.txt. Install these requirements before executing test cases. The command to install the dependencies is:

_pip install -r requirements.txt_

# Test Configuration

The framework has a centralized configuration file i.e. _resources.robot_. This file contains test variables like test browser, application URL, etc. This file also contains keywords which are used across all test suites like launching the web application, get element, etc.

# Test Suites

The test suites have global settings which are applicable to every test in the suite. Examples of such settings are: timeout, tear down activities, etc. The framework has 3 test suites:

## Contents Box Test Suite

This test suite contains two test cases. The first one verifies the headings in the contents box and other verifies if these hyperlinks actually work. The test suite will make sure all headings in the Contents box are valid and each hyperlink navigates to correct section in the web page.

## Nike Test Suite

This test suite too contains two test cases. First test case aims to verify the popup text when mouse control hovers over Nike under Personified Concepts. The second test case actually clicks the Nike hyperlink and verifies that the new web page has Family Tree section for Nike.

## Gherkin Test Suite

This test suite has a single test case, where we find Nike under Personified Concepts, click the hyperlink and navigate to Family Tree section. But it is specified in behavioral test driven approach.

# Test Execution

Once the prerequisites are installed, the test suites can be executed as:

_robot ./testcases/contents\_box\_tests.robot_

_robot ./testcases/nike\_tests.robot_

_robot ./testcases/gherkin\_tests.robot_

# Test Results

The framework produces below mentioned result artifacts

## Test Execution Log

This log shows the execution log of each test case and test step. It provides detailed status of each test step. It is generated in html format.

<img src="https://user-images.githubusercontent.com/43895354/120874494-c30c6f80-c55b-11eb-8aed-453e0697fb67.png" width="15%"></img> 

## Test Report

The test report shows the execution result of test run. We can drill in from broader test suites, to test cases, to test steps. It also shows error message in case of failures. We also get feature to search certain test cases or even tag and filter test cases. It also provides start and end times for each and every test step.

<img src="https://user-images.githubusercontent.com/43895354/120874551-eafbd300-c55b-11eb-92c6-e5b0809636ef.png" width="15%"></img> 


## Browser Logs

The framework generates browser logs too. The files are named as per browser in use. For Firefox, the log file will be named geckodriver.log, while for chrome, the log file will be named chromedriver.log.
```
1622847350158 mozrunner::runner INFO Running command: &quot;/Applications/Firefox.app/Contents/MacOS/firefox-bin&quot; &quot;-marionette&quot; &quot;-foreground&quot; &quot;-no-remote&quot; &quot;-profile&quot; &quot;/var/folders/1n/448sgmds3jlc4xvsmr6dzk3c0000gq/T/rust\_mozprofile.rFzesr1XMDxN&quot;
 1622847350680 addons.webextension.doh-rollout@mozilla.org WARN Loading extension &#39;doh-rollout@mozilla.org&#39;: Reading manifest: Invalid extension permission: networkStatus
 1622847350716 addons.webextension.screenshots@mozilla.org WARN Loading extension &#39;screenshots@mozilla.org&#39;: Reading manifest: Invalid extension permission: mozillaAddons
 1622847350716 addons.webextension.screenshots@mozilla.org WARN Loading extension &#39;screenshots@mozilla.org&#39;: Reading manifest: Invalid extension permission: telemetry
 1622847350717 addons.webextension.screenshots@mozilla.org WARN Loading extension &#39;screenshots@mozilla.org&#39;: Reading manifest: Invalid extension permission: resource://pdf.js/
 1622847350717 addons.webextension.screenshots@mozilla.org WARN Loading extension &#39;screenshots@mozilla.org&#39;: Reading manifest: Invalid extension permission: about:reader\*
 1622847352952 Marionette INFO Listening on port 65227
 1622847353024 Marionette WARN TLS certificate errors will be ignored for this session
 1622847390814 Marionette INFO Stopped listening on port 65227
 ```

## Screenshots

The framework will capture and save a screenshot in case of failure. This helps debugging in case of failures.
