//
//  ITVShellCommandParser.m
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandParser.h"
#import "ITVShellCommandTokenizer.h"

@implementation ITVShellCommandParser

- (void)parseAndRunCommandString:(NSString*)command
{
    NSArray* tokens = [[[ITVShellCommandTokenizer alloc] init] tokenizeString:command];
    NSLog(@"%@", tokens);
}

@end
