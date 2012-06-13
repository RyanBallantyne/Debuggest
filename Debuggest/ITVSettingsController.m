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
@property(nonatomic, retain) NSString* shellCommand;

@end

@implementation ITVSettingsController
@synthesize shellCommandField;
@synthesize runStopButt;
@synthesize debuggerWindow;
@synthesize isRunning;

@synthesize runFilePath, shellCommand;


- (void)awakeFromNib
{    
    isRunning = NO;
    self.runFilePath = @"";
    self.shellCommand = @"coffee %%%RUNFILE%%%";
}


- (IBAction)chooseRunFile:(id)sender {
    NSOpenPanel* openPanel = [NSOpenPanel openPanel];
    [openPanel setExtensionHidden:NO];
    
    [openPanel beginSheetModalForWindow:debuggerWindow completionHandler:^void(NSInteger result){
        NSURL* selectedFilePath = [openPanel URL];
        self.runFilePath = [selectedFilePath path];
    }];
}

- (IBAction)runOrStop:(id)sender
{
    // I know they're bound, but we need to make sure that
    if (!runFilePath || !shellCommand || [runFilePath isEqualToString:@""] || [shellCommand isEqualToString:@""])  {
        NSAlert* alert = [[NSAlert alloc] init];
        [alert setMessageText:@"Please pick a file to run and enter a shell command so we know how to run it."];
        [alert setAlertStyle:NSCriticalAlertStyle];
        
//        [NSAlert alertWithMessageText: defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
        [alert beginSheetModalForWindow:debuggerWindow modalDelegate:self didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:) contextInfo:nil];
        
        return;
    }
    
    NSString* transformedShellCommand = [self transformedShellCommand];
    
    (isRunning) ? [runStopButt setTitle:@"Run"] : [runStopButt setTitle:@"Stop"];
    [self setIsRunning:!isRunning];
    
}

- (NSString*)transformedShellCommand
{
    return [shellCommand stringByReplacingOccurrencesOfString:@"%%%RUNFILE%%%" withString:runFilePath options:NSLiteralSearch range:NSMakeRange(0, [shellCommand length])];
}

- (void)alertDidEnd:(NSAlert*)alert returnCode:(NSInteger)returnCode contextInfo:(void*)contextInfo
{
    // Don't actually care
}

@end
