### Documents

```ps1
C:\Users\morty\Documents
$HOME\Documents
$Env:USERPROFILE
%USERPROFILE%
```

```ps1
git init
v .gitignore
    My Music/
    My Pictures/
    My Videos/
    PowerShell/Help/
    .desktop.ini

git add --all --verbose
git commit --message "$(date)"
gh auth status
    (gh auth login)
gh repo create acer_win_documents --public --source=. --remote=origin
git push --set-upstream origin main
```
