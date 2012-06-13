//
//  ITVSettingsController.h
//  Debuggest
//
//  Created by Admin on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITVSettingsController : NSObject

@property (weak) IBOutlet NSTextField *shellCommandField;
@property (weak) IBOutlet NSButton *runStopButt;
@property (unsafe_unretained) IBOutlet NSWindow *debuggerWindow;

@property(nonatomic, assign) BOOL isRunning;

- (IBAction)chooseRunFile:(id)sender;
- (IBAction)runOrStop:(id)sender;

@end
