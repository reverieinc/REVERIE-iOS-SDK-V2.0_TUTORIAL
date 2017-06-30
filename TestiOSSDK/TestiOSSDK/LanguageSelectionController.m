//
//  LanguageSelectionController.m
//  TestiOSSDK
//
//  Created by RANVIJAI on 29/06/17.
//  Copyright © 2017 REVERIE LANGUAGE TECHNOLOGIES. All rights reserved.
//

#import "LanguageSelectionController.h"
#import "LanguageTableViewCell.h"
#import "LanguageSDK.h"
#import "AppData.h"
#import "SDKManager.h"

@interface LanguageSelectionController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *languages;
@property (nonatomic, strong) NSIndexPath *selectedIndex;
@end

@implementation LanguageSelectionController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Set language";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.languages.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LanguageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseLanguage"];
    cell.langLabel.text = [(LanguageSDK*)[self.languages objectAtIndex:indexPath.row] name];
    LanguageSDK *lang = [AppData sharedInstance].language;
    if (lang && lang.type == [(LanguageSDK*)[self.languages objectAtIndex:indexPath.row] type]) {
        self.selectedIndex = indexPath;
        cell.backgroundColor = [UIColor colorWithRed:34/255.0f green:147/255.0f blue:118/255.0f alpha:1];
        cell.langLabel.textColor = [UIColor whiteColor];
    }else {
        cell.backgroundColor = [UIColor whiteColor];
        cell.langLabel.textColor = [UIColor blackColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LanguageSDK *lang = (LanguageSDK*)[self.languages objectAtIndex:indexPath.row];
    lang.selected = true;
    [AppData sharedInstance].language = [lang clone];
    [[SDKManager sharedInstance] setLanguage:lang.type];
    if (self.selectedIndex) {
        LanguageTableViewCell *cell = [tableView cellForRowAtIndexPath:self.selectedIndex];
        cell.backgroundColor = [UIColor whiteColor];
        cell.langLabel.textColor = [UIColor blackColor];
    }
    
    LanguageTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:34/255.0f green:147/255.0f blue:118/255.0f alpha:1];
    cell.langLabel.textColor = [UIColor whiteColor];
    
    self.selectedIndex = indexPath;
}



- (NSMutableArray*)languages {
    if (!_languages) {
        _languages = [[NSMutableArray alloc] init];
        
        LanguageSDK *lang1 = [[LanguageSDK alloc] init];
        lang1.name = @"Hindi";
        lang1.type = LangHindi;
        [_languages addObject:lang1];
        
        LanguageSDK *lang2 = [[LanguageSDK alloc] init];
        lang2.name = @"Gujarati";
        lang2.type = LangGujarati;
        [_languages addObject:lang2];
        
        LanguageSDK *lang3 = [[LanguageSDK alloc] init];
        lang3.name = @"Punjabi";
        lang3.type = LangPunjabi;
        [_languages addObject:lang3];
        
        LanguageSDK *lang4 = [[LanguageSDK alloc] init];
        lang4.name = @"Malayalam";
        lang4.type = LangMalayalam;
        [_languages addObject:lang4];
        
        LanguageSDK *lang5 = [[LanguageSDK alloc] init];
        lang5.name = @"Tamil";
        lang5.type = LangTamil;
        [_languages addObject:lang5];
        
        LanguageSDK *lang6 = [[LanguageSDK alloc] init];
        lang6.name = @"Kannada";
        lang6.type = LangKannada;
        [_languages addObject:lang6];
        
        LanguageSDK *lang7 = [[LanguageSDK alloc] init];
        lang7.name = @"Telugu";
        lang7.type = LangTelugu;
        [_languages addObject:lang7];
        
        LanguageSDK *lang8 = [[LanguageSDK alloc] init];
        lang8.name = @"Bengali";
        lang8.type = LangBengali;
        [_languages addObject:lang8];
        
        LanguageSDK *lang9 = [[LanguageSDK alloc] init];
        lang9.name = @"Odia";
        lang9.type = LangOdia;
        [_languages addObject:lang9];
        
        LanguageSDK *lang10 = [[LanguageSDK alloc] init];
        lang10.name = @"Assamese";
        lang10.type = LangAssamese;
        [_languages addObject:lang10];
        
        LanguageSDK *lang11 = [[LanguageSDK alloc] init];
        lang11.name = @"Marathi";
        lang11.type = LangMarathi;
        [_languages addObject:lang11];
    }
    return _languages;
}

- (IBAction)navigateToNextScreen:(id)sender {
    if ([AppData sharedInstance].language) {
        [self performSegueWithIdentifier:@"segueResource" sender:nil];
    }else {
        [self performSegueWithIdentifier:@"segueHome" sender:nil];
    }
}

@end
