$files = Get-ChildItem ".\_posts"
$option = [System.StringSplitOptions]::RemoveEmptyEntries
foreach ($f in $files) {
    # Open Each File, locate and extract 'tags' from Front Matter if it exists
    foreach ($line in Get-Content $f.FullName) {
        if ($line -match '^tags:.*$') {
            # Tags Specified for Post, split and process
            $tags = $line.split(" ", $option);

            # Ignore the 'tags:' prefix and process the rest
            for ($i = 1; $i -lt $tags.Count; $i++) {
                # Does File exist already?
                $tagpath = 'tag\' + $tags[$i] + '.markdown';
                if (-not(Test-Path -Path $tagpath -PathType Leaf)) {
                    # File doesn't exist - create it
                    try {
                        $null = New-Item -Path $tagpath -Force -ErrorAction Stop
                        $frontMatter = "---`nlayout: tagspage`ntitle: ""Tag: " + $tags[$i] + """`ntag: " + $tags[$i] +"`n---";
                        Set-Content  $tagpath $frontMatter;
                        Write-Host "The file [$tagpath] has been created."
                    }
                    catch {
                        throw $_.Exception.Message
                    }
                }
            }
        }
    }
}