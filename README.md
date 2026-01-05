# MaterialIcons – Linux Icon Pack

A custom **Material-style icon theme** for Linux desktops, with extended
**developer-focused MIME icons** (Markdown, README, source files, config files, etc.).

Designed for **GTK-based desktops** (GNOME, Cinnamon, XFCE, MATE), with safe fallbacks
for other environments.

---

## Features

- Material-style folder & file icons
- Custom MIME icons for developer files:
  - Markdown (`.md`)
  - README files
  - TypeScript / TSX / JSX
  - Prisma, Rust, env files, gitignore, etc.
- Clean, spec-compliant icon naming
- User-level install (no `sudo` required)
- Safe install & uninstall scripts

---

## Repository Structure

```
.
├── MaterialIcons/
│   ├── index.theme
│   ├── scalable/
│   │   └── mimetypes/
│   │       ├── text-x-markdown.svg
│   │       ├── text-x-readme-markdown.svg
│   │       └── ...
│   └── ...
├── mime/
│   └── custom-mime.xml
├── install.sh
└── uninstall.sh
```

---

## Installation

```bash
git clone https://github.com/Ravish-Ranjan/MaterialIcons.git
cd MaterialIcons
chmod +x install.sh
./install.sh
```

---

## 🧪 Verification

```bash
ls ~/.icons/MaterialIcons/index.theme
xdg-mime query filetype README.md
```
---

## ⚠️ Notes

- Empty files are detected as `application/x-zerosize`

---

## 📜 License

MIT License
