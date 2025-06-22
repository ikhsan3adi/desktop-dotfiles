function customfastfetch {
  fastfetch -c D:\ngoding\other\mydotfiles\fastfetch\config.jsonc
}

oh-my-posh init pwsh --config "D:\ngoding\other\mydotfiles\oh-my-posh\gofx-mocha.omp.json" | Invoke-Expression

Set-Alias -Name c -Value clear
Set-Alias -Name ff -Value customfastfetch