sync_src = sync('./application', '/var/www/html')

docker_build('laravel-php', '.', live_update=[sync_src])

k8s_yaml([
'storage.yaml',
'ingress.yaml',  
'php_deployment.yaml', 
'php_service.yaml', 
'nginx-configmap.yaml', 
'nginx_deployment.yaml', 
'nginx_service.yaml',
])


