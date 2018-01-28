Function Get-MyStringToSHA512 { 

    Param(
        [Parameter(ValueFromPipeline=$True,
                   ValueFromPipelineByPropertyName=$True,
                   Mandatory=$True)]
        [String]$String,

        [ValidateSet('SHA256','SHA-256','SHA384','SHA-384','SHA512','SHA-512')]
        [string]$HashName = "SHA512"
    )

    BEGIN {}

    PROCESS {
        $StringBuilder = New-Object System.Text.StringBuilder 
        [System.Security.Cryptography.HashAlgorithm]::Create($HashName).`
            ComputeHash([System.Text.Encoding]::UTF8.GetBytes($String))| ForEach-Object{ 
            [Void]$StringBuilder.Append($PSItem.ToString("x2")) 
            } 
        $StringBuilder.ToString() 
        } #PROCESS

    END{}

} #End Function Get-MyStringToSHA512