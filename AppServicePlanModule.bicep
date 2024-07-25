param appserviceplanname string
param location string = resourceGroup().location
param skuName string = 'F1'

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: appserviceplanname
  location: location
  sku: {
    name: skuName
    capacity: 1
  }
}
