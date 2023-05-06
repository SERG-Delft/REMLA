---
layout: page
title: Create an Access Token
parent: Deployment with GitHub
grand_parent: Material
nav_order: 1
---

# {{page.title}}



## Creating a PAT

Github allows to create the "classic" tokens and the newer "fine-grained" tokens.
For the exercise, we are going to use the *classic tokens*.
Please [create a personal access token][create-pat] (PAT), make sure that you enable the scopes *write:packages* and *write:org*.

The permissions can also be changed later, by editing the token in the overview.

{: .caution}
Make sure that you save the token, as you will not be able to see it again.

[create-pat]: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-personal-access-token-classic

## Testing the PAT

The easiest way to test your PAT is to create a new (empty) repository `remla-test`.
Try to clone this repository *via HTTPS* and use your PAT as password.

    $ git clone https://github.com/YOURNAME/remla-test.git
    Cloning into 'remla-test'...
    Username for 'https://github.com': YOURNAME
    Password for 'https://YOURNAME@github.com': YOURPAT

*Important:* use your PAT as password, *NOT* your actual user password.
If you are able to clone the repository, congratulations, your PAT is working successfully!

{: .caution}
In practice, it is *strongly* recommended to register your SSH key and clone Git repositories via SSH.
The HTTPS clone should only be use for this test.




