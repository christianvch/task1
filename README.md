# Task1
###################################################
SOLUCION DE APP

- Python3 usando FASTAPI
- uvicorn para la exposicion del servicio
- Dockerfile

PREREQUISITO

- terraform version: Terraform v0.12.2
- Sistema operativo: Centos 7.x
- Cuenta de servicio creado con archivo .json
- Tener instalado Kubectl

PASOS DE EJECUCION

1) git clone "repositorio"
2) cd task1
3) sh deploy.sh --> Siendo:
- La tarea 1: CREAR el cluster.
- La tarea 2: DESTROY el cluster.
- La tarea 3: OUTPUT de la instalacion
4) PASOS MANUALES PARA CONEXION A GKE

-> Eliminamos autenticaciones recientes, si fuera necesario
 -  gcloud auth revoke --all

-> Conexion a gcp usando la cuenta de servicio creada y el archivo .json
 -  gcloud auth activate-service-account "Cuenta de servicio" --key-file="json file" --project="nombre del proyecto"

-> Conexion a cluster mediante kubectl
 -  gloud container clusters get-credentials "nombre gke" --region "region"

5) Validacion de instalacion de GKE
-  kubectl get nodes

6) Usando la carpeta app/

- kubectl apply -f app/deployment_app.yaml  (Creacion de app)
- kubectl apply -f app/service_app.yaml (Creacion de servicio)
- kubectl apply -f app/ingress.yaml (Creacion de ingress)

7) Funcionalidad de la aplicacion REST 
Con la ip del ingress ir al puerto 80
Ejemplo:

-> Funcionalidad 1 (SALUDO) 
- http://IP/greetings (Saludo Hello World)
-> Funcionalidad 2 (CUADRADO)
- http://IP/square/{Valor}
Retornar la potencia de un numero, es decir si colocamos de la siguiente manera tendremos "http://IP/square/10", tendremos: 
 "El cuadradod de 10 es: 100"







