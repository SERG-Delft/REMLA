---
layout: page
title: DSlinter
parent: MLQuality
grand_parent: Material
nav_order: 2
---

# {{page.title}}

This is a basic script to set up ds-linter to enable pylint to find ML-specific code smells.
Use the [sms project]({{"/remla/material/projects/sms-spam/" | absolute_path}}) as a base project. 
We assume you already executed the [pylint guide](./pylint).

**Install dslinter.**

```
pip install dslinter
```

**Run it.**

```
pylint --load-plugins=dslinter src/text_classification.py
```

**Add it to the config file.**

I'll let you figure this one out. After that, you should be able to run dslinter checks by default:

```
pylint src/text_classification.py
```

**To discuss.**

- What is the new code smell being detected? Does it apply here?
