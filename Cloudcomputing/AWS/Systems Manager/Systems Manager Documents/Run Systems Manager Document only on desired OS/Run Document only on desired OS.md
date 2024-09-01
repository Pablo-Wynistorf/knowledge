Demo crossplattform systems manager document with OS detection:

```
{
  "schemaVersion": "2.2",
  "description": "Run system updates on Windows and Linux instances. This document starts Windows Update on Windows and updates and upgrades packages on Linux.",
  "mainSteps": [
    {
      "precondition": {
        "StringEquals": [
          "platformType",
          "Windows"
        ]
      },
      "action": "aws:runPowerShellScript",
      "name": "runWindowsUpdate",
      "inputs": {
        "runCommand": [
          "Write-Output 'Starting Windows Update...'",
          "Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser",
          "Import-Module PSWindowsUpdate",
          "Get-WindowsUpdate -AcceptAll -Install -AutoReboot",
          "Write-Output 'Windows Update process completed.'"
        ],
        "workingDirectory": "",
        "timeoutSeconds": 3600
      }
    },
    {
      "precondition": {
        "StringEquals": [
          "platformType",
          "Linux"
        ]
      },
      "action": "aws:runShellScript",
      "name": "runLinuxUpdate",
      "inputs": {
        "runCommand": [
          "#!/bin/bash",
          "echo 'Starting system update and upgrade...'",
          "sudo apt-get update -y",
          "sudo apt-get upgrade -y",
          "sudo apt-get dist-upgrade -y",
          "echo 'System update and upgrade completed.'"
        ],
        "workingDirectory": "",
        "timeoutSeconds": 3600
      }
    }
  ],
  "parameters": {
    "platformType": {
      "description": "(Required) Specify the platform type. Use 'Windows' or 'Linux'.",
      "type": "String",
      "allowedValues": [
        "Windows",
        "Linux"
      ]
    }
  }
}
```
