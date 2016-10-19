//
//  UINavigationController+Extras.m
//  khenshin
//
//  Created by Iván Galaz-Jeria on 9/29/16.
//  Copyright © 2016 khipu. All rights reserved.
//

#import "UINavigationController+Extras.h"


@implementation UINavigationController (Extras)

-(UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

-(UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

@end
