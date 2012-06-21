//
//  ITVShellCommandParserStateBase.m
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandParserStateBase.h"

static ITVShellCommandParserStateBase* sharedState = nil;

@implementation ITVShellCommandParserStateBase

// Abstract method; override in subclasses
- (ITVShellCommandParserStateBase*)nextStateForToken:(ITVShellCommandToken*)token context:(ITVShellCommandParserStateContext*)context
{
    return nil;
}

+ (ITVShellCommandParserStateBase*)sharedState
{
    if (!sharedState)  sharedState = [[ITVShellCommandParserStateBase alloc] init];
    
    return sharedState;
}

@end
