### $Env:USERPROFILE\Documents

```ps1
cd C:\Users\morty\Documents
cd $HOME\Documents
cd $Env:USERPROFILE\Documents
```
```cmd
echo %USERPROFILE%
cd %USERPROFILE%
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
