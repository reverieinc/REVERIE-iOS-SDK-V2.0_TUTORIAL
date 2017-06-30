//
//  RegistrationController.m
//  TestiOSSDK
//
//  Created by RANVIJAI on 29/06/17.
//  Copyright © 2017 REVERIE LANGUAGE TECHNOLOGIES. All rights reserved.
//

#import "RegistrationController.h"
#import "LicenseValidationInput.h"
#import "SDKManager.h"
#import "SDKResponse.h"
#import "SDKEnum.h"

@interface RegistrationController ()
@property (weak, nonatomic) IBOutlet UIButton *navigationBtn;
@end

@implementation RegistrationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Registration";
    self.navigationBtn.userInteractionEnabled = false;
    self.navigationBtn.alpha = 0.5;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerSDKAction:(id)sender {
    LicenseValidationInput *input = [[LicenseValidationInput alloc] init];
    input.apiKey = @"xxxxxxxxxx";
    input.appId = @"xxxxxxxxxx";
    [[SDKManager sharedInstance] validateSDK:input baseURL:@"https://api-gw.revup.reverieinc.com/apiman-gateway/ReverieMobilitySdk" completion:^(SDKResponse *res) {
        dispatch_async(dispatch_get_main_queue(), ^{
        
            if (res.status == 200) {
                self.navigationBtn.userInteractionEnabled = true;
                self.navigationBtn.alpha = 1;
            }
            UIAlertController *ctlr = [UIAlertController alertControllerWithTitle:@"Response" message:[NSString stringWithFormat:@"SDK registration = %@, \nStatus code = %ld", res.message, (long)res.status] preferredStyle:UIAlertControllerStyleAlert];

            [ctlr addAction:[UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:nil]];
            
                [self presentViewController:ctlr animated:YES completion:nil];
        });
    }];
}

@end
