# TerraformDemo

1. Instalar AWS CLI
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

Descargar el paquete MSI desde https://awscli.amazonaws.com/AWSCLIV2.msi

Ejecutar a instalar

Comprobar desde la consola que se instaló AWS CLI con 
aws --version
El resultado debe ser así: aws-cli/2.25.11 

Ingrese a su cuenta de aws y cree una access key un un secret ID, los necesitará ingresar en el siguiente paso.

ejecute el siguiente comando en una consola:
aws configure
Ingrese los datos solicitados.

2. Instalar Terraform
   
Descarga el archivo ZIP de Terraform desde el sitio de Terraform.
https://developer.hashicorp.com/terraform/install

Extrae el archivo .exe del ZIP a una carpeta, por ejemplo: C:\Apps\Terraform, y copia esta ubicación de la ruta.

Agrega la ubicación de la carpeta a tu variable PATH, por ejemplo: Control Panel -> System -> System settings -> Environment Variables
En System Variables, selecciona Path > Edit > New > Ingresa la ubicación del archivo Terraform .exe, por ejemplo: C:\Apps\Terraform, luego haz clic en OK.

<img width="815" alt="path windows" src="https://github.com/user-attachments/assets/f400ee83-abac-48bc-9729-7ec4c842b986" />

Abrir una nueva terminal y escribir el comando terraform -version
debe tener el resultado Terraform v1.11.3 on windows_amd64
No use una terminal que ya tenga abierta, debe abrir una nueva después de agregar el path


## Estructura del proyecto

```bash
aws-infra/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── .gitignore
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── security/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf    


├── main.tf               # Aquí se invocan los módulos (vpc, security, ec2). Es el archivo principal que orquesta tu infraestructura.
├── variables.tf          # Define las variables globales que usarás en los módulos, como la región, el tipo de instancia, etc
├── terraform.tfvars      # Aquí se asignan valores concretos a las variables definidas, ideal para cambiar valores sin editar los archivos
├── outputs.tf            # Define los valores que quieres mostrar al final del terraform apply, como IP pública o IDs de recursos.
│
├── modules/              # Módulos reutilizables por servicio
│   ├── vpc/              # Este módulo crea la VPC y una subnet pública.
│   │   ├── main.tf
│   │   ├── variables.tf  # Recibe los CIDR (rangos IP) para la VPC y la subnet.
│   │   └── outputs.tf
│   │
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf  # Lanza una instancia EC2 en la subnet creada, usando el Security Group.
│   │   └── outputs.tf
│   │
│   └── security/         # Define un Security Group básico que permite tráfico SSH (puerto 22) y HTTP (puerto 80).
│       ├── main.tf
│       ├── variables.tf  # Recibe el ID de la VPC donde se va a crear el Security Group.
│       └── outputs.tf
│
└── provider.tf           # Configura el proveedor de infraestructura (en este caso AWS). Esencial para que Terraform sepa a qué nube conectarse.


Cómo desplegar:
1.  Inicializar Terraform
ingresar a la carpeta raiz
    terraform init
Esto descarga los proveedores y configura el backend

2. Previsualizar lo que se va a crear
Terraform revisa los cambios necesarios para alcanzar el estado deseado
    terraform plan

3. Aplicar el plan para desplegar   
    terraform apply


