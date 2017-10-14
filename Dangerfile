
# Mainly to encourage writing up some reasoning about the PR, rather than just leaving a title
if github.pr_body.length < 3
  fail "Please provide a summary in the Pull Request description"
end

# Just to let people know
# warn("PR is classed as Work in Progress") if github.pr_title.include? "WIP"

# Make a note about contributors not in the organization
# unless github.api.organization_member?('jjorgemoura', github.pr_author)
#   # Pay extra attention if external contributors modify certain files
#   if git.modified_files.include?(".travis.yaml")
#     warn "External contributor has edited the travis file"
#   end
# end


# Fail if the LICENSE file was modified
if git.modified_files.include?("LICENSE")
  fail "The license file was modified."
end


# Warn when there is a big PR
warn("Big PR, try to keep changes smaller if you can") if git.lines_of_code > 50

# Add a CHANGELOG entry for app changes
# if !git.modified_files.include?("CHANGELOG.md") && has_app_changes
#   fail("Please include a CHANGELOG entry. \nYou can find it at [CHANGELOG.md](https://github.com/realm/jazzy/blob/master/CHANGELOG.md).")
#   message "Note, we hard-wrap at 80 chars and use 2 spaces after the last line."
# end


# Look for prose issues
# prose.lint_files

# # Look for prose issues
# prose.lint_files markdown_files
#
# # Look for spelling issues
# prose.ignored_words = ["sapataz", "github", "cocoapods", "jazzy", "carthage"]
# prose.check_spelling markdown_files

# Non-trivial amounts of app changes without tests
# if git.lines_of_code > 50 && has_app_changes && !has_test_changes
#     warn "This PR may need tests."
# end
