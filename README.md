#Git Team Workflow Part 1

### Objectives
*After this lesson, students will be able to:*
- Describe the git flow model to organize code changes and collaborate as a team
- Use branches to isolate changes tied to specific features
- Efficiently and correctly resolve merge conflicts
*After this lesson, students will be able to:*
- Use branches to isolate changes tied to specific features
- Efficiently and correctly resolve merge conflicts
- Fetch changes from a remote without merging them into your own
- Explain how rebase combines two branches

### Background Reading
[using-branches](https://www.atlassian.com/git/tutorials/using-branches)
[merging-vs-rebasing](https://www.atlassian.com/git/tutorials/merging-vs-rebasing)
[a-successful-git-branching-model](http://nvie.com/posts/a-successful-git-branching-model)

### Fix IMDB...as a team!

In the following lab, you'll work with the student next to you to create a working IMDB application by adding code to an existing project and using Git/GitHub to collaborate.  You have been given most of the app, including the views, in the starter code. Your job, by the end of the day, is to make the following command work, without error:

`rails db:seed`

You will need to work your way through creating controllers and models, and then populating those models with the appropriate associations and methods. Once `rails db:seed` works, you'll click through every page of the application until all error messages are resolved.  Your application will look like this:

<p align="center">
<img src="http://i.imgur.com/Fqun13q.png"
</p>

To start:

- One student should fork and clone the [starter-code](starter-code) to their GitHub
- Add the second student as a contributor to this repository
- The second student should clone the newly-forked repo, so they have a local copy and can start working

To practice using Git/GitHub as a team, you'll each take one model and build it on feature branches:

**Student 1** should create a new branch called `actor-movie-models` and fill in the Actor and `Movie` models:
  - Movies have and belong to many actors; they also have many reviews
  - Actors have and belong to many movies
  - The actor model should have an `age` method that returns the actors age by subtracting the actors `year_of_birth` from the `Time.now.year`

**Student 2** should create a new branch called `review-user-models` and fill in the Review and an User models:
  - Reviews belong to movies; they also belong to users
  - Users have many reviews
  - The user model should have a `full_name` method that returns an interpolated string with the user's `first_name` and `last_name`

Now, each student should `git push origin <branch name>`.

## Pull Requests and Merging

Take a look at the GitHub repository - new branches are created for you when you push from your local branches!  Now, you'll need a way to bring your changes to one version of the project. One way that Git allows us to do this is by __merging__ branches.

![Merging - Separate Branches](https://i.imgur.com/oIx2ou1.png)

Merging creates a **new commit on your current branch** (on top of existing commits) that includes all of the changes made by another branch. The syntax for doing this is `git merge some_branch`; in context of this example, you'd have to `git checkout master` first because `some_branch` is the branch that you're pulling into your master branch.

![Merging - Merged](https://i.imgur.com/C9osnhd.png)

This doesn't destroy your original branch; all those commits are still there. However, they're not carried over to the current branch, only their data is.

But wait!  GitHub has made a sweet web interface, that utilizes Pull Requests, to make this more approachable...

## Create a Pull Request and Merge your work

#### What is a Pull Request?

From GitHub.com:

_"Pull requests let you tell others about changes you've pushed to a repository on GitHub. Once a pull request is sent, interested parties can review the set of changes, discuss potential modifications, and even push follow-up commits if necessary."_

If you pushed your branches up correctly and check your GitHub repo, you should see something like this:


<p align="center">
<img src="http://s2.postimg.org/7c7s0hcjd/Screen_Shot_2015_07_29_at_3_24_30_PM.png">
</p>

Click into either of the "Compare & pull request" buttons - you'll see a nice interface where you can compare branches, add a description for your pull request, and leave some extra text:

<p align='center'>
<img src='http://s15.postimg.org/4u50deszv/Screen_Shot_2015_07_29_at_3_27_09_PM.png'>
</p>

Create a pull request for `actor-movie-models` branch and merge it in.  

By the way, you should always delete your remote branches after merging them into your master branch (so, do that now!).

Now, create and merge a pull request for the `movie-review-models` branch.  Click through your web repo to see that the work you and your partner did on the models is now in the master branch.

But, think about it: locally, your master branch is missing the merged version of the project. So, checkout the master branch and `git pull` to update your local copy.  Now, check to see that you have your partners work on your machine.

## Merge Conflicts and Fetch

Let's revisit our `master/structure` example.  What if someone got overzealous and made a change to `master` before we merged in `structure`? Well, if the change doesn't conflict with anything in `structure` - as in, we didn't edit the same files being worked on in `structure` probably nothing! Git tries very hard to merge automatically. However, sometimes there are conflicts that Git can't resolve on its own.

![Merging - Conflict](https://i.imgur.com/MlwCPN5.png)

In those cases, instead of directly merging, Git asks the user to manually resolve the conflicts. In your project files, after trying to merge, those conflicts usually look something like this:

```javascript
  <<<<<<< HEAD
  var x = 1,
      y = 2;
  =======
  var x;
  >>>>>>> other_branch
```

The first section is the version that exists on the current branch; the second section is the version that exists on the branch you're trying to pull in. Figure out which version of the code makes the most sense moving forward, delete the version that doesn't and all the extra stuff that Git adds (`<<<<<<<`, `=======`, etc.) and run `git commit` to finalize the merge.

For example, if we decided we only needed `var x`, delete the other "stuff":

```javascript
  var x;
```

Now, we have only the code we need and can `git commit`.  

>If, for whatever reason, you hit a merge conflict, Git and GitHub are _super_ helpful in helping you resolve your conflicts.

## Set up your app for Merge Conflicts

Ok, we're almost ready for our new and improved version of IMDB.  Be aware that we're setting you up to hit merge conflicts in this part of the lesson so don't be scared when you see these merge issues later!  And by the way, never, ever, work on the same files in different branches!  Follow this rule, and you're less likely to hit merge conflicts!

But to get you some practice, now, both partners are going to create new branches to build the controllers for this app using Git workflow:

__Student 1__ should create a new branch called `student1-controllers` and __student 2__ should create a new branch called `student2-controllers`.  Use the specs below to individually build each controller - i.e. each person should make both.

- Fill in the `actors_controller.rb` with the following methods and corresponding code: `show, new, create, edit, update`
 - The `Actor` params are `:name`, `:year_of_birth`, `:thumbnail`
- Fill in the `movies_controller.rb` with the following methods and corresponding code: `index, show, new, create, edit, update`
 - The `Movie` params are `:title`, `:summary`, `:youtube_embeded_id`, and `:thumbnail`

When you're finished, push your code up to GitHub with `git push origin <branch name>`.  Again, notice a new remote branch has been created.

<p align="center">
  <img src='http://s16.postimg.org/fu91r8z05/Screen_Shot_2015_07_29_at_4_49_01_PM.png'>
</p>

## Resolving Merge Conflicts

You and your partner are working on the same project, merged in some work you did on the models of your new IMDB app, but both decided to work on the controllers at the same time on different branches!

<p align="center">
<img src='http://s16.postimg.org/fu91r8z05/Screen_Shot_2015_07_29_at_4_49_01_PM.png'>
</p>

Submit a pull request for student 1 and merge student 1's pull request. Then, try to create a pull request for student 2's work:

<p align='center'>
<img src='http://s2.postimg.org/p7md53bqx/Screen_Shot_2015_07_29_at_7_34_00_PM.png'>
</p>

Oh no! We're unable to merge this in because student 1 and student 2 worked on the same files and now we have different versions of the files we're trying to combine.  Let's create pull request anyway and sort this out.

## `fetch`, `checkout`, `merge` from the command line

Remember when we said GitHub is really helpful - check it out:

<p align='center'>
<img src='http://s30.postimg.org/h29s5ii5d/Screen_Shot_2015_07_29_at_7_38_37_PM.png'>
</p>

Simply follow the directions to make this work!

```bash
git fetch origin
git checkout -b student2-controller origin/student2-controller
git merge master
```

In the simplest terms, `git pull` is just like running `git fetch` followed by `git merge`:

_"When you fetch, Git gathers any commits from the target branch that do not exist in your current branch and stores them in your local repository. However, it does not merge them with your current branch. This is particularly useful if you need to keep your repository up to date, but are working on something that might break if you update your files. To integrate the commits into your master branch, you use merge."_ - StackOverflow.com

```bash
Auto-merging app/controllers/movies_controller.rb
CONFLICT (content): Merge conflict in app/controllers/movies_controller.rb
Auto-merging app/controllers/actors_controller.rb
CONFLICT (content): Merge conflict in app/controllers/actors_controller.rb
Automatic merge failed; fix conflicts and then commit the result.
```

## Resolve your Merge Conflict

Now, since we hit a merge conflict, with your partner use the message to resolve the conflicts. Git will mark the conflicts in the working tree for us - our terminal showed us problems in the movies and actors controllers - so open the files being identified with your text editor, edit the files by choosing which version you want to keep - delete all the "extra stuff" (`<<<<<<<`, `=======`, HEAD, master) just like we practiced earlier - and then...

```bash
git add .
git commit -m 'your message'
git checkout master
git merge --no-ff student2-controller
git push origin master
```

...now, try `rake db:seed`, spin up a server, and you should get:

<p align="center">
<img src="http://i.imgur.com/Fqun13q.png"
</p>

## Rebasing

While merging represents one path for combining different branches, there is another common path called `rebase`. Rebasing works differently than merging. Rather than combining the finished data from two different branches via a single commit, it combines the two branches _themselves_, rearranging them and, effectively, re-writing history.

Here's what a rebase looks like. Suppose we have two branches, like this.

![Rebasing - Separate Branches](https://i.imgur.com/4lv5RH7.png)

One day, someone makes a commit onto the `master` branch. We want to include those changes into our feature branch, so that our code doesn't conflict with theirs.

![Rebasing - Master is Ahead](https://i.imgur.com/n76zXfC.png)

From our feature branch, if we run the command `git rebase master`, we can tell git to rewrite the history of our feature branch as if the new commit on `master` had __always been there__.

![Rebasing - In Action](https://i.imgur.com/MadRNj5.png)

Rebase is extremely useful for cleaning up your commit history, but it also carries risk; when you rebase, you are in fact discarding your old commits and replacing them with new (though admittedly, similar) commits, and this can seriously screw up a collaborator if you're working in a shared repo.The golden rule for `git rebase` is "Only rebase **before** sharing your code, **never** after."

Like `git merge`, `git rebase` also sometimes runs into merge conflicts that need to be resolved. The procedure for doing this is almost the same; once you fix the conflicts, run `git rebase --continue` to complete the rebase.

## Conclusion
You should now be able to:
- Describe why branching is important in a team workflow.
- Identify the syntax needed to create a new branch. Bonus: Create a new branch and switch to it in one command?
- Explain why should you never work on the same files on different branches?
- Explain the difference between `rebase` and `merge`
- Identify how pull requests work in the context of using Git/GitHub to collaborate
