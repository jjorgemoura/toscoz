fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios run_all_tests
```
fastlane ios run_all_tests
```
Runs all test.
### ios run_set_version
```
fastlane ios run_set_version
```
Sets next expected version for this PR. (branch)
### ios run_master_build
```
fastlane ios run_master_build
```
Runs a master build (tests, lint, documentation, bumps version). (master)

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
