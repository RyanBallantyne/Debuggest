//
//  ITVShellCommandParserStateContext.m
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandParserStateContext.h"

@implementation ITVShellCommandParserStateContext

@synthesize error, stashedToken;
@synthesize environment, launchPath, arguments;

- (id)init
{
    if (self = [super init])  {
        error = nil;
        stashedToken = nil;
        
        environment = [NSMutableDictionary dictionary];
        launchPath = nil;
        arguments = [NSMutableArray array];
    }
    
    return self;
}

+ (ITVShellCommandParserStateContext*)context
{
    return [[ITVShellCommandParserStateContext alloc] init];
}

@end
