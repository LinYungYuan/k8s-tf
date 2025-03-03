
resource "kubernetes_deployment_v1" "deployment" {
  metadata {
    name      = var.app_name
    namespace = var.namespace_name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = var.app_name
      }
    }
    template {
      metadata {
        labels = { app = var.app_name }
      }
      spec {
        container {
          image = var.image
          name  = var.app_name
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "service" {
  metadata {
    name = "${var.app_name}-svc"
    namespace = var.namespace_name
  }
  spec {
    selector = {
      app = var.app_name
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "NodePort" # or "LoadBalancer
  }
}
