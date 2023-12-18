# CF CLI v8 Action
Use Cloud Foundry CLI v8 with this action. You can deploy applications, set environment variables and manage CF using the command line.

## Usage
To use this action, add it to your GitHub Workflow and set the following parameters:
Parameter name | Description
---------|----------
`cf_api` | API endpoint (e.g. https://api.cf.us10-001.hana.ondemand.com)
`cf_user` | User ID to log on
`cf_pwd` | Password to log on
`cf_org` | Target org ID
`cf_space` | Target space

## Example
The code snippet below is an example of how to set a GitHub workflow for MTA deployment.
```
name: Deploy Multi-Target App to CF
on:
  push:
    branches:
    - master
jobs:
  build:
    name: Build MTA
    runs-on: ubuntu-latest
    defaults:
      run:
        shell: bash
    # Set steps to build MTA and generate MTAR file

  deploy:
    runs-on: ubuntu-latest
    name: Deploy MTAR
    needs: build
    defaults:
      run:
        shell: bash
    steps:
    - name: Deploy to CF
      uses: evandropizaniramos/cf8-cli-action@main
      with:
        cf_api: https://api.cf.us10-001.hana.ondemand.com
        cf_user: ${{ secrets.CF_USER }}
        cf_pwd: ${{ secrets.CF_PWD }}
        cf_org: cf_org_id
        cf_space: Development
        cf_command: deploy ./mta_file.mtar -f --retries 3
```