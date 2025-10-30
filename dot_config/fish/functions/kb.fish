function kb
    set -l title $argv

    # Check if title is provided
    if test -z "$title"
        echo "Usage: kb <title of work>"
        return 1
    end

    # Create the draft issue with status
    set -l itemid (gh project item-create 13981 --title "$title" --owner "github" --jq .id --format json)
    echo "Draft issue created with ID: $itemid"

    gh project item-edit --project-id "PVT_kwDNJr_OAJIEcw" --id "$itemid" --field-id "PVTSSF_lADNJr_OAJIEc84HLOgx" --single-select-option-id "f75ad846"  # backlog
end
