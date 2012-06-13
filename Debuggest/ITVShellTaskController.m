//
//  ITVShellTaskController.m
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellTaskController.h"

@interface ITVShellTaskController ()
@property(nonatomic, retain) NSTask* shellTask;
@end

@implementation ITVShellTaskController

@synthesize shellTask;

- (NSDictionary*)parseEnvironmentFromShellCommandString:(NSString*)command
{
    NSMutableDictionary* environment = [NSMutableDictionary dictionary];
}

@end
