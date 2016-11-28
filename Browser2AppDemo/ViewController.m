//
//  ViewController.m
//  Browser2AppDemo
//
//  Created by Iván Galaz-Jeria on 10/7/16.
//  Copyright © 2016 khipu. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+Extras.h"
#import <khenshin/khenshin.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *URLTextField;

@end

@implementation ViewController

- (UIStatusBarStyle) preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bar Logo"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goPay:(id)sender {
    
    // EJEMPLO PARA B2A CMR
    [KhenshinInterface startEngineWithAutomatonId: @"Bawdf"
                                         animated:YES
                                       parameters:@{@"subject": @"Pago Demo",
                                                    @"amount": @"2",
                                                    @"paymentId": [[NSUUID UUID] UUIDString],
                                                    @"khipu_account_name": @"Cuenta Demo",
                                                    @"khipu_account_number": @"123456789",
                                                    @"khipu_alias": @"Cuenta Demo",
                                                    @"payer_name": @"Rubén Blades",
                                                    @"payer_email": @"ruben.blades@demobank.com",
                                                    @"khipu_rut": @"12.345.678-9",
                                                    @"khipu_email": @"transferencias@khipu.com"}
                                   userIdentifier:nil
                                          success:^(NSURL *returnURL) {
                                              
                                              NSLog(@"Volver con ¡éxito!");
                                          } failure:^(NSURL *returnURL) {
                                              
                                              NSLog(@"Volver con fracaso :(");
                                          }];
    
    // EJEMPLO PARA PAGOS GENERADOS CON API khipu
    /*
    [KhenshinInterface startEngineWithPaymentExternalId:ID GENERADO POR khipu
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
     
     
     */
}



@end
