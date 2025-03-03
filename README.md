# k8s-tf
k8s
1.首先，確認您正在使用正確的 Kubernetes 上下文：
kubectl config current-context

2.檢視當前的 kubeconfig 內容：
kubectl config view

3.創建一個新的 kubeconfig 文件，僅包含當前上下文：
kubectl config view --raw --minify > kubeconfig.yaml