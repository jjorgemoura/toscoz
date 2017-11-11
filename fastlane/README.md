fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

## Choose your installation method:

<table width="100%" >
<tr>
<th width="33%"><a href="http://brew.sh">Homebrew</a></th>
<th width="33%">Installer Script</th>
<th width="33%">RubyGems</th>
</tr>
<tr>
<td width="33%" align="center">macOS</td>
<td width="33%" align="center">macOS</td>
<td width="33%" align="center">macOS or Linux with Ruby 2.0.0 or above</td>
</tr>
<tr>
<td width="33%"><code>brew cask install fastlane</code></td>
<td width="33%"><a href="https://download.fastlane.tools">Download the zip file</a>. Then double click on the <code>install</code> script (or run it in a terminal window).</td>
<td width="33%"><code>sudo gem install fastlane -NV</code></td>
</tr>
</table>

# Available Actions
## iOS
### ios do_tests
```
fastlane ios do_tests
```
Runs all the tests
### ios do_unit_tests
```
fastlane ios do_unit_tests
```
Runs unit tests
### ios do_ui_tests
```
fastlane ios do_ui_tests
```
Run UI tests
### ios do_beta
```
fastlane ios do_beta
```
Submit a new build to TestFlight. Must send parameter version=MAJOR, MINOR or PATCH
### ios do_release
```
fastlane ios do_release
```
Deploy a new version to the App Store
### ios do_resources_check
```
fastlane ios do_resources_check
```
Runs Check Resources
### ios do_version
```
fastlane ios do_version
```
Versioning -> Increase: MAJOR, MINOR or PATCH
### ios do_validation
```
fastlane ios do_validation
```
Validate the version command and the branch
### ios do_danger_check
```
fastlane ios do_danger_check
```
Runs Danger
### ios do_documentation
```
fastlane ios do_documentation
```
Runs Documentation

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
