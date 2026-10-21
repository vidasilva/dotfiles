#!/bin/bash
set -euo pipefail

workspace_down() {
    hyprctl dispatch 'hl.dsp.focus({ workspace = "+1" })'
}

workspace_down
