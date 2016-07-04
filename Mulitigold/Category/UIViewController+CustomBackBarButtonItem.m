//
//  UIViewController+CustomBackBarButtonItem.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/29.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "UIViewController+CustomBackBarButtonItem.h"
#import "UIBarButtonItem+CustomImage.h"
#import "objc/runtime.h"

@implementation UIViewController (CustomBackBarButtonItem)

static char CUSTOM_BACK_KEY;

//Using associative reference to fake category ivars
- (void) setCustomBackBarButtonItem:(UIBarButtonItem *)customBackBarButtonItem
{
    objc_setAssociatedObject(self, &CUSTOM_BACK_KEY, customBackBarButtonItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIBarButtonItem *)customBackBarButtonItem
{
    UIBarButtonItem *returnButton = (UIBarButtonItem *) objc_getAssociatedObject(self, &CUSTOM_BACK_KEY);
    
    //Check if there is a custom back bar button item set
    if (!returnButton) {
        //Return a default button if there isn't.
        returnButton = [UIBarButtonItem defaultBackButton];
    }
    
    return returnButton;
}

@end
