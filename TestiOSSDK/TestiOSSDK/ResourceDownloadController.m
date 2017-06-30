//
//  ResourceDownloadController.m
//  TestiOSSDK
//
//  Created by RANVIJAI on 29/06/17.
//  Copyright © 2017 REVERIE LANGUAGE TECHNOLOGIES. All rights reserved.
//

#import "ResourceDownloadController.h"
#import "LanguageSDK.h"
#import "SDKManager.h"
#import "SDKResponse.h"
#import "SDKEnum.h"
#import "ResourceInput.h"
#import "AppData.h"
#import "SDKManager.h"

@interface ResourceDownloadController ()
@property (weak, nonatomic) IBOutlet UIButton *navigationBtn;
@end

@implementation ResourceDownloadController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [NSString stringWithFormat:@"Resource for %@", [AppData sharedInstance].language.name];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
}

- (void)viewWillAppear:(BOOL)animated {
    if ([[SDKManager sharedInstance] isResourcesAvailableForLanguage:[AppData sharedInstance].language.type]) {
        self.navigationBtn.userInteractionEnabled = true;
        self.navigationBtn.alpha = 1;
    }else {
        self.navigationBtn.userInteractionEnabled = false;
        self.navigationBtn.alpha = 0.5;
    }
}

- (IBAction)downloadResource:(id)sender {
    ResourceInput *input = [[ResourceInput alloc] init];
    input.lang = [AppData sharedInstance].language.type;
    input.apiKey = @"xxxxxxxxxx";
    input.appId = @"xxxxxxxxx";
    
    [[SDKManager sharedInstance] downloadResources:input baseURL:@"https://api-gw.revup.reverieinc.com/apiman-gateway/ReverieMobilitySdk" completion:^(SDKResponse *res) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (res.status == 200) {
                self.navigationBtn.userInteractionEnabled = true;
                self.navigationBtn.alpha = 1;
                 [[SDKManager sharedInstance] setLanguage:[AppData sharedInstance].language.type];
            }
            UIAlertController *ctlr = [UIAlertController alertControllerWithTitle:@"Response" message:[NSString stringWithFormat:@"Resource download = %@, \nStatus code = %ld", res.message, (long)res.status] preferredStyle:UIAlertControllerStyleAlert];
            [ctlr addAction:[UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:nil]];
            [self presentViewController:ctlr animated:YES completion:nil];
        });
    }];
}

- (IBAction)checkResourceAvailability:(id)sender {
    NSString *msg = @"Resource not available";
    if ([[SDKManager sharedInstance] isResourcesAvailableForLanguage:[AppData sharedInstance].language.type]) {
        msg = @"Resource exist";
    }
    UIAlertController *ctlr = [UIAlertController alertControllerWithTitle:@"Response" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [ctlr addAction:[UIAlertAction
                     actionWithTitle:@"OK"
                     style:UIAlertActionStyleDefault
                     handler:nil]];
    [self presentViewController:ctlr animated:YES completion:nil];
}

- (IBAction)getAllSupportedLanguages:(id)sender {
    UIAlertController *ctlr = [UIAlertController alertControllerWithTitle:@"Response" message:[NSString stringWithFormat:@"Supported languages = %@",[[SDKManager sharedInstance] supportedLanguages]] preferredStyle:UIAlertControllerStyleAlert];
    [ctlr addAction:[UIAlertAction
                     actionWithTitle:@"OK"
                     style:UIAlertActionStyleDefault
                     handler:nil]];
    [self presentViewController:ctlr animated:YES completion:nil];
}

@end
