# Close Enough GitHub

Alfred workflow to make getting to your GitHub projects easier.

## Setup

Download and import `Close Enough Github.alfredworkflow` into Alfred.

## Usage

* `g PROJECT ALT_ENDPOINT (options)` Takes you to Cerner GitHub and defaults to the hi-infra org
* `gr PROJECT ALT_ENDPOINT (options)` Takes you to Cerner GitHub ruby org
* `gn PROJECT ALT_ENDPOINT (options)` Takes you to GitHub
* `gadd SHORTCUT MAPPING (options)` Add a custom shortcut
* `grem SHORTCUT (options)` Remove a custom shortcut


### Alternate Endpoints

* `b` - branches
* `c` - commits
* `p` - pull requests
* `r` - releases
* `s` - settings
* `t` - tags


### Options

* `-u`, `--user`, `-o`, `--org` The GitHub user/organization to use. This defaults to `hi-infra`
* `-c`, `--chef` This is a chef repo. This will add `_chef-repo` to the given project.
* `-j`, `--java-client` This is a Java client. This will add `-client` to the given project.
* `-r`, `--ruby-client` This is a Ruby client. This will add `_client` to the given project.
* `--server` The GitHub server to use. This defaults to `https://github.cerner.com`


### Maximizing the laziness
#### I have a \<project/org/user\> that is really long and annoying to type but there isn't a shortcut in this project for it!

FEAR NOT! There is a simple way to add your own shortcuts to the project!
Just use the `gadd` and `grem` alfred commands. Be default, these commands will add/remove a custom project mapping.
To create a custom chef repo shortcut or a user/org shortcut, pass the `-c` or `-u` options respectively.


#### I often go to projects for a different \<org/user\> than the default and typing out the \<org/user\> over and over is tedious

It is really easy to set up your own custom shortcut keywords with default options already set.

In Alfred, create a new keyword and 'Actions' script.
In the script put the following:
```
echo "<your option defaults> {query} <your option overrides>"
```

Hook up your keyword to your script and then hook up your script to the same script as default keywords.

For example, if you create a `gtool` keyword and put the following in the script:
```
echo "{query} -u hitoolsdev"
```

Calling the following in Alfred
```
gtool client_configuration_console p
```

will bring you to

```
https://github.cerner.com/hitoolsdev/client_configuration_console/pulls
```

