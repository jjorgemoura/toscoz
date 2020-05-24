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
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios check_resources
```
fastlane ios check_resources
```

### ios run_unit_tests
```
fastlane ios run_unit_tests
```

### ios run_ui_tests
```
fastlane ios run_ui_tests
```

### ios release_beta
```
fastlane ios release_beta
```

### ios bump_version
```
fastlane ios bump_version
```
Versioning -> Increase: MAJOR, MINOR or PATCH
### ios bump_build_version
```
fastlane ios bump_build_version
```


----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
