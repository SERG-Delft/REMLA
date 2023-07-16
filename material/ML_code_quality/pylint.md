---
layout: page
title: Pylint
parent: MLQuality
grand_parent: Material
nav_order: 1
---

# {{page.title}}

This is a basic script to set up and use pylint.
Use the [sms project]({% link /remla/material/projects/sms-spam/ %}) as a base project.

*Note: do not forget to use a virtual environment, install dependencies, etc.*


**Install pylint:** (make sure you use the same version)

```bash
pip install pylint==2.12.2
```

**Run in a single file**
```
pylint src/text_classification.py
```

You should receive an output like this:

```
************* Module text_classification
src/text_classification.py:28:0: C0116: Missing function or method docstring (missing-function-docstring)
src/text_classification.py:28:33: C0103: Argument name "X_train" doesn't conform to snake_case naming style (invalid-name)
...
-----------------------------------
Your code has been rated at 8.04/10
```

- Look at the output closely and try to improve the score.

### Config file

Every project has its own particularities.
To do this right, we need to set up a configuration file that will tell `pylint` how to look for code quality issues.
You can generate a boilerplate config file with the following command.

```
pylint --generate-rcfile > pylintrc
```

In the config file, we can add extensions with more quality checks and we can also disable code patterns that do not apply to this project. For example, if we think that X_train is a common name within the ML community and we should allow it, we can update the "good-names" configuration key.

```
#before
good-names=i,
           j,
           k,
           ex,
           Run,
           _
#after
good-names=i,
           j,
           k,
           ex,
           Run,
           X_train,
           _
```

Run `pylint` again in the same file and see what happens.

**Note:** we should only enable/disable rules when we have a good reason for that.

**To discuss.**

- What are your thoughts about the code issues being raised?

