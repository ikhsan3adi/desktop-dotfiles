function customfastfetch {
  fastfetch -c D:\ngoding\other\mydotfiles\fastfetch\config.jsonc
}

oh-my-posh init pwsh --config "D:\ngoding\other\mydotfiles\oh-my-posh\ikhsan3adi-2.omp.json" | Invoke-Expression

Set-Alias -Name c -Value clear
Set-Alias -Name ff -Value customfastfetch