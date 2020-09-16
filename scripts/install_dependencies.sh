#!/bin/bash
set -e

# Xcodegen
brew install xcodegen
xcodegen generate

# Bundler
gem install bundler