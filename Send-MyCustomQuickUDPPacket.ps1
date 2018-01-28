Function Send-MyCustomQuickUDPPacket{

    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline=$True)]
        [Alias('IPAddress','FQDN','Destination','TargetHost','Hostname')]
        [string[]]$RemoteIP = "localhost",

        [int]$RemotePort = 53,

        [Alias('Source')]
        [string[]]$LocalIP = "localhost",

        [int]$LocalPort = 0,

        

        [byte[]]$Payload = [System.Text.Encoding]::ASCII.GetBytes("TEST of THE UDP Socket")

    
    ) #End Param

    BEGIN{
        Write-Verbose "Associating with System.Net"
        Add-Type -AssemblyName System.Net
    } #End BEGIN

    PROCESS{
        Write-Verbose "Creating UdpClient object with $LocalPort set as the localport"
        $UDPClient = New-Object System.Net.Sockets.UdpClient($LocalPort)
    

        $UDPClient.Connect($RemoteIP, $RemotePort)
        $UDPClient.Send($Payload, $Payload.Length)

        $UDPClient.Close()
    } #End PROCESS

    END{} #End END
    
} #End Function Send-MyCustomQuickUDPPacket