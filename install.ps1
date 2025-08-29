param(
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$Targets
)

$ErrorActionPreference = "Stop"
$DEFAULT_CONFIG_PREFIX = "default"
$CONFIG_SUFFIX = ".conf.yaml"
$DOTBOT_DIR = "dotbot"
$DOTBOT_BIN = "bin/dotbot"
$BASEDIR = $PSScriptRoot

Set-Location $BASEDIR
git -C $DOTBOT_DIR submodule sync --quiet --recursive
git submodule update --init --recursive $DOTBOT_DIR

# If no arguments provided, add "windows" automatically
if ($Targets.Length -eq 0) {
    $Targets = @("windows")
}

# Combine default config with any specified targets
$configs = @($DEFAULT_CONFIG_PREFIX) + $Targets

foreach ($conf in $configs) {
    $configFile = "${conf}${CONFIG_SUFFIX}"

    foreach ($PYTHON in ('python', 'python3')) {
        # Python redirects to Microsoft Store in Windows 10 when not installed
        if (& { $ErrorActionPreference = "SilentlyContinue"
                ![string]::IsNullOrEmpty((&$PYTHON -V))
                $ErrorActionPreference = "Stop" }) {
            &$PYTHON $(Join-Path $BASEDIR -ChildPath $DOTBOT_DIR | Join-Path -ChildPath $DOTBOT_BIN) -d $BASEDIR -p dotbot-if/if.py --plugin-dir dotbot-brewfile -c $configFile
            break
        }
    }

    if (-not (Get-Command python -ErrorAction SilentlyContinue) -and -not (Get-Command python3 -ErrorAction SilentlyContinue)) {
        Write-Error "Error: Cannot find Python."
    }
}
