
docker_build(
    'laranetes', 
    context='.', 
    dockerfile='./Dockerfile',
    live_update=[
        sync(local_path='./application', remote_path='/var/www/html')
    ])


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


