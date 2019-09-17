if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) {throw "$env:ProgramFiles\7-Zip\7z.exe needed"}
set-alias sz "$env:ProgramFiles\7-Zip\7z.exe"
$dirname = (Get-Item -Path ".\").Name
$fulldir = (Get-Item -Path ".\").FullName
$base =  (Get-Item -Path "..\").FullName
$zipname= $fulldir+"\"+$dirname+".zip"

remove-item $zipname
Compress-Archive -Path $fulldir -DestinationPath $zipname -CompressionLevel Optimal
sz d $zipname *.ps1 .gitattributes .gitignore *.md -r
