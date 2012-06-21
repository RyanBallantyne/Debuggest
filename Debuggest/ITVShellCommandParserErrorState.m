//
//  ITVShellCommandParserErrorState.m
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandParserErrorState.h"

@implementation ITVShellCommandParserErrorState

- (ITVShellCommandParserStateBase*)nextStateForToken:(ITVShellCommandToken*)token context:(ITVShellCommandParserStateContext*)context
{
    @throw [NSException exceptionWithName:@"ParserError" reason:@"An error was encountered during parsing the command string." userInfo:nil];
}

@end
