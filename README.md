# repos-manager

> manages a collection of github repositories.

`repos-manager` was built to solve the problem of keeping several repositories in sync. 

## Usage

```
Usage:
  $ ./repos-manager.sh <cmd> [args]


Commands:
  show              shows repositories and their respective vers, 
                    i.e, their HEADS.

  clone [--shallow] clones all repositories to {ORGANIZATION}_TIMESTAMP. 
                    If "--shallow", then performs a shallow clone 
                    (depth: 1).

  sync-all          for every repository, goes to master, fetches fromm
                    upstream and  then performs a rebase.

  fetch             (EXPERIMENTAL) fetches latest revisions of each repository

  checkout <tag>    (EXPERIMENTAL) performs a 'git-checkout' to a given tag.
```


## Configuration

```
"repos-manager" requires a '.repos-managerrc' file in the current 
directory or at 'HOME'. The configuration file must define the 
following variables:

  - ORGANIZATION    name of the organization that holds the repos

  - REMOTE          name of the remote to fetch the repositories
                    (so that you can keep your 'origin' to the
                    fork

  - REPOS           array of repositories to perform actions on


Example:
  configuration file '{HOME}/Development/myorg/.repos-managerrc':
  
    '''
    #!/bin/bash

    readonly ORGANIZATION='myorg'
    readonly REMOTE='upstream'
    readonly REPOS=("repo1" "repo2" "repo3")

```

## Autocompletition

To autocomplete on `TAB` pressing you have to add either add `repos-manager/autocomplete` directory to `fpath` in `~/.zshrc` add the `autocomplete/_repos-manager` zsh script to one of zsh's autocomplete functions directories.

For example:

  ```zsh
  # in ~/.zshrc

  repos_manager_dir=$(readlink $(which repos-manager))
  fpath=($repos_manager_dir/autocomplete/ $fpath)
  compinit      # supposing you don't call a oh-my-zsh
                # function that ends up calling compinit
  ```

## LICENSE

MPLv2 ( Mozilla Public License 2)
