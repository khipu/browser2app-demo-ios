# Browser2App
Version 2.0  
Build 20

Esta aplicación ha sido creada para demostrar la utilización de nuestra biblioteca khenshin. Para poder ejecutar esta aplicación es necesario que tengas acceso a nuestro repositorio privado(*): *https://bitbucket.org/khipu/khenshin-pod.git*

(*) Éstos datos serán entregados por tu *ejecutiva* ***Browser2App***

## Frameworks
* libxml2. Es necesario agregar esta biblioteca a tu proyecto antes de compilar con khenshin
 
## Cocoapod
Para instalar khenshin en tu proyecto es necesario utilizar cocoapods.
> **Archivo Podfile**  
> pod 'khenshin', :git => 'https://bitbucket.org/khipu/khenshin-pod.git', :tag => '1.36'

*Importante* **use_frameworks!**

## Add -Objc  
Valida que tu proyecto tenga configurada la bandera -Objc

> Project -> Build Settings -> Other Linker Flags -> *-Objc*

# Inicialización 
## Recursos
En *AppDelegate.m* puedes ver la inicialización de **khenshin**:  

* **NavigationBarCenteredLogo**: imagen para ubicarla al centro de la barra de navegación durante la inicialización.  
* **NavigationBarLeftSideLogo**: imagen para ubicarla a la izquierda de la barra de navegación en caso que se habilite **"Mira Como Funciona"**.  
* **TechnologyInsideImage**: En caso que quieras agregar tu logo durante el proceso de pago. Para ubicarlo centrado en la zona inferior durante el proceso de pago.
* **AutomatonAPIURL**: dirección URL para descargar los autómatas(*).
* **CerebroAPIURL**: dirección URL para informar de progreso de pago(*).
* **appToken**: string identificador de tu app. Debe ser permanente entre distintas ejecuciones de khenshin.
* **paymentProcessHeader**: Si has diseñado tu propio encabezado para el proceso de pago, éste es el parámetro para entregar una vista que implemente el protocolo *PaymentProcessHeader*
* **paymentProcessFailure**: Si has diseñado tu propia vista de fallo, éste es el parámetro para entregar un controlador que implemente el protocolo *PaymentProcessExit*
* **paymentProcessSuccess**: Si has diseñado tu propia vista de éxito, éste es el parámetro para entregar un controlador que implemente el protocolo *PaymentProcessExit*
* **paymentProcessWarning**: Si has diseñado tu propia vista de advertencia, éste es el parámetro para entregar un controlador que implemente el protocolo *PaymentProcessExit*
* **allowCredentialsSaving**: permites guardar credenciales. Por omisión es falso.
* **mainButtonStyle**: tipo de botón "Continuar". Las opciones se encuentran en "KhenshinEnums.h". Por omisión el botón va en la barra de navegación.
* **hideWebAddressInformationInForm**: permite esconder el UITextField que muestra información de la dirección web en que se encuentra el usuario. Por omisión se muestra esta información.
* **useBarCenteredLogoInForm**: En caso que se esconda la información de dirección puedes utilizar el logo *NavigationBarCenteredLogo* como relleno.
* **principalColor**: Para pintar la barra de navegación y el botón principal.
* **darkerPrincipalColor**: Para pintar el color secundario del botón principal.
* **secondaryColor**: asigna el TintColor de UIButton
* **navigationBarTextTint**: asigna el TintColor de UINavigationBar
* **font**: Si deseas asignar una fuente a khenshin.

**En esta versión, si no quieres utilizar imágenes puedes asignar una imagen vacía**

> [[UIImage alloc] init]

(*) Éstos datos serán entregados por tu *ejecutiva* ***Browser2App***

## Ejemplo de Inicialización
**Detalle se encuentra en AppDelegate.m**

```
[KhenshinInterface initWithNavigationBarCenteredLogo:[UIImage imageNamed:@"Bar Logo"]
                           NavigationBarLeftSideLogo:[[UIImage alloc] init]
                               technologyInsideImage:[UIImage imageNamed:@"khipu inside"]
                                     automatonAPIURL:[self safeURLWithString:KH_AUTOMATON_API_URL]
                                       cerebroAPIURL:[self safeURLWithString:KH_CEREBRO_URL]
                                            appToken:@""
                                paymentProcessHeader:[self paymentProcessHeader]
                               paymentProcessFailure:nil
                               paymentProcessSuccess:nil
                               paymentProcessWarning:[self warningViewController]
                              allowCredentialsSaving:NO
                                     mainButtonStyle:KHMainButtonFatOnForm
                     hideWebAddressInformationInForm:NO
                            useBarCenteredLogoInForm:NO
                                      principalColor:[self principalColor]
                                darkerPrincipalColor:[self darkerPrincipalColor]
                                      secondaryColor:[self secondaryColor]
                               navigationBarTextTint:[self navigationBarTextTint]
                                                font:[UIFont fontWithName:@"Avenir Next Condensed" size:15.0f]];

```
***safeURLWitString*** es un método que construye una URL con el String recibido codificándolos correctamente para direcciones web. 

Puedes configurar el estilo de la barra de estado.

* **PreferredStatusBarStyle**.

```
[KhenshinInterface setPreferredStatusBarStyle:UIStatusBarStyleLightContent];
```

## Parámetros de Ejecución
*Opcionales para ejecución*
 
* **userIdentifier**: se utiliza para generar un identificador único del usuario. Permite guardar y leer credenciales del medio de pago en caso que el usuario elijas guardarlas.

*Requeridos para ejecución*

* **PaymentExternalId**: Código de cobro entregado por khipu.com.  
* **isExternalPayment**: define que el pago se está realizando desde una aplicación distinta de khipu.
* **Success**: proceso a ejecutar cuando termina exitosamente el proceso de pago.  
* **Failure**: proceso a ejecutar cuando termina con fallas el proceso de pago.  

## Ejemplo de Ejecución
**Detalle se encuentra en ViewController.m**  

```
[KhenshinInterface startEngineWithPaymentExternalId:[url.path lastPathComponent]
                                     userIdentifier:@""
                                  isExternalPayment:YES
                                            success:^(NSURL *returnURL) {
                                                        
                                                NSLog(@"Success");
                                                NSLog(@"Retornamos con URL: %@", [returnURL absoluteString]);
                                            }
                                            failure:^(NSURL *returnURL) {
                                                        
                                                NSLog(@"Failure");
                                                NSLog(@"Retornamos con URL: %@", [returnURL absoluteString]);
                                            }
                                           animated:YES];
```