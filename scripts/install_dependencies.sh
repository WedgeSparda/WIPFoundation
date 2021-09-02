#!/bin/bash
set -e

# Install Mint
brew install mint

# Install and run Xcodegen
mint run xcodegen

# Bundler to install Fastlane
gem install bundler