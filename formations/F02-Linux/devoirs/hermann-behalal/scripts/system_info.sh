#!/usr/bin/env bash
set -euo pipefail

echo "Date:$(date)"
echo "Utilisateur:$(whoami)"
echo "Dossier courant: $(pwd)"
echo "Version du noyau: $(uname -r)"
echo "Espace disque:"
df -h /
