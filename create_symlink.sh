#!/bin/bash

# Source and target directories
SOURCE_DIR="$(pwd)"
TARGET_DIR="$HOME/.local/share/typst/packages/local/edukar/1.1.0"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Function to create symlinks
create_symlink() {
  local source_path="$1"
  local target_path="$2"

  if [ -e "$source_path" ]; then
    ln -sf "$source_path" "$target_path"
    echo "Symlink created: $target_path -> $source_path"
  else
    echo "Error: Source path does not exist: $source_path"
  fi
}

# Create symlinks for typst.toml
create_symlink "$SOURCE_DIR/typst.toml" "$TARGET_DIR/typst.toml"

# Create symlinks for src/ directory
create_symlink "$SOURCE_DIR/src" "$TARGET_DIR/src"

# Create symlinks for src/edukar.typ
create_symlink "$SOURCE_DIR/src/edukar.typ" "$TARGET_DIR/src/edukar.typ"

# Create symlinks for src/assets/ directory
create_symlink "$SOURCE_DIR/src/assets" "$TARGET_DIR/src/assets"

# Create symlinks for all files inside src/assets/
if [ -d "$SOURCE_DIR/src/assets" ]; then
  for file in "$SOURCE_DIR/src/assets"/*; do
    if [ -f "$file" ]; then
      create_symlink "$file" "$TARGET_DIR/src/assets/$(basename "$file")"
    fi
  done
else
  echo "Error: Source assets directory does not exist: $SOURCE_DIR/src/assets"
fi

echo "Symlink creation complete!"
