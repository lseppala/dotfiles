function wat
    # Check if parent directory is 'lsep'
    if test (basename (dirname $PWD)) = "lsep"
        set target_dir "../"
    else
        set target_dir "../lsep"
    end

    # Check if target directory exists
    if test -d "$target_dir/$argv[1]"
        cd "$target_dir/$argv[1]"
    else
        git worktree add -b "lsep/$argv[1]" "$target_dir/$argv[1]"
        cd "$target_dir/$argv[1]"
    end
end
