# cmdb_project_by_nextlinker_
[![Build Status](https://travis-ci.org/internnn/nextlinker_cmdb.svg?branch=master)](https://travis-ci.org/internnn/nextlinker_cmdb)

1. Use Terraformer and write tf codes of your infra

2. Pushing them onto GitHub and pull request triggers Travis CI and complete validation automatically

3. Travis CI informs AWX by webhook

4. In AWX, playbooks creates golden AMIs of our infra, save tfstate files to S3 and deploy the infra automatically.
