# README

<!-- TOC -->

- [README](#readme)
    - [Overview](#overview)
    - [Contacts](#contacts)
    - [Links](#links)
    - [Manual Updates of Source Code in this repo](#manual-updates-of-source-code-in-this-repo)
        - [Update Sources](#update-sources)
        - [Update Sources With cleanup/removal](#update-sources-with-cleanupremoval)
    - [Package Only and Inspect output (to PROD)](#package-only-and-inspect-output-to-prod)
        - [Build And Deploy to PROD](#build-and-deploy-to-prod)
    - [Setup CI/CD](#setup-cicd)
    - [Other Links](#other-links)

<!-- /TOC -->

## Overview

This Repository is a project template for managing IICS Assets

> TODO Provide Overview project description

## Contacts

> TODO *Update following table with corresponding Stakeholders for this project*

| Name | Role            | Email |
| ---- | --------------- | ----- |
|      | Project Manager |       |
|      | Project Owner   |       |
|      | Developer       |       |
|      | Administrator   |       |

## Links

> TODO Add links and references to other documentation

Such as

- Integrated Systems
- API Documentation
- Connections Documentation
- External dependencies on other projects and systems

## Manual Updates of Source Code in this repo

### Update Sources

Following is basic guide to use provided scripts and maintain IICS assets in in repository

```shell
ant update.src \
-Diics.release=./conf/iics.release.properties \
-Diics.source.environment=dev \
-Diics.export.list.location=./conf/export_list.txt
```

### Update Sources With cleanup/removal

Start with making sure you local repository up to date

```shell
git pull --rebase
```

This scrip will clean project target working directory and refresh sources  using a default project configuration while also removing any deleted assets from git repository

```shell
ant clean.src clean.target update.src \
-Diics.release=./conf/iics.release.properties \
-Diics.source.environment=dev \
-Diics.export.list.location=./conf/export_list.txt
```

Follow by updating the git repository

```shell
git add . && git commit -m "Update IICS Sources" && git push
```

## Package Only and Inspect output (to PROD)

```shell
ant package.src \
-Diics.release=./conf/iics.release.properties \
-Diics.target.environment=prod \
-Diics.target.package.config=./conf/all_designs.package.txt \
-Diics.package.transform.config=../../../conf/prod.transform.properties \
-Dtools.transform.disabled=false
```

### Build And Deploy to PROD

Regular update of previously deployed assets

```shell
ant build.deploy \
-Diics.release=./conf/iics.release.properties \
-Diics.target.environment=prod \
-Diics.target.package.config=./conf/all_exclude_connections.package.txt \
-Diics.package.transform.config=../../../conf/prod.transform.properties \
-Diics.target.publish.config=./conf/all_designs.publish.txt \
-Dtools.reporting.disabled=true \
-Dtools.transform.disabled=false
```

## Setup CI/CD

This project is pre configured to use GitHub Workflows to automate version control and release management steps for the IICS.

- [Automation to Build and Deploy IICS Design Packages](https://github.com/jbrazda/icai-ips-bundle/blob/master/doc/build.md)

## Other Links

- [Learn Markdown](https://guides.github.com/features/mastering-markdown/)
- [IICS Naming Conventions](https://github.com/jbrazda/Informatica/blob/master/Guides/InformaticaCloud/naming_conventions.md)