#!/bin/bash
set -e

# Install Mint
brew install mint

# Install and run Xcodegen
mint run xcodegen

# Install SwiftLint
mint install realm/SwiftLint -n

# Bundler to install Fastlane
gem install bundler