$p = $env:APPDATA + "\Nuget\Nuget.config"
$codeArtifactRepository = (Select-Xml -Path $p -XPath "/configuration/packageSources/add" | Select-Object -ExpandProperty Node | Where { $_.key -eq "codeartifact" }).value
$majorVersion =  [string]::Join('.', ( (Get-Date).Year, (Get-Date).Month, (Get-Date).Day))
$myBuildNumber = [string]::Format("{0}.{1}", $majorVersion, (Get-Date).Minute)

Remove-Item .\publish\ -Recurse

dotnet pack -p:Version=$myBuildNumber -o publish\
dotnet nuget push publish\ -s $codeArtifactRepository
