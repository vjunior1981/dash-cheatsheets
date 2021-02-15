cheatsheet do
  title 'Taskwarrior - Usage examples'
  docset_file_name 'Taskwarrior'
  keyword 'taskwarrior'

  introduction <<-'END'
    Here are some Taskwarrior command line examples that cover a variety of topics.

    While this is not a reference for the features and command line, perhaps
    you will learn something new...

    Some of the example are deliberately chosen because there is more than one
    solution, in which case all are presented, for comparison.
  END

  category do
    id '30 Second Tutorial'
    entry do
      name 'Basic usage from the [30-Second Tutorial](https://taskwarrior.org/docs/30second.html).'
      notes <<-'END'


        ```bash
        $ task add Read Taskwarrior documents later
        $ task add priority:H Pay bills
        $ task next
        $ task 2 done
        $ task
        $ task 1 delete
        ```


      END
    end
  end

  category do
    id 'Creating Tasks'

    entry do
      name 'Create a task with due date.'
      notes <<-'END'
        ```bash
        $ task add Pay the rent due:eom
        ```
      END
    end
    entry do
      name 'Create a task, then add a due date later.'
      notes <<-'END'
        ```bash
        $ task add Pay the rent
        Created task 12
        $ task 12 modify due:eom
        ```
      END
    end
    entry do
      name 'Remove a due date from a task.'
      notes <<-'END'
        ```bash
        $ task 12 modify due:
        ```
      END
    end
    entry do
      name 'Create a task with a multi-line description.'
      notes <<-'END'
        ```bash
        $ task add "Five syllables here
        Seven more syllables there
        Are you happy now?"
        ```
      END
    end
  end

  category do
    id 'Filters'

    entry do
      name 'Show tasks I added in the last 4 days.'
      notes <<-'END'
        ```bash
        $ task entry.after:today-4days list
        ```
      END
    end
    entry do
      name 'Show tasks I added in the last hour..'
      notes <<-'END'
        ```bash
        $ task entry.after:now-1hour list
        ```
      END
    end
    entry do
      name 'Show tasks I completed between a date range..'
      notes <<-'END'
        ```bash
        $ task end.after:2015-05-01 and end.before:2015-05-31 completed
        ```
      END
    end
    entry do
      name 'Show tasks I completed in the last week..'
      notes <<-'END'
        ```bash
        $ task end.after:today-1wk completed
        ```
      END
    end
    entry do
      name 'Show tasks in This project or That project..'
      notes <<-'END'
        ```bash
        $ task project:This or project:That list
        ```
      END
    end
    entry do
      name 'More complex algebraic filters..'
      notes <<-'END'
        ```bash
        $ task project:This and \( priority:H or priority:M \) list
        ```
      END
    end
    entry do
      name 'Search for pattern in description and annotations:.'
      notes <<-'END'
        ```bash
        $ task /pattern/ list
        $ task rc.search.case.sensitive:yes /pattern/ list
        $ task rc.search.case.sensitive:no  /pattern/ list
        ```
      END
    end
    entry do
      name 'Search for tasks with no project..'
      notes <<-'END'
        ```bash
        $ task project: list
        ```
      END
    end
  end

category do
  id 'Reports'

  entry do
    name 'Temporarily changing the sorting of a report.'
    notes <<-'END'
      ```bash
      $ task rc.report.next.sort=due-,urgency- next
      ```
    END
  end
end

category do
  id 'Projects'

  entry do
    name 'Assign a long project name.'
    notes <<-'END'
      ```bash
      $ task add Rake the leaves project:'Home & Garden'
      ```
    END
  end
  entry do
    name 'Moving all tasks to a new project.'
    notes <<-'END'
      ```bash
      $ task project:OLDNAME modify project:NEWNAME
      ```
    END
  end
  entry do
    name 'Moving all pending tasks to a new project.'
    notes <<-'END'
      ```bash
      $ task project:OLDNAME and status:pending modify project:NEWNAME
      ```
    END
  end
  entry do
    name 'Using a project hierarchy.'
    notes <<-'END'
      ```bash
      $ task add project:Home.Kitchen Clean the floor
      $ task add project:Home.Kitchen Replace broken light bulb
      $ task add project:Home.Garden Plant the bulbs

      $ task project:Home.Kitchen count
      2

      $ task project:Home.Garden count
      1

      $ task project:Home count
      3
      ```
    END
  end
  entry do
    name 'What projects are currently used?'
    notes <<-'END'
      ```bash
      $ task projects
      $ task _projects
      ```
    END
  end
  entry do
    name 'What are all the projects I have ever used?'
    notes <<-'END'
      ```bash
      $ task rc.list.all.projects=1 projects
      $ task rc.list.all.projects=1 _projects
      $ task _unique projects
      ```
    END
  end
end

category do
  id 'Tags'

  entry do
    name 'List tasks that have a specific tag.'
    notes <<-'END'
      ```bash
      $ task +home list
      ```
    END
  end
  entry do
    name 'List tasks that do not have a specific tag.'
    notes <<-'END'
      ```bash
      $ task -home list
      ```
    END
  end
  entry do
    name 'List tasks that have any tags.'
    notes <<-'END'
      ```bash
      $ task tags.any: list
      $ task +TAGGED list
      ```
    END
  end
  entry do
    name 'List tasks that have no tags.'
    notes <<-'END'
      ```bash
      $ task tags.none: list
      ```
    END
  end
  entry do
    name 'List tasks that have two specific tags.'
    notes <<-'END'
      ```bash
      $ task +this +that list
      $ task +this and +that list
      ```
    END
  end
  entry do
    name 'List tasks that have either of two specific tags.'
    notes <<-'END'
      ```bash
      $ task +this or +that list
      ```
    END
  end
  entry do
    name 'List tasks that have just one of two specific tags.'
    notes <<-'END'
      ```bash
      $ task +this xor +that list
      ```
    END
  end
  entry do
    name 'What tags am I currently using?'
    notes <<-'END'
      ```bash
      $ task tags
      ```
    END
  end
  entry do
    name 'What are all the tags I have ever used?'
    notes <<-'END'
      ```bash
      $ task rc.list.all.tags=1 tags
      $ task _tags
      ```
    END
  end
end

category do
  id 'Special Tags'

  entry do
    name "Modify a task to boost it's urgency, and probably cause it to show up on the next report."
    notes <<-'END'
      ```bash
      $ task 1 modify +next
      ```
    END
  end
end

category do
  id 'Virtual Tags'

  entry do
    name "List tasks due today."
    notes <<-'END'
      ```bash
      $ task due.after:yesterday and due.before:tomorrow list
      $ task +DUETODAY list
      ```
    END
  end
  entry do
    name "List tasks that are due, but not today."
    notes <<-'END'
      ```bash
      $ task +DUE -DUETODAY list
      ```
    END
  end

  entry do
    name "List tasks that are due this week."
    notes <<-'END'
      ```bash
      $ task +WEEK list
      ```
    END
  end

  entry do
    name "List task that are overdue."
    notes <<-'END'
      ```bash
      $ task +OVERDUE list
      ```
    END
  end

  entry do
    name "What virtual tags are present for this task?"
    notes <<-'END'
      ```bash
      $ task 1 info
      ```
    END
  end
end

category do
  id 'Recurring Tasks'

  entry do
    name "I want to make a task that is due at 9:00am every Monday, starting this coming Monday."
    notes <<-'END'
      ```bash
      $ task add Do the thing due:2015-06-08T09:00 recur:weekly
      ```
    END
  end
  entry do
    name "I want a reminder to pay the rent every month, but only for a year."
    notes <<-'END'
      ```bash
      $ task add Pay rent due:28th recur:monthly until:now+1yr
      ```
    END
  end
end

category do
  id 'Priority'

  entry do
    name "Make priority L sort lower than no priority."
    notes <<-'END'
      ```bash
      $ task config -- uda.priority.values H,M,,L
      ```
    END
  end
  entry do
    name "I need more priority values for my workflow."
    notes <<-'END'
      ```bash
      $ task config -- uda.priority.values OMG,DoIt,Meh,Phfh,Nope,
      ```
    END
  end
  entry do
    name "How do I remove the priority from a task?"
    notes <<-'END'
      ```bash
      $ task 1 modify priority:
      ```
    END
  end
end

