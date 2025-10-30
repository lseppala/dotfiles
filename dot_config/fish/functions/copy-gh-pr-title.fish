function copy-gh-pr-title
gh pr view --json url,title | jq -r '"\(.title): \(.url)"' | tee /dev/tty | pbcopy
end
