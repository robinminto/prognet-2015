param (
  [switch] $Publish = $true,
  [string] $StorageAccount = 'robinprognet2015',
  [string] $StorageKey,
  [string] $StorageContainer = 'dscarchives'
)
 
$storageContext = New-AzureStorageContext -StorageAccountName $StorageAccount -StorageAccountKey $StorageKey

$blobs = Get-AzureStorageBlob -Container $StorageContainer -Context $storageContext -blob *.zip 
$blobs
$blobs | ForEach-Object {Remove-AzureStorageBlob -Blob $_.Name -Container $StorageContainer -Context $storageContext}

if ($Publish) {
  Publish-AzureVMDscConfiguration .\dsc-ex6.ps1 -StorageContext $storageContext -ContainerName $StorageContainer
}