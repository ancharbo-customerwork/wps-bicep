param storageAccountName string = 'msa${uniqueString(resourceGroup().id)}'
param appserviceplanname string = 'msp${uniqueString(resourceGroup().id)}'
param keyVaultName string = 'mkv${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location

module storageModule 'br/myRegistry:storage:v1' = {
  name: 'storageModuleDeployment'
  params: {
    storageAccountName: storageAccountName
    location: location
  }
}
module appServicePlanModule 'br:bicep0wps.azurecr.io/bicep/modules/appserviceplan:v1' = {
  name: 'appServicePlanDeployment'
  params: {
    appserviceplanname: appserviceplanname
    location: location
  }
}

module keyVaultModule 'br:bicep0wps.azurecr.io/bicep/modules/keyvault:v1' = {
  name: 'keyVaultDeployment'
  params: {
    keyVaultName: keyVaultName
    location: location
  }
}
