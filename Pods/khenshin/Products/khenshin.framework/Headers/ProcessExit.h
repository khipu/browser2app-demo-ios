//
//  ProcessExit.h
//  khenshin
//
//  Created by Iván on 11/17/16.
//  Copyright © 2016 khipu. All rights reserved.
//

#ifndef ProcessExit_h
#define ProcessExit_h

@protocol ProcessExit

@required

- (void) configureWithPaymentSubject:(NSString*) subject
           formattedAmountAsCurrency:(NSString*) amount
                        merchantName:(NSString*) merchantName
                    merchantImageURL:(NSString*) merchantImageURL
                       paymentMethod:(NSString*) paymentMethod
                               title:(NSString*) title
                             message:(NSString*) message
                              finish:(void (^)(void)) finish;

@end
#endif /* ProcessExit_h */
