# Steph's Mac Terminal Setup Guide

*Made with love by Jed*

A step-by-step guide to get your terminal looking pretty and set up with Claude Code + Railway.

---

## 1. Install Homebrew

Homebrew is the package manager for macOS. Open Terminal and run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After it finishes, run this to add it to your path:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

---

## 2. Install & Configure Git

Git comes with macOS but let's make sure you have the latest version and set it up:

```bash
brew install git
```

### Configure your identity

Tell git who you are (use your GitHub email):

```bash
git config --global user.name "Steph"
git config --global user.email "your-email@example.com"
```

### Set up SSH key for GitHub

This lets you push/pull without typing your password:

```bash
# Generate a new SSH key
ssh-keygen -t ed25519 -C "your-email@example.com"

# Start the SSH agent
eval "$(ssh-agent -s)"

# Add your key to the agent
ssh-add ~/.ssh/id_ed25519

# Copy the public key to clipboard
pbcopy < ~/.ssh/id_ed25519.pub
```

Now go to [GitHub Settings > SSH Keys](https://github.com/settings/keys), click "New SSH key", and paste your key.

Test it works:

```bash
ssh -T git@github.com
```

You should see "Hi [username]! You've successfully authenticated..."

---

## 3. Install Your Dotfiles

These are config files that make your terminal and vim look nice.

```bash
# Clone the repo
git clone https://github.com/JedIV/steph-dotfiles.git ~/steph-dotfiles

# Copy the config files to your home directory
cp ~/steph-dotfiles/.zshrc ~/.zshrc
cp ~/steph-dotfiles/.vimrc ~/.vimrc

# Reload your shell
source ~/.zshrc
```

### First time opening Vim

The first time you open vim, it will auto-install a plugin manager. Then run:

```vim
:PlugInstall
```

This installs the colorscheme and other plugins. Quit and reopen vim to see the pretty colors!

---

## 4. Install Node.js

Claude Code requires Node.js. Install it with Homebrew:

```bash
brew install node
```

Verify it's installed:

```bash
node --version  # Should show v18 or higher
npm --version
```

---

## 5. Install Claude Code

Claude Code is Anthropic's AI coding assistant for the terminal.

```bash
npm install -g @anthropic-ai/claude-code
```

### Authenticate

Run Claude Code for the first time to log in:

```bash
claude
```

This will open a browser window to authenticate with your Anthropic account. Follow the prompts to log in.

### Quick Commands

Once set up, you can use Claude Code like this:

```bash
# Start an interactive session
claude

# Ask a quick question
claude "how do I list files in bash?"

# Work on a specific project
cd your-project
claude
```

---

## 6. Install Railway CLI

Railway is a platform for deploying apps. Install the CLI:

```bash
brew install railway
```

### Authenticate

Log in to your Railway account:

```bash
railway login
```

This opens a browser to authenticate. Once logged in, you're good to go!

### Quick Commands

```bash
# Link to an existing project
railway link

# Deploy your app
railway up

# View logs
railway logs

# Open your project dashboard
railway open
```

---

## Quick Reference

| What | Command |
|------|---------|
| Reload shell config | `source ~/.zshrc` or `reload` |
| Edit shell config | `zshrc` |
| Edit vim config | `vimrc` |
| Git status | `gs` |
| Git add | `ga` |
| Git commit | `gc` |
| Open file tree in vim | `\` |
| Start Claude | `claude` |
| Deploy to Railway | `railway up` |

---

## Troubleshooting

### Colors look wrong in Terminal

Make sure you're using a terminal that supports 256 colors. The built-in Terminal.app works fine.

### Vim plugins didn't install

Open vim and run:

```vim
:PlugInstall
```

### "command not found" errors

Your PATH might not be set up. Run:

```bash
source ~/.zshrc
```

Or restart your terminal.

### Railway not found after install

```bash
brew link railway
```

---

## Optional: Nice Extras

### Install fzf (fuzzy finder, makes Ctrl+R even better)

```bash
brew install fzf
$(brew --prefix)/opt/fzf/install
```