category do
  id 'Color'

  entry do
    name "I'm using a color theme, but I don't see any colors. This is usually because your tasks do not contain due dates, priorities etc. Prove color is working with these commands."
    notes <<-'END'
      ```bash
      $ task color
      $ task color legend
      ```
    END
  end
  entry do
    name "When task output goes to a file or pipe, all color is lost. Force color with:"
    notes <<-'END'
      ```bash
      $ task rc._forcecolor:on rc.defaultwidth:120 rc.detection:off ...
      ```
    END
  end
end

category do
  id 'DOM'

  entry do
    name "Get just the description for task 12."
    notes <<-'END'
      ```bash
      $ task _get 12.description
      Rake the leaves
      ```
    END
  end
  entry do
    name "Show the creation timestamp, and last modification date for task 12."
    notes <<-'END'
      ```bash
      $ task _get 12.entry 12.modification
      2010-04-04T01:02:31 2014-08-24T13:31:43
      ```
    END
  end
  entry do
    name "Get the dimensions of my terminal window."
    notes <<-'END'
      ```bash
      $ task _get context.width context.height
      ```
    END
  end
  entry do
    name "Add a task, and set the wait date to 4 days before the due date."
    notes <<-'END'
      ```bash
      $ task add Pay the rent due:eom wait:due-4days
      ```
    END
  end
  entry do
    name "Add a task, and use the same due date as task 12."
    notes <<-'END'
      ```bash
      $ task add Buy wine for the party due:12.due
      ```
    END
  end
  entry do
    name "Get the week number on which task 12 due."
    notes <<-'END'
      ```bash
      $ task _get 12.due.week
      ```
    END
  end
  entry do
    name "Get the columns used in the next report."
    notes <<-'END'
      ```bash
      $ task _get rc.report.next.columns
      $ task show report.next.columns
      ```
    END
  end
end

category do
  id 'Configuration'

  entry do
    name "Set the default.command to a different report."
    notes <<-'END'
      ```bash
      $ task config default.command long
      ```
    END
  end
  entry do
    name "Restore the default.command to its original setting."
    notes <<-'END'
      ```bash
      $ task config default.command
      ```
    END
  end
  entry do
    name "Set the default.command to a blank value."
    notes <<-'END'
      ```bash
      $ task config default.command ''
      ```
    END
  end
  entry do
    name "Temporarily override default.command."
    notes <<-'END'
      ```bash
      $ task rc.default.command:long
      ```
    END
  end
  entry do
    name "Show sort order of all reports."
    notes <<-'END'
      ```bash
      $ task show | grep report | grep sort
      ```
    END
  end
end

category do
  id 'Miscellaneous'

  entry do
    name "What is the most recent task ID?"
    notes <<-'END'
      ```bash
      $ task newest rc.verbose=nothing limit:1 | cut -f1 -d' '
      $ task rc.verbose=nothing rc.report.foo.columns:id \
          rc.report.foo.sort:id- foo limit:1
      ```
    END
  end
  entry do
    name "What is the minimum necessary data for a task?"
    notes <<-'END'
      ```bash
      $ echo '{"description":"A new task"}' | task import -
      $ task add A new task
      ```
    END
  end
end

category do
  id 'Troubleshooting'

  entry do
    name "Show the runtime diagnostics, to see if anything is wrong."
    notes <<-'END'
      ```bash
      $ task diagnostics
      ```
    END
  end
  entry do
    name "Determine which version of GnuTLS is used by Taskwarrior."
    notes <<-'END'
      ```bash
      $ task diagnostics | grep gnutls
      ```
    END
  end
  entry do
    name "Just let me brute-force change a task. Using Vim."
    notes <<-'END'
      ```bash
      $ task 12 edit
      $ EDITOR=vim task 12 edit
      ```
    END
  end
  entry do
    name "I can't list my completed tasks, because the list report has a filter that shows only pending tasks."
    notes <<-'END'
      ```bash
      $ task rc.report.list.filter: list
      $ task all
      ```
    END
  end
  entry do
    name "Do I have the latest released version?"
    notes <<-'END'
      ```bash
      $ curl https://gothenburgbitfactory.org/latest/task
      2.5.3
      $ task --version
      2.5.3
      ```
    END
  end
end



end
