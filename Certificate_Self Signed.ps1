<#Author       : Dean Cefola
# Creation Date: 11-19-2019
# Usage        : Self-Signed Certificates
#
#********************************************************************************
# Date                         Version      Changes
#------------------------------------------------------------------------
# 11/19/2019                     1.0        Intial Version
#

#*********************************************************************************
#
#>

$cert = New-SelfSignedCertificate `
    -CertStoreLocation Cert:\LocalMachine\My `
    -DnsName <"The_Black_Within"> `
    -Type CodeSigningCert `
    -Subject <"The_Black_Within"> `
    -notafter (Get-Date).AddMonths(24) `
    -Verbose
$cert
$secPassword = ConvertTo-SecureString -String '<nani12345678>' -Force -AsPlainText
$certPath = "Cert:\LocalMachine\My\$($Cert.Thumbprint)"
Export-PfxCertificate -Cert $certPath -FilePath 'C:\temp\MSAzureAcademy-CodeSigning.pfx' -Password $secPassword

# Import-PfxCertificate -Password $secPassword -FilePath 'C:\temp\WVD\MSIX\Code Signing Cert\MSAzureAcademy CodeSigning.pfx' -CertStoreLocation 'Cert:\LocalMachine\TrustedPublisher'
