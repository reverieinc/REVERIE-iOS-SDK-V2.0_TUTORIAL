//
//  Language.h
//  TestiOSSDK
//
//  Created by Sibir Das on 27/09/16.
//  Copyright © 2016 REVERIE LANGUAGE TECHNOLOGIES. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDKEnum.h"

@interface LanguageSDK : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic) LanguageType type;
@property (nonatomic) BOOL selected;

- (LanguageSDK*)clone;

@end
