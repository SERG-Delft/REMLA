---
layout: default
title: "Tutorial 3: ML Pipelines"
hide_from_navbar: true
---

# Tutorial 3: ML Configuration Management

In this tutorial we are going to try ´mllint´ to test best practices, DVC to manage the ML pipeline
and version control artefacts, and we will use pylint to test some common ML scenarios.

## Intro Outline

- Initial Project: https://github.com/luiscruz/SMS-Spam-Detection
    - still needs a ton of refactoring
- Breakout rooms
- Everyone codes
- One team does a demo at the end

## 1. Set up

We will use the basic ML project used in the previous classes:

{% highlight Batchfile %}
git clone https://github.com/luiscruz/SMS-Spam-Detection
cd SMS-Spam-Detection
mkdir output
{% endhighlight %}

To have everyone on the same page, we are going to use a docker container with all dependencies installed.
(Note: you can also use your own setup — don't forget to create a `virtualenv` and install the dependencies in `requirements.txt`)

Build and run the docker:

{% highlight Batchfile %}
docker build --progress plain . -t docker-sms
docker run -it --rm -v "$(pwd)":/root/project docker-sms
{% endhighlight %}

Note: If the previous command did not work and you don't know what `$(pwd)` is, replace it by your
current directory.

Question: Could we use this Docker image for deployment? Why/Why not?

## 2. mllint

In this tutorial we will use `mllint` to help improve our `SMS-Spam-Detection` project.

{% highlight Batchfile %}
echo "mllint" >> requirements.txt
pip install -r requirements.txt
{% endhighlight %}

Run let's run `mllint` and check its output:

{% highlight Batchfile %}
mllint run
{% endhighlight %}

Analyse its output and verify what it says about data version control.

## 3. Data pipeline

{% highlight Batchfile %}
dvc init
dvc run -n get_data -d src/get_data.py -o dataset python src/get_data.py
{% endhighlight %}

In the above command we have added the first stage of the pipeline: `get_data`.
It depends on the script `src/get_data.py` (flag -d) and yields the output `dataset` (flag -o).
In the command above, we specify that the stage `get_data` is executed by running `python src/get_data.py`.


Check `dvc run` documentation to understand how it works.
Create a new stage, `preprocess`, that will run the script `src/text_preprocessing.py`
<!--dvc run -n preprocess -d dataset -d src/text_preprocessing.py -o output/preprocessor.joblib -o output/preprocessed_data.joblib python src/text_preprocessing.py
 -->

Now check how the pipeline looks like with the following command:

{% highlight Batchfile %}
dvc dag
{% endhighlight %}

You should get a directed acyclic graph (DAG) of all the stages in the pipeline.
You can also generate a DAG of the dependencies of all the artefacts:

{% highlight Batchfile %}
dvc dag --outs
{% endhighlight %}

Also check how the `dcv.yml` file looks like.

Add the `train` stage that runs the script `src/text_classification.py`.

<!--dvc run -n train -d output/preprocessed_data.joblib -d src/text_classification.py -o output/misclassified_msgs.txt -o output/accuracy_scores.png -o output/model.joblib python src/text_classification.py -->

### Demo

Someone in the class will be asked to present this part of the tutorial to the whole class.
Show us how the pipeline looks like and explain how you have specified it.


## Remotes

Previously, we have seen how to automate the execution of your data pipeline while avoiding to re-run it unnecessarily.

Now, imagine the case in which you changed something and execute the pipeline. If you have more people working in your project, everyone will have to re-run the pipeline in to retrieve the same artefacts.

To avoid such a waste of time and resources, DVC features the concept of remote: a storage that you can use to store your artefacts.

Remotes can live in your local storage (local remotes 🤷‍♂️) or in a cloud storage (e.g., Amazon S3, GDrive, etc.).

### Local Remotes

Set up a local "remote" called `localremote`.

{% highlight Batchfile %}
dvc remote add -d localremote /root/remotedvc
{% endhighlight %}

Check out how the project's config file stores this info:

{% highlight Batchfile %}
cat .dvc/config
{% endhighlight %}

To push all our artefacts to the remote, run the push command:
{% highlight Batchfile %}
dvc repro
dvc push
{% endhighlight %}

Now let's change something and see how the dvc is taking care of our artefacts: lets update the dataset. In the `src/get_data.py` change the URL to the following:
{% highlight python %}
URL = 'https://surfdrive.surf.nl/files/index.php/s/OZRd9BcxhGkxTuy/download' # v2
{% endhighlight %}

Now follow the next 3 steps:

1- reproduce the repo
2- commit changes to git
3- push the changes to the local dvc remote.

Voila. Your new version of the data pipeline is now backed up.

Revert the project to the old commit with the old dataset and reproduce the pipeline.
Explain what happened.

Confirm that the dataset is in fact the old version by checking its size (should be 1000):
{% highlight Batchfile %}
wc dataset/SMSSpamCollection
{% endhighlight %}


Revert to the head of the branch and check again that dvc took care of retrieving the latest artefacts (dataset should have 2000 data points).


### Cloud Remotes

Instead of having a *remote* stored locally, we can store it using cloud storage. In this example, we will use google drive.
In this step you can have only one teammate setting this up while the others 

To make things clear, start by removing the local remote:

```
dvc remote remove localremote
git commit -am "delete dvc remote 'localremote'"
```

1. Create a folder in your Google drive
    1.1 Share it with your teammates.
    1.2 Copy the folder id from its page url (e.g., `1zUHN-qHKDKvQE8igLPVZ2JMQvrAjyxa`)

2. Follow the instructions in the following documentation page to add a GDrive remote:

https://dvc.org/doc/user-guide/setup-google-drive-remote#url-format

<!-- dvc remote add --default myremote gdrive://1LzUHN-qHKDKvQE8igLPVZ2JMQvrAjyxa/dvcstore
dvc push -->

3. Change something and see how the dvc is taking care of our artefacts. For example, update the dataset to version v3 by updating `URL` in `src/get_data.py`:

{% highlight python %}
URL = 'https://surfdrive.surf.nl/files/index.php/s/H4e35DvjaX18pTI/download' # v2
{% endhighlight %}

4. Rerun the pipeline. Commit and push your changes to git; push them to the dvc remote.

5. Ask your colleagues to `pull` the pipeline (git and dvc) and notice that all the artefacts are there.

## Experiment Management

ML is an experimental process.
Each new experiment needs to be analysed and compare against certain metrics.
Here's how to manage experiments using dvc.

1. You will have to change the training script (`src/text_classification.py`) to output its metrics to a JSON file (could also be YAML).
    - Do a `json.dump` to store the accuracy of the model.
    - It should output a JSON file like the following:
    
```json
{"accuracy": 0.9566666666666667}
```

2. Change the `dvc.yml` file to include the metrics of the stage `train`. Hint: check the docs to see an example of a `dvc.yml` with metrics: https://dvc.org/doc/command-reference/metrics

3. Run the experiment `dvc exp run`

4. See the difference by running `dvc metrics diff`

5. Change something in your project (e.g., change the random state) and run a new experiment.

6. Check the experiment log:

```
$ dvc exp show
┏━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┓
┃ Experiment              ┃ Created  ┃ accuracy ┃
┡━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━┩
│ workspace               │ -        │ 0.94167  │
│ dvc-tutorial            │ 09:46 AM │ 0.945    │
│ ├── 3f12aef [exp-7f800] │ 09:51 AM │ 0.94167  │
│ └── 8f30720 [exp-44136] │ 09:48 AM │ 0.945    │
└─────────────────────────┴──────────┴──────────┘
```

## Testing with Pylint

Create a test that will test the difference of running two models with 2 different random seeds.
The test should fail if the difference is above 0.1.

You should have a new folder, named tests:

```
.
├── src
│   ├── __init__.py
│   ├── get_data.py
│   ├── read_data.py
│   ├── serve_model.py
│   ├── text_classification.py
│   └── text_preprocessing.py
    └── tests
        ├── __init__.py
        └── test_simple.py
```

**Hint:** You will probably have to import the method `text_classification.main` and change it to accept a parameter with the random seed.

Execute the test by running `pytest`:

{% highlight Batchfile %}
pytest
{% endhighlight %}


### Extra mile

Create a new test base on our class on ML testing.


## Datasets

- v1 (1000 datapoints): https://surfdrive.surf.nl/files/index.php/s/WCPP8WJPrtCbUO5/download
- v2 (2000 datapoints): https://surfdrive.surf.nl/files/index.php/s/OZRd9BcxhGkxTuy/download
- v3 (3000 datapoints): https://surfdrive.surf.nl/files/index.php/s/H4e35DvjaX18pTI/download
- v4 (4000 datapoints): https://surfdrive.surf.nl/files/index.php/s/HU5mY29RzxRlHCU/download
