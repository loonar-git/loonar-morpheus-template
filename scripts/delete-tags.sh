#!/bin/bash

# Delete local tags
git tag -l | xargs git tag -d

# Delete remote tags
git ls-remote --tags origin | awk '{print $2}' | grep -v '{}' | sed 's#refs/tags/##' | xargs -I {} git push origin :refs/tags/{}
