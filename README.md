# Accessibility audit template

Template for performing accessibility audits on GitHub, using Projects.

[![GitHub Super-Linter](https://github.com/philsherry/audit-template/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter)

## Custom issue templates

The custom Issue templates are available in `.github/ISSUE_TEMPLATE`.
These have been created with an emphasis on accessibility and manual device testing.

## Projects (v1)

I’ve specified Projects version 1 there, because I’m not sure how version 2 is going to work yet.
While there is a beta available, I’ve not had time to investigate properly.

### Setup the labels first

You will need to add the labels to your new repository before you create any Issues. To see which labels are included, read the [label style guide](labels/label-style-guide.md).

1. Go to your Labels page: `github.com/username/repo/labels`.
2. Open your browser’s Web Inspector, and then open the Console tab.
3. Copy the contents of `labels/github-import-labels.js` and paste them into the Console.
4. The copy the contents of `labels/labels.json` and paste them into the relevant place near the end of the label import code. Look for this:
    ```js
    [
      /**
       * YOUR LABELS.JSON HERE
      */
    ].forEach((label) => createOrUpdate(label));
    ```

    Paste the JSON in like this and hit Return to run it:
    ```js
    [
      {
        "name": "audit",
        "color": "7057ff",
        "description": "Auditing: audit task"
      }
    ].forEach((label) => createOrUpdate(label));
    ```

### Setup a new Project board

1. Start a new Project: `github.com/username/repo/projects/new`.
2. Give it a *“Project board name”* and a description.
3. Choose Automated Kanban for *“Project template”*.
4. Smash the *“Create Project”* button.
5. Remove the default Notes that are in the *“To do”* column.
   Note: Notes exist **only** on the board, whereas Issues are always available in the Issues section.

### Workflow

1. Create an Issue: `github.com/username/repo/issues/new/choose`.
2. Here you can now choose from all the new Tasks.
3. Pick one with its *“Get started”* button.
4. Confire the Issue:
   1. **Assignees**: what's your house policy here: self-assign, or leave unassigned for anyone to pick tasks up?
   2. **Labels**: these should already be populated if everything went to plan in a previous step.
   3. **Projects**: click the cog and choose whatever name you added for *“Project board name”*.
   4. **Milestone**: we haven’t added anything here yet, but maybe you have a house style for these.
   5. **Preview** tab: the text in each issue template can be previewed and amended and previewed here.
5. When you’ve submitted as a new Issue, check your Project board to see it sitting in the *“To do”* column.
6. Repeat with as many of the other tasks as you need.
7. Create an additional column to the right of *“Done”*, called *“Issues”*.
8. When you raise an issue, label it with *“issue”* and throw it in this column for future attention.
9. Add a further column to the right, called *“Fixed”* for when you perform a retest.
