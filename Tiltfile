sync_src = sync('./application', '/var/www/html')

docker_build('laravel-php', '.', live_update=[sync_src])

k8s_yaml([
'storage.yaml',
'ingress.yaml',  
'php-deployment.yaml', 
'php-service.yaml', 
'nginx-configmap.yaml', 
'nginx-deployment.yaml', 
'nginx-service.yaml',
'mysql-service.yaml',
'mysql-pvc.yaml',
'mysql-pv.yaml',
'mysql-deployment.yaml',
'secret-store.yaml',
'ex-secrets.yaml'
])


