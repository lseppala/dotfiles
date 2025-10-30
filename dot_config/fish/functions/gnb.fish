function gnb
    if test (count $argv) -ne 1
        echo "Usage: gnb (new branch) <branch-name>"
        return 1
    end

    set branch_name $argv[1]

    # Fetch the latest changes from the remote
    git fetch origin

    # Determine the default branch more efficiently
    set default_branch (git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')

    # Create the new branch based on the default branch
    git checkout -b $branch_name origin/$default_branch

    # Push the new branch to the remote and set the upstream
    git push -u origin $branch_name
end
