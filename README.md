# Browser2App
Version 1.1  
Build 10

Esta aplicación ha sido creada para demostrar la utilización de nuestra biblioteca khenshin. Para poder ejecutar esta aplicación es necesario que tengas acceso a nuestro repositorio privado(*): *https://bitbucket.org/khipu/khenshin-pod.git*

(*) Éstos datos serán entregados por tu *ejecutiva* ***Browser2App***

## Frameworks
* libxml2. Es necesario agregar esta biblioteca a tu proyecto antes de compilar con khenshin
 
## Cocoapod
Para instalar khenshin en tu proyecto es necesario utilizar cocoapods.
> **Archivo Podfile**  
> pod 'khenshin', :git => 'https://bitbucket.org/khipu/khenshin-pod.git', :tag => '1.7'

*Importante* **use_frameworks!**

## Add -Objc  
Valida que tu proyecto tenga configurada la bandera -Objc

> Project -> Build Settings -> Other Linker Flags -> *-Objc*

# Inicialización 
## Recursos
En *ViewController.m* puedes ver la inicialización de **khenshin**, la cual  requiere:  

* **NavigationBarCenteredLogo**: imagen para ubicarla al centro de la barra de navegación durante la inicialización.  
* **NavigationBarLeftSideLogo**: imagen para ubicarla a la izquierda de la barra de navegación en caso que se habilite **"Mira Como Funciona"**.  
* **TechnologyInsideImage**: En caso que quieras agregar tu logo durante el proceso de pago. Para ubicarlo en la zona inferior izquierda durante el proceso de pago.
* **AutomatonURL**: dirección URL para descargar los autómatas(*).
* **CerebroURL**: dirección URL para informar de progreso de pago(*).
* **Color principal**: Para pintar la barra de navegación.

**En esta versión, si no quieres utilizar imágenes puedes asignar una imagen vacía**

> [[UIImage alloc] init]

(*) Éstos datos serán entregados por tu *ejecutiva* ***Browser2App***

## Parámetros de Ejecución
*Opcionales para ejecución*
  
* **PreferredStatusBarStyle**: configura el color de la barra de estado.
* **AppToken**, **userIdentifier**: se utilizan para generar un identificador único del usuario. Permite guardar y leer credenciales del medio de pago en caso que el usuario elija guardarlas.

*Requeridos para ejecución*

* **PaymentExternalId**: Código de cobro entregado por khipu.com.  
* **isExternalPayment**: define que el pago se está realizando desde una aplicación distinta de khipu.
* **Success**: Si deseas hacer algún proceso cuando termina exitosamente el proceso de pago.  
* **Failure**: Si deseas hacer algún proceso cuando termina con fallas el proceso de pago.  

## Ejemplo de Uso
**Detalle se encuentra en ViewController.m**

```
[KhenshinInterface initWithNavigationBarCenteredLogo:[UIImage imageNamed:@"Bar Logo"]
                                   NavigationBarLeftSideLogo:[[UIImage alloc] init]
                                       technologyInsideImage:[[UIImage alloc] init]
                                             automatonAPIURL:[self safeURLWithString:KH_AUTOMATON_API_URL]
                                               cerebroAPIURL:[self safeURLWithString:KH_CEREBRO_URL]
                                           andPrincipalColor:[UIColor colorWithRed:1.0
                                                                             green:0.0
                                                                              blue:16.0/255.0
                                                                             alpha:1.0]];
        [KhenshinInterface setPreferredStatusBarStyle:UIStatusBarStyleLightContent];
        [KhenshinInterface startEngineWithPaymentExternalId:[url.path lastPathComponent]
                                               withAppToken:@""
                                             userIdentifier:@""
                                          isExternalPayment:YES
                                                    success:^(NSURL* returnURL){
                                                        NSLog(@"Success");
                                                        NSLog(@"Retornamos con URL: %@", [returnURL absoluteString]);
                                                    } failure:^(NSURL* returnURL){
                                                        NSLog(@"Failure");
                                                        NSLog(@"Retornamos con URL: %@", [returnURL absoluteString]);
                                                    }];
```
***safeURLWitString*** es un método que construye una URL codificando correctamente los caracteres del String recibido. 