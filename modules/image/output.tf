output "ip" {
  value =kubernetes_service_v1.service.status.0.load_balancer.0.ingress.0.ip
}