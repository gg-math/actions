# My github actions

Inspired by https://resources.github.com/learn/pathways/automation/intermediate/create-reusable-workflows-in-github-actions

# Usage

In your workflow, run it and access to the action's outputs

``` yml
name: cicd

jobs:
  versioning:
    uses: gg-math/actions/.github/workflows/versioning.yml@master

  myJob:
    runs-on: ubuntu-latest
    needs: [versioning]

    steps:
    - run: |
        echo "The outputs: ${{ toJSON(needs.versioning.outputs) }}"
        echo "The version: ${{needs.versioning.outputs.version}}"
```
