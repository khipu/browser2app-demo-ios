//
//  ProcessHeader.h
//  khenshin
//
//  Created by Iván Galaz-Jeria on 11/11/16.
//  Copyright © 2016 khipu. All rights reserved.
//

#ifndef ProcessHeader_h
#define ProcessHeader_h

@protocol ProcessHeader

@required

- (void) configureWithSubject:(NSString*) subject
    formattedAmountAsCurrency:(NSString*) amount
                 merchantName:(NSString*) merchantName
             merchantImageURL:(NSString*) merchantImageURL
                paymentMethod:(NSString*) paymentMethod;

@end
#endif /* ProcessHeader_h */
