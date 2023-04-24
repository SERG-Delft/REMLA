---
layout: page
title: Staff
nav_order: 5
parent: Course Info
---

# Course staff

## Lecturers

<table>
    <tbody>
    {% for lecturer in site.data.staff.lecturers %}
    <tr>
        <td>
            <img style="float: left; max-width: 50px; vertical-align: middle; border-right: 3px solid #00A6D6; padding-right: 3px; margin-right: 10px;" src="{{ lecturer.photo | relative_url }}"/>
            <p style="float: left; margin: 0;">
                <strong>{{ lecturer.name }}</strong><br/>
                {{ lecturer.research_group }}
            </p>
        </td>
        <td>{{ lecturer.email }}</td>
    </tr>
    {% endfor %}
    </tbody>
</table>

*Important:* Only reach out directly to the lecturers in matters that cannot be discussed publicly in the Mattermost channels. If your concerns requires a direct message though, please use email.


## TAs

<table>
    <tbody>
    {% assign ta_sorted = site.data.staff.tas | sort: 'name' %}
    {% for ta in ta_sorted %}
    <tr>
        <td style="border-right: 0px solid">
            {% if ta.photo %}
            <img style="float: left; max-width: 50px; vertical-align: middle; border-right: 3px solid #00A6D6; padding-right: 3px; margin-right: 10px;" src="{{ ta.photo | relative_url }}"/>
            {% else %}
            <img style="float: left; max-width: 50px; vertical-align: middle; border-right: 3px solid #00A6D6; padding-right: 3px; margin-right: 10px;" src="https://eu.ui-avatars.com/api/?name={{ ta.name }}&background=fff"/>
            {% endif %}
            <p style="float: left; margin: 0;">
                <strong>{{ ta.name }}</strong>
                {% if ta.netid %}
                <br/>
                <a href="https://mattermost.tudelft.nl/cse1105-2122-q3/messages/@{{ta.netid}}" style="color: #00A6D6; text-decoration: none;">
                    <img src="{{ '/assets/images/mattermost.png' | relative_url }}" style="max-width: 14px; vertical-align: middle;"/>
                    {{ ta.netid }}
                </a> - ✉️ {{ ta.email }}
                {% endif %}
            </p>
        </td>
        <td style="border-left: 0px solid; text-align: right; color: gray; font-style: italic;">
            {% if ta.groups and ta.spot %}
                Groups: {{ ta.groups }}<br />
            {% elsif ta.groups %}
                Groups: {{ ta.groups }}
            {% endif %}
            {% if ta.spot %}
                {{ ta.spot }}
            {% endif %}
        </td>
    </tr>
    {% endfor %}
    </tbody>
</table>