terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}
provider "kubernetes" {
  config_path = "./kubeconfig.yaml"
}

locals {
  name = ["frontend", "backend"]
}

resource "kubernetes_namespace" "namespace" {
  for_each = toset(local.name)
  metadata {
    name = each.value
  }
}

# resource "kubernetes_deployment_v1" "nginx" {
#   metadata {
#     name      = "nginx"
#     namespace = kubernetes_namespace.test["frontend"].metadata[0].namespace
#   }
#   spec {
#     replicas = 2
#     selector {
#       match_labels = {
#         app = "nginx"
#       }
#     }
#     template {
#       metadata {
#         labels = { app = "nginx" }
#       }
#       spec {
#         container {
#           image = "nginx:1.14.2"
#           name  = "nginx"
#           port {
#             container_port = 80
#           }
#         }
#       }
#     }
#   }
# }

# resource "kubernetes_service_v1" "nginx" {
#   metadata {
#     name = "nginx"
#   }
#   spec {
#     selector = {
#       app = "nginx"
#     }
#     port {
#       port        = 80
#       target_port = 80
#     }
#     type = "NodePort" # or "LoadBalancer
#   }
# }

# module "nginx-app" {
#   source         = "./modules/image"
#   app_name       = "nginx"
#   image          = "nginx:1.14.2"
#   namespace_name = kubernetes_namespace.namespace["frontend"].metadata[0].name
# }

# output "ip" {
#   value = module.nginx-app.svc_ip
# }