#!/bin/bash

# Function to increment version numbers
increment_version() {
  local version="$1"
  local part="$2"
  local major
  major=$(echo "$version" | cut -d. -f1)
  local minor
  minor=$(echo "$version" | cut -d. -f2)
  local patch
  patch=$(echo "$version" | cut -d. -f3)

  case "$part" in
    major)
      major=$((major + 1))
      minor=0
      patch=0
      ;;
    minor)
      minor=$((minor + 1))
      patch=0
      ;;
    patch)
      patch=$((patch + 1))
      ;;
    *)
      echo "Invalid version part: $part"
      exit 1
  esac

  echo "$major.$minor.$patch"
}

# Fetch the latest tags
git fetch --tags

# Get the latest tag version
latest_tag=$(git describe --tags "git rev-list --tags --max-count=1")
latest_version=${latest_tag#v}
if [ -z "$latest_version" ]; then
  latest_version="0.0.0"
fi

echo "Current version: $latest_version"

# Prompt for version increment type
while true; do
  read -rp "Enter version increment type (major, minor, patch): " part
  if [[ "$part" =~ ^(major|minor|patch)$ ]]; then
    break
  else
    echo "Invalid input. Please enter 'major', 'minor', or 'patch'."
  fi
done

# Compute new version
new_version=$(increment_version "$latest_version" "$part")
echo "New version: $new_version"

# Tag the new version
git tag -a "v$new_version" -m "Version $new_version"
echo "Tagged new version: v$new_version"

# Push the tags to the remote
git push origin --tags
echo "Pushed tags to the remote repository"

echo "Versioning complete!"
