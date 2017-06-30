//
//  AppData.m
//  TestiOSSDK
//
//  Created by RANVIJAI on 29/06/17.
//  Copyright © 2017 REVERIE LANGUAGE TECHNOLOGIES. All rights reserved.
//

#import "AppData.h"

@implementation AppData
#pragma mark -  Public properties/methods
static AppData *data;
+ (AppData*)sharedInstance {
    if (!data) {
        data = [[AppData alloc] init];
    }
    return data;
}

@end
