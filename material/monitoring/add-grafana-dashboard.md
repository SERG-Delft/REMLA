---
layout: page
title: Add Grafana Dashboard
parent: Monitoring
grand_parent: Material
---

# {{page.title}}

In this exercise, you will access Grafana, create a new dashboard, and use PromQL once more to add useful visualizations to the dashboard.

## Access Grafana

To access Grafana in your Prometheus stack installation, you need to use minikube once more to create a port-forward for the service.

    $ minikube service myprom-grafana --url

When you copy the URL to your browser, you can use the default credentials for authentication with Grafana (user: admin, password: prom-operator).
Please note that an actual deployment that is used in production should not require port forwards.
Instead, you should deploy an *Ingress* and make it available to the outside.

The dashboard might be overwhelming at first, but it is easy to navigate, once you understand the structure.
Strart by clicking the *Home Menu* that you can find in the top left (the [Hamburger button][hamburger]).

Navigate to the dashboards (Home » Dashboards) and open the "General" folder in the content.
This will reveal a large number of dashboards that come pre-installed with Grafana.
Explore some of these dashboards to understand about the capabilities of Grafana.

[hamburger]: https://en.wikipedia.org/wiki/Hamburger_button


## Add a new Dashboard

Go back to Home » Dashboards and *add a new Dashboard*.
In this dashboard, you can add a new *Visualization*.
In the wizard for the visualization, use `num_requests` as the target metric.
Apply the change, the visualization has now been added to the dashboard.

Add a second visualization and use `num_requests` as a metric once more.
This time, also add an operation to the metric and select the `rate` function.
Please note that the operation is parameterized and contains a variable for the range.
Instead of writing explicit PromQL queries, you build the queries up with the wizard.
This makes it possible to select a dynamic range later, when interacting with the visualizations.

Apply your change and go back to the dashboard overview.
Here, you can now arrange both plots nicely.
Change their size and placement and save the dashboard under the name "Request Statistics".
*Edit* both visualizations once more and give them a proper title (e.g., "Number of Requests" and "Request Rate").

Once you are back in the dashboard, interact with the visualization.
Try to use the buttons to zoom in/out or to change the time frame.
Please note that you can also select a part within a plot to indicate a timeframe.
All other plots will mimic this selection.



## Cleanup

To finish this exercise, uninstall the Prometheus stack.

    $ helm uninstall myprom
    release "myprom" uninstalled
    $ helm list
    NAME	NAMESPACE	REVISION	UPDATED	STATUS	CHART	APP VERSION

Do not forget to also delete your deployment of `showmetrics`.

    $ kubectl delete -f monitoring.yml
    pod "showmetrics" deleted
    service "my-service" deleted
    servicemonitor.monitoring.coreos.com "mymonitor" deleted

