resource "azurerm_application_gateway" "APPGW01" {
    name = "APPGW01"
    location = var.location
    resource_group_name = azurerm_resource_group.RGAPP.name
  
    sku {
      name = "Standard_v2"
      tier = "Standard_v2"
      capacity = 2
    }

    gateway_ip_configuration {
      name = "appgw-ip-conf"
      subnet_id = azurerm_subnet.SUB-APPGW.id
    }

    frontend_port {
      name = "FrontEndPort"
      port = 80
    }

    frontend_ip_configuration {
      name = "FrontEndIp"
      public_ip_address_id = azurerm_public_ip.PIP-APPGW01.id
    }

    backend_address_pool {
      name = "BackEndPoolName"
    }

    backend_http_settings {
      name = "BackEndSettings01"
      cookie_based_affinity = "Disabled"
      port = 80
      protocol = "Http"
     }

     http_listener {
       name = "listener01"
       frontend_ip_configuration_name = "FrontEndIp"
       frontend_port_name = "FrontEndPort"
       protocol = "Http"
     }

    request_routing_rule {
      name = "rule01"
      rule_type = "Basic"
      priority = 10
      http_listener_name = "listener01"
      backend_http_settings_name = "BackEndSettings01"
    }
}
