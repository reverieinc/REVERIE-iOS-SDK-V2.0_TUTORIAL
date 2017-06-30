//
//  Language.m
//  TestiOSSDK
//
//  Created by Sibir Das on 27/09/16.
//  Copyright © 2016 REVERIE LANGUAGE TECHNOLOGIES. All rights reserved.
//

#import "LanguageSDK.h"

@implementation LanguageSDK

- (LanguageSDK*)clone {
    LanguageSDK *lang = [[LanguageSDK alloc] init];
    lang.type = self.type;
    lang.name = [self.name copy];
    lang.selected = self.selected;
    return lang;
}

@end
