# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? "#trivial"

# Run swiftlint and output results inline with the code changes
swiftlint.config_file = '.swiftlint.yml'
swiftlint.lint_files inline_mode: true

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -r fdescribe specs/ `.length > 1
fail("fit left in tests") if `grep -r fit specs/ `.length > 1

# Mainly to encourage writing up some reasoning about the PR, rather than just leaving a title.
if github.pr_body.length < 3 && git.lines_of_code > 10
  warn("Please provide a summary in the Pull Request description")
end

## Let's check if there are any changes in the project folder
has_app_changes = !git.modified_files.grep(/Sources/).empty?
## Then, we should check if tests are updated
has_test_changes = !git.modified_files.grep(/iOSTests/).empty?
## Finally, let's combine them and put extra condition
## for changed number of lines of code
if has_app_changes && !(has_test_changes) && git.lines_of_code > 20
  warn("Tests were not updated", sticky: false)
end
