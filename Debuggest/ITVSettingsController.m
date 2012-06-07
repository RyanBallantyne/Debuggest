//
//  ITVSettingsController.m
//  Debuggest
//
//  Created by Admin on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVSettingsController.h"

@interface ITVSettingsController ()

@property(nonatomic, retain) NSString* runFilePath;
@property(nonatomic, retain) NSMutableDictionary* env;
@property(nonatomic, retain) NSString* shellCommand;

@end

@implementation ITVSettingsController
@synthesize runStopButt;
@synthesize debuggerWindow;
@synthesize isRunning;

@synthesize runFilePath, env, shellCommand;


- (void)awakeFromNib
{    
    isRunning = NO;
    runFilePath = @"";
    env = [NSMutableDictionary dictionary];
    shellCommand = @"";
}


- (IBAction)chooseRunFile:(id)sender {
    NSOpenPanel* openPanel = [NSOpenPanel openPanel];
    [openPanel setExtensionHidden:NO];
    [openPanel beginSheetModalForWindow:debuggerWindow completionHandler:^void(NSInteger result){
        NSURL* selectedFilePath = [openPanel URL];
        self.runFilePath = [selectedFilePath path];
    }];
}

- (IBAction)runOrStop:(id)sender {
    
    [self setIsRunning:!isRunning];
}

@end
