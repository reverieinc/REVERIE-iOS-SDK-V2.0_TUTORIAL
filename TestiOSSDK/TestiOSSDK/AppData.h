//
//  AppData.h
//  TestiOSSDK
//
//  Created by RANVIJAI on 29/06/17.
//  Copyright © 2017 REVERIE LANGUAGE TECHNOLOGIES. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LanguageSDK.h"

@interface AppData : NSObject

@property (nonatomic, strong) LanguageSDK *language;
// To create singleton instance
+ (AppData*)sharedInstance;

@end
