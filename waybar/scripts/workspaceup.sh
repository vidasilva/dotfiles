#!/bin/bash
set -euo pipefail

workspace_up() {
    hyprctl dispatch 'hl.dsp.focus({ workspace = "-1" })'
}

workspace_up
