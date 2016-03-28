# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

Version control allows a user or users to work on a project while keeping different versions or iterations of the project saved over time. In case there is need of previous versions of the project, they can be recalled through a source control program like git. Version control is extremely useful because it can track changes to the code. It has timestamps and also identifies the user who made the changes.

With all of the iterations of the code saved through commits and different versions of the code in branches, git can keep the integrity of the master code. If bad code is merged into the master code, git can revert to a previous version. The branched code can also be reviewed before it is fully integrated. Instead of users working on one master file, branch files allows a team of developers to safely work on code before they are implemented in the master code.

There are three states of a file in git. A committed file is a saved file that the file can be reverted to at any time. A modified file is a file that has been changed (but not saved). The third state is a staged file which is a file that is "staged" or marked to be saved at the next commit.

A service like GitHub prevents work from being lost locally. For example, if a repository is damaged on a local computer, having it saved in GitHub allows the user to clone the same repository into another computer. GitHub also allows many users to work on the same project, cloning repositories and working independently on the same code while keeping the master's integrity.

 Git is a source control system users employ to manage versions of a project in repositories. GitHub is an online service that stores git files in a cloud so users can collaborate on a project and manage versions of the same project.
 

* What is a branch and why would you use one?

A branch keeps the master file's integrity. It insures that the master code always works. The branch allows the user to write code, test it, and verify it with another user before merging it into the master file. The branch keeps new code separate from the master code until it is fully vetted. Only until then should it be merged into the master branch

* What is a commit? What makes a good commit message?
A commit is a savepoint. It's a saved version of the project in git that can be recalled at any time in the future. A good commit message describes the changes that were made to the code or project such as additions, deletions, or fixes. A good commit message is specific and descriptive.

* What is a merge conflict?

A merge conflict occurs when the same part of a file is modified in separate branches and an attempt at merging the branches creates a conflict. For example, if the same line of code in merging branches are different, it will create a merge conflict. It can also happen if two users on separate branches add files with the same name, or if one user deletes a file that the other user modified.