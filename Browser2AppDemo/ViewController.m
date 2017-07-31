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

@property (strong, nonatomic) NSTimer* timer;
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
//    [self startTimer];
    [KhenshinInterface startEngineWithAutomatonId: @"Bawdf"
                                         animated:YES
                                       parameters:@{@"subject": @"Pago Demo",
                                                    @"amount": @"2",
                                                    @"paymentId": [[NSUUID UUID] UUIDString],
                                                    @"khipu_account_name": @"Ran en BancoChile",
                                                    @"khipu_account_number": @"560024338",
                                                    @"khipu_alias": @"Cuenta Demo",
                                                    @"payer_name": @"Roberto Opazo",
                                                    @"payer_email": @"roberto@opazo.cl",
                                                    @"khipu_rut": @"9.123.845-4",
                                                    @"khipu_email": @"roberto.opazo@khipu.com"}
                                   userIdentifier:nil
                                          success:^(NSURL *returnURL) {
                                              
                                              NSLog(@"Volver con ¡éxito!");
                                              [self stopTimer];
                                          } failure:^(NSURL *returnURL) {
                                              
                                              NSLog(@"Volver con fracaso :(");
                                              [self stopTimer];
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

#define TIME_TO_WAIT_IN_SECONDS 5

- (void)startTimer {
    
    NSLog(@"Iniciando Timer");
    [self stopTimer];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:TIME_TO_WAIT_IN_SECONDS
                                                  target:self
                                                selector:@selector(report)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)stopTimer {
    
    NSLog(@"Deteniendo Timer");
    if (self.timer != nil) {
        
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void) report {
    
    NSLog(@"Reporting!");
    [self reporteReceived];
}

- (void) reporteReceived {
    
    NSLog(@"Report received!");
}

@end
