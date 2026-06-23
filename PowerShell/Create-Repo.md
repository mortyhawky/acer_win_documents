#### Create Repo

##### win_pwsh.git

```ps1
c $HOME\Documents\PowerShell
git init
git add -Av
git commit -m "$(date)"
```

```ps1
gh auth status
```

```ps1
gh repo create win_pwsh --public --source=. --remote=origin
```

```ps1
git push -u origin main
git status
```
