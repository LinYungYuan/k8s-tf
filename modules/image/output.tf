output "svc_ip" {
  value = kubernetes_service_v1.service.spec[0].cluster_ip
}
