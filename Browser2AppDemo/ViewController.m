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
    [self.URLTextField setText:@"https://khipu.com/payment/simplified/ivudvbuomp3i"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bar Logo"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goPay:(id)sender {
    
    [self.view endEditing:YES];
    
    NSURL *url = [NSURL URLWithString:self.URLTextField.text];
    
    if (!url ||
        url.absoluteString.length == 0) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"La URL no corresponde a un pago generado en khipu.com"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* noAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil)
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
#pragma unused(action)
                                                             
                                                             [self.URLTextField becomeFirstResponder];
                                                         }];
        [alert addAction:noAction];
        
        [self presentViewController:alert
                           animated:YES
                         completion:nil];
    } else {
        
        NSLog(@"Llamando a khenshin!");
        
        [KhenshinInterface initWithNavigationBarCenteredLogo:[UIImage imageNamed:@"Bar Logo"]
                                   NavigationBarLeftSideLogo:[[UIImage alloc] init]
                                        tecnologyInsideImage:[[UIImage alloc] init]
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
    }
}

@end
