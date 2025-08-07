# CRUSH.md - Nix Configuration Guidelines

This document outlines essential commands and code style guidelines for maintaining this Nix configuration.

## Build/Rebuild Commands

- **Full System Rebuild (NixOS):**
  `sudo nixos-rebuild switch --flake ./#desktop`
  (Replace `<hostname>` with your specific host, e.g., `desktop` or `laptop`)

- **Home Manager Rebuild (User-space):**
  `home-manager switch`

- **Applying changes:**
  After modifying any Nix file, always run `git add .` before rebuilding.

## Code Style Guidelines

- **Imports:**
  Organize imports logically, grouping related modules. Prefer `inputs.nixpkgs` for `pkgs` and `inputs.home-manager` for `home-manager`.

- **Formatting:**
  Adhere to standard Nix formatting. Use `nixpkgs-fmt` for automated formatting if available.

- **Naming Conventions:**
  - Use `kebab-case` for file and directory names (e.g., `common-packages.nix`).
  - Use `camelCase` for Nix attributes and variables (e.g., `programs.neovim`).

- **Modularity:**
  Break down configurations into small, manageable modules (e.g., `modules/audio.nix`, `home/zerg/alacritty.nix`).

- **Error Handling:**
  Nix's evaluation errors are typically caught at rebuild time. Ensure your configurations are robust and avoid common pitfalls like missing attributes or incorrect types.

- **Comments:**
  Use comments sparingly, focusing on complex logic or explanations of design choices rather than obvious syntax.
