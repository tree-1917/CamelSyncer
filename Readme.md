# camelSyncer

camelSyncer is a lightweight, terminal-based document manager written in Bash. It helps you create, organize, update, and manage project documentation files from a single centralized place, directly from your terminal.

![CamelSyncer](./CamelSyncer.png)

## Project Objective

Provide a simple, keyboard-driven interface to manage Markdown documentation files (docfiles) inside a local vault. The tool eliminates context switching by keeping all project notes, design records, or API documents accessible from one place, using only the terminal.

## Project Architecture

- **Core Language**: Bash (>=4)
- **User Interaction**: `gum` (Charm tool) for menus, input prompts, confirmations, and styling.
- **Vault Structure**:
  - A root directory named `CAMELSYNCER` (configurable)
  - Each docfile lives in its own subdirectory (named after the docfile)
  - Inside that subdirectory, a Markdown file with the same name (e.g., `design-notes/design-notes.md`)
- **Workflow**:
  - `create_docfile`: prompts for a name, creates the directory, and opens `$EDITOR` on the `.md` file.
  - `update_docfile`: uses `gum file` to browse the vault and opens the selected file in `$EDITOR`.
  - `delete_docfile`: browses, asks for confirmation, then removes the docfile's directory.
  - `list_docfiles`: browses and displays the content of a selected docfile using `gum pager`.
- **Planned Extensions** (stubs present):
  - `build_artifacte`: create an encrypted tarball of the vault.
  - `sync_github`: one‑way sync with a private GitHub repository.

## Project Features

- Centralized vault for all project docfiles
- Instant creation of Markdown docfiles
- Edit docfiles using your default `$EDITOR` (vim, nano, etc.)
- Delete docfiles with safety confirmation
- View docfiles with a terminal pager (`gum pager`)
- Interactive TUI powered by `gum`
- Automatic cleanup of temporary resources on exit

## Requirements

- Bash (>= 4)
- `gum` (Charmbracelet) – install via `brew install gum` or your package manager
- Any terminal-based editor (set via `export EDITOR=nvim` or similar)

## Installation

```bash
git clone https://github.com/tree-1917/camelSyncer.git
cd camelSyncer
chmod +x main.sh
```

## Usage

Run the tool:

```bash
./main.sh
```

You will see an interactive menu offering:

- create docfile
- update docfile
- delete docfile
- list docfiles
- exit

All documentation is stored inside the `CAMELSYNCER/` directory.

## Customization

Change the vault name inside `main.sh`:

```bash
VAULTNAME="MY_DOCS"
```

Change the editor:

```bash
export EDITOR=vim
```

## Project Contribution

Contributions are welcome. To contribute:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/your-idea`).
3. Make your changes, keeping the code POSIX‑compatible and using `gum` for all interactive parts.
4. Test thoroughly.
5. Open a pull request describing what your change does.

Areas that need attention:
- Complete `build_artifacte` (tar + gpg encryption).
- Implement `sync_github` (push encrypted tarball to private repo).
- Add configuration file support (e.g., for vault path, default editor).

## Author

Gamal Moussa – System Engineer / DevOps / Linux Enthusiast

## License

MIT License
