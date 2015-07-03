param (
    [string] $StorageAccount = 'robinprognet2015',
    [string] $StorageKey,
    [string] $StorageContainer = 'dscarchives'
    )
 
$storageContext = New-AzureStorageContext -StorageAccountName $StorageAccount -StorageAccountKey $StorageKey
