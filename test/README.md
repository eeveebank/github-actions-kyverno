# Github Actions: Kyverno Test

Simplified Github action which test kyverno policies.

# Example Workflow

```
name: Kyverno Test
on: pull_request
jobs:
  kyverno:
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v2
      - name: Test Kyverno Policies
        uses: eeveebank/github-actions-kyverno/test@master
        with:
          folder: path/to/tests/folder
```
