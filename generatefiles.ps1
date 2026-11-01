$ErrorActionPreference = "Stop"
$storyFile = Join-Path $PSScriptRoot "twine.twee"
$baseTitle = "Artichoke Templating"

function Set-StoryVersion {
    param(
        [string]$Start,
        [string]$IfId,
        [string]$BuildId,
        [string]$Title
    )

    $content = [System.IO.File]::ReadAllText($storyFile)

    $content = [regex]::Replace($content, '"start":\s*"[^"]*",', ('"start": "{0}",' -f $Start))
    $content = [regex]::Replace($content, '"ifid":\s*"[^"]*",', ('"ifid": "{0}",' -f $IfId))
    $content = [regex]::Replace($content, 'setup\.buildID = "[^"]*";', ('setup.buildID = "{0}";' -f $BuildId))
    $content = [regex]::Replace(
        $content,
        '(?ms)(^:: StoryTitle\r?\n).*?(?=\r?\n\r?\n:: StoryData)',
        ('$1' + $Title)
    )

    [System.IO.File]::WriteAllText($storyFile, $content, [System.Text.UTF8Encoding]::new($false))
}

function Invoke-Tweego {
    param([string]$OutputFile)

    & tweego $storyFile -o $OutputFile
    if ($LASTEXITCODE -ne 0) {
        throw "tweego failed while generating $OutputFile (exit code $LASTEXITCODE)."
    }
}

Push-Location $PSScriptRoot
try {
    if (-not (Get-Command tweego -ErrorAction SilentlyContinue)) {
        throw "tweego was not found in PATH. Please ensure it is installed and available to PowerShell."
    }

    # Reset to KS1 Eng before generating, including after an interrupted run.
    Set-StoryVersion -Start "landing-ks1-eng" -IfId "D0D58254-464A-48E7-BEBF-156628EC9A0C" -BuildId "ks1-eng" -Title "Artichoke Templating - KS1 Eng"
    Invoke-Tweego "ks1-eng.html"

    # KS1 Eng -> KS2 Eng
    Set-StoryVersion -Start "landing-ks2-eng" -IfId "D0D58254-464A-48E7-BEBF-156628EC9A0D" -BuildId "ks2-eng" -Title "Artichoke Templating - KS2 Eng"
    Invoke-Tweego "ks2-eng.html"

    # KS2 Eng -> KS1 Cym
    Set-StoryVersion -Start "landing-ks1-cym" -IfId "D0D58254-464A-48E7-BEBF-156628EC9A0E" -BuildId "ks1-cym" -Title "Artichoke Templating - KS1 Cym"
    Invoke-Tweego "ks1-cym.html"

    # KS1 Cym -> KS2 Cym
    Set-StoryVersion -Start "landing-ks2-cym" -IfId "D0D58254-464A-48E7-BEBF-156628EC9A0F" -BuildId "ks2-cym" -Title "Artichoke Templating - KS2 Cym"
    Invoke-Tweego "ks2-cym.html"
}
finally {
    Set-StoryVersion -Start "landing-ks1-eng" -IfId "D0D58254-464A-48E7-BEBF-156628EC9A0C" -BuildId "ks1-eng" -Title $baseTitle
    Pop-Location
}
