//
//  HomeController.m
//  TestiOSSDK
//
//  Created by RANVIJAI on 29/06/17.
//  Copyright © 2017 REVERIE LANGUAGE TECHNOLOGIES. All rights reserved.
//

#import "HomeController.h"
#import "SDKManager.h"
#import "AppData.h"

@interface HomeController ()
@property (weak, nonatomic) IBOutlet UITextView *txtView;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([AppData sharedInstance].language) {
        self.title = [NSString stringWithFormat:@"Keypad language(%@)",[AppData sharedInstance].language.name];
    }else {
        self.title = @"SDK language(English)";
    }
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [[SDKManager sharedInstance] setKeyboardForUserInputView:self.txtView];
    
}

- (IBAction)dissmissKeyboard:(id)sender  {
    [self.txtView resignFirstResponder];
    
}


@end
