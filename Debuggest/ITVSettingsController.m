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

@synthesize runFilePath, env, shellCommand;



- (IBAction)chooseRunFile:(id)sender {
}

- (IBAction)runOrStop:(id)sender {
}
@end
