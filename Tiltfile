
docker_build(
    'laranetes', 
    context='.', 
    dockerfile='./Dockerfile',
    live_update=[
        sync(local_path='./application', remote_path='/var/www/html')
    ])


k8s_yaml([
    './kubernetes/storage.yaml',
    './kubernetes/ingress.yaml',  
    './kubernetes/php-deployment.yaml', 
    './kubernetes/php-service.yaml', 
    './kubernetes/nginx-configmap.yaml', 
    './kubernetes/nginx-deployment.yaml', 
    './kubernetes/nginx-service.yaml',
    './kubernetes/mysql-service.yaml',
    './kubernetes/mysql-pvc.yaml',
    './kubernetes/mysql-pv.yaml',
    './kubernetes/mysql-deployment.yaml',
    './kubernetes/secret-store.yaml',
    './kubernetes/ex-secrets.yaml'
])


k8s_resource('mysql', new_name='mysql8', labels="backend")
k8s_resource('php', new_name='php8.2-fpm', labels="backend")
k8s_resource('nginx', new_name='nginx-1.21', labels='web')

k8s_resource(objects=['code:persistentvolumeclaim'], 
    new_name='code', 
    labels='volumes'
)

k8s_resource(
    objects=['mysql-pvc:persistentvolumeclaim', 'mysql-pv:persistentvolume'],
    new_name='database',
    labels="volumes"
)

k8s_resource(
    objects=['vault-backend:secretstore', 'external-secret:externalsecret'],
    new_name='vault',
    labels="secrets"
)

k8s_resource(objects=[
    'nginx-config:configmap',
    'ingress:ingress',

], new_name='cluster-setup', labels="cluster-setup")