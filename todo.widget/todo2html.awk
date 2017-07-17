#!/usr/local/bin/gawk -f

################################################################################
# Author:	john@localhost
# Created:	2017-03-19
# Modified:
################################################################################

BEGIN { print "<table>" }
{
    printf "<tr>"

    if ($1 ~ /^[0-9]+/)
    {
        printf "<td><span class=\"todo_item\">%s</span></td>", $1

        nxt = 3
        if ($2 ~ /\([A-Z]\)/)
        {
            pri = $2
            gsub(/\(/, "", pri)
            gsub(/\)/, "", pri)
            disp = pri
            #gsub(/\(/, "<span class=\"todo_lowlight\">(</span>", disp)
            #gsub(/\)/, "<span class=\"todo_lowlight\">)</span>", disp)
            printf "<td><span class=\"todo_priority todo_pri_%s \">%s</span></td><td><div>", pri, disp
        }
        else
        {
            printf "<td colspan=\"2\"><div>"
            nxt = 2
        }

        for (i = nxt; i <= NF; i++)
        {
            if ($i ~ /^[+].*/)
                printf "<span class=\"todo_project\">%s</span>", $i
            else
            {
                if ($i ~ /^[@].*/)
                    printf "<span class=\"todo_context\">%s</span>", $i
                else
                    if ($i ~ /^[*].*[*]/)
                    {
                        main = $i
                        gsub(/[*][^*]*$/, "*", main)
                        gsub(/[*]/, "<span class=\"todo_lowlight\">*</span>", main)
                        rest = $i
                        gsub(/[*][^*]*[*]/, "", rest)
                        printf "<span class=\"todo_star\">%s</span>%s", main, rest
                    }
                    else
                        if ($i ~ /^[_].*[_]/)
                        {
                            main = $i
                            gsub(/_[^_]*$/, "_", main)
                            gsub(/_/, "<span class=\"todo_lowlight\">_</span>", main)
                            rest = $i
                            gsub(/_[^_]*_/, "", rest)
                            printf "<span class=\"todo_line\">%s</span>%s", main, rest
                        }
                        else
                            if ($i ~ /[^:]+:.+/)
                            {
                                main = $i
                                gsub(/:.*/, ":", main)
                                rest = $i
                                gsub(/^[^:]+:/, "", rest)
                                printf "<span class=\"todo_kvp_key\">%s</span><span class=\"todo_kvp_value\">%s</span>", main, rest
                            }
                            else
                                if ($i ~ /[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/)
                                    printf "<span class=\"todo_date\">%s</span>", $i
                                else
                                    printf "%s", $i
            }
            if (i < NF)
                printf " "
        }
        printf "</div></td>"
    }
#    else
#    {
#        if ($0 ~ /^--/)
#            printf "<td colspan=\"3\"><span class=\"todo_lowlight\">%s</span></td>", $0
#        else
#        if ($0 !~ /^--/)
#        {
#            main = $0
#            gsub(/[0-9]+/, "<span class=\"todo_highlight\">&</span>", main)
#            printf "<td colspan=\"3\">%s</td>", main
#        }
#    }

    print "</tr>"
}
END { print "</table>" }
