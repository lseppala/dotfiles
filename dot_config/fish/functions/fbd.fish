function fbd --description 'delete git branch (including remote branches)'
    set  branches (git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)" | grep -v main | string collect)
    set branch (echo "$branches" | fzf --multi --preview 'git show --pretty --color {}')
    echo "Will delete" (set_color --bold red)"$branch"(set_color normal)". Are you sure you want to delete these branches? (Y/n)"
    read -l confirm
    switch $confirm
        case Y
            git branch -D $branch
        case '*'
            echo "Cancelled"
    end
end
