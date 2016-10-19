# Browser2App
Version 1.1  
Build 10

Esta aplicación ha sido creada para demostrar la utilización de nuestra biblioteca khenshin. Para poder ejecutar esta aplicación es necesario que tengas acceso a nuestro repositorio privado: *https://bitbucket.org/khipu/khenshin-pod.git*

## Frameworks
* libxml2. Es necesario agregar esta biblioteca a tu proyecto antes de compilar con khenshin
 
## Cocoapod
Para instalar khenshin en tu proyecto es necesario utilizar cocoapods.
> **Archivo Podfile**  
> pod 'khenshin', :git => 'https://bitbucket.org/khipu/khenshin-pod.git', :tag => '1.5'

*Importante* **use_frameworks!**

## Add -Objc  
Valida que tu proyecto tenga configurada la bandera -Objc

> Project -> Build Settings -> Other Linker Flags -> *-Objc*

## Add No Bitcode  
khenshin 1.1 no tiene habilitado Bitcode por lo que tendrás que deshabilitarlo en tu proyecto

> Project -> Build Settings -> Enable Bitcode -> *No*

# Configuración 
## Recursos
En *ViewController.m* puedes ver la inicialización de **khenshin**, la cual  requiere:  

* Logo para ubicarlo al centro de la barra de navegación durante la inicialización  
* Logo para ubicarlo a la izquierda de la barra de navegación en caso que se habilite **"Mira Como Funciona"**  
* Logo para ubicarlo en la zona inferior izquierda durante el proceso de pago  
* Color principal. Para pintar la barra de navegación.

**En esta versión, si no quieres utilizar imágenes puedes asignar una imagen vacía**

> [[UIImage alloc] init]

## Parámetros
Existen varios parámetros configurables
  
* **PreferredStatusBarStyle**: (*opcional*) configura el color de la barra de estado.
* **PaymentExternalId**: Código de cobro entregado por khipu.com.
* **Success**: Si deseas hacer algún proceso cuando termina exitosamente el proceso de pago.
* **Failure**: Si deseas hacer algún proceso cuando termina con fallas el proceso de pago.  