# 🐪 camelSyncer

**camelSyncer** is a lightweight, terminal-based document manager written in Bash.
It helps you create, organize, update, and manage project documentation files from
a **single centralized place**, directly from your terminal.

![CamelSyncer](./CamelSyncer.png)
---

## ✨ Features

- 📁 Centralized vault for all project docfiles
- 📝 Create Markdown docfiles instantly
- ✏️ Edit docfiles using your default `$EDITOR`
- 🗑️ Delete docfiles easily
- 📖 View docfiles using a terminal pager
- 🎨 Interactive TUI powered by `gum`

---

## 📦 Requirements

- Bash (>= 4)
- [`gum`](https://github.com/charmbracelet/gum)
- Any terminal-based editor (`nvim`, `vim`, `nano`, etc.)

Make sure your editor is set:
```bash
export EDITOR=nvim
````

---

## 🚀 Installation

```bash
git clone https://github.com/tree-1917/camelSyncer.git
cd camelSyncer
chmod +x main.sh
```

---

## ▶️ Usage

Run the tool:

```bash
./main.sh
```

You will get an interactive menu to:

* Create a docfile
* Update a docfile
* Delete a docfile
* List docfiles
* Exit

All documentation is stored inside the vault directory:

```
CAMELSYNCER/
├── design-notes/
│   └── design-notes.md
├── api-docs/
│   └── api-docs.md
```

---

## 🧠 How It Works

* Each docfile lives in its own directory
* Directory name equals the docfile name
* A Markdown file is created automatically
* `gum` handles all user interaction

---

## 🛠️ Customization

Change the vault name inside `main.sh`:

```bash
VAULTNAME="CAMELSYNCER"
```

Change the editor:

```bash
export EDITOR=vim
```

---

## 👤 Author

**Gamal Moussa**
System Engineer • DevOps • Linux Enthusiast

---

## 📄 License

MIT License


