terraform {
    required_providers {
        netskope = {
        version = "0.2.0"
        source  = "github.com/netskopeoss/netskope"
        }
    }
}

// Environment Varaible should be used for authentication instead of the Provider Block
//
//provider "netskope" {
//        	baseurl = "https://<tenant-url>.goskope.com"
//        	apitoken = "<api token>"
//}


resource "netskope_publishers" "Publisher" {
  name = "Example-Publisher"
}


output "publisher_details" {
  value = {
    name  = "${netskope_publishers.Publisher.name}"
    token = "${netskope_publishers.Publisher.token}"
  }
}


resource "netskope_privateapps" "PrivateApp" {
  app_name = "Eaxmple-Private-App"
  host     = "site.example.internal"

  protocols {
    type = "tcp"
    port = "22, 443, 8080-8081"
  }

  publisher {
    publisher_id   = netskope_publishers.Publisher.id
    publisher_name = netskope_publishers.Publisher.name
  }

}
