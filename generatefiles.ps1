$storyFile = "twine.twee"
$baseTitle = "Artichoke Templating"

function Set-StoryVersion {
    param(
        [string]$Start,
        [string]$IfId,
        [string]$BuildId,
        [string]$Title
    )

    $content = Get-Content -Path $storyFile -Raw

    $content = [regex]::Replace($content, '"start":\s*".*?",', "\"start\": \"$Start\",")
    $content = [regex]::Replace($content, '"ifid":\s*".*?",', "\"ifid\": \"$IfId\",")
    $content = [regex]::Replace($content, 'setup\.buildID = ".*?";', "setup.buildID = \"$BuildId\";")
    $content = [regex]::Replace(
        $content,
        '(?ms)^:: StoryTitle\s*\r?\n.*?(?=\r?\n\r?\n:: StoryData)',
        ":: StoryTitle`r`n$Title`r`n`r`n"
    )

    Set-Content -Path $storyFile -Value $content -NoNewline
}

if (-not (Get-Command tweego -ErrorAction SilentlyContinue)) {
    throw "tweego was not found in PATH. Please ensure it is installed and available to PowerShell."
}

# Start as KS1 Eng
Set-StoryVersion -Start "landing-ks1-eng" -IfId "D0D58254-464A-48E7-BEBF-156628EC9A0C" -BuildId "ks1-eng" -Title "Artichoke Templating - KS1 Eng"
& tweego $storyFile -o "ks1-eng.html"

# KS1 Eng -> KS2 Eng
Set-StoryVersion -Start "landing-ks2-eng" -IfId "D0D58254-464A-48E7-BEBF-156628EC9A0D" -BuildId "ks2-eng" -Title "Artichoke Templating - KS2 Eng"
& tweego $storyFile -o "ks2-eng.html"

# KS2 Eng -> KS1 Cym
Set-StoryVersion -Start "landing-ks1-cym" -IfId "D0D58254-464A-48E7-BEBF-156628EC9A0E" -BuildId "ks1-cym" -Title "Artichoke Templating - KS1 Cym"
& tweego $storyFile -o "ks1-cym.html"

# KS1 Cym -> KS2 Cym
Set-StoryVersion -Start "landing-ks2-cym" -IfId "D0D58254-464A-48E7-BEBF-156628EC9A0F" -BuildId "ks2-cym" -Title "Artichoke Templating - KS2 Cym"
& tweego $storyFile -o "ks2-cym.html"

# Restore original story state
Set-StoryVersion -Start "landing-ks1-eng" -IfId "D0D58254-464A-48E7-BEBF-156628EC9A0C" -BuildId "ks1-eng" -Title $baseTitle
