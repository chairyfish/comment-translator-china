$vsixpublish = Get-ChildItem -File .\packages -recurse | 
    Where-Object { $_.Name -eq "VsixPublisher.exe" } | 
    Sort-Object -Descending -Property CreationTime | 
    Select-Object -First 1 -ExpandProperty FullName

#�����˺ŵ�½
. $vsixpublish login -publisherName thealexdresko -personalAccessToken $env:commenttranslatorchinapublish

#��������ļ���vsix�ļ�·��
$overview = (Get-Item .\overview.md).FullName
$manifest = (Get-Item .\publish-manifest.json).FullName
$vsix = (Get-Item .\CommentTranslator\bin\Release\CommentTranslatorChina.vsix).FullName
Write-Host "vsix: $vsix"
Write-Host "manifest: $manifest"
Write-Host "overview: $overview"

# . $vsixpublish deleteExtension -extensionName "HomeSeerTemplates" -publisherName "thealexdresko"

. $vsixpublish publish -payload "$vsix" -publishManifest "$manifest"