# TerraformDemo

1. Instalar AWS CLI
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

Descargar el paquete MSI desde https://awscli.amazonaws.com/AWSCLIV2.msi
Ejecutar a instalar

Comprobar desde la consola que se instaló AWS CLI con aws --version
El resultado debe ser así: aws-cli/2.25.11 

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
