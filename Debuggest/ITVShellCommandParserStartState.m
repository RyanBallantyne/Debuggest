//
//  ITVShellCommandParserStartState.m
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandParserStartState.h"
#import "ITVShellCommandToken.h"
#import "ITVShellCommandParserErrorState.h"
#import "ITVShellCommandParserEnvironmentOrProgramState.h"

@implementation ITVShellCommandParserStartState

- (ITVShellCommandParserStateBase*)nextStateForToken:(ITVShellCommandToken*)token context:(ITVShellCommandParserStateContext*)context
{
    if (token.type == ITVWhitespaceToken)  return self;
    if (token.type == ITVStringToken)  {
        context.stashedToken = token;
        
        return [ITVShellCommandParserEnvironmentOrProgramState sharedState];
    }
    else  {
        NSError* error = [NSError errorWithDomain:@"ITVShellCommandParser"
                                             code:ITVInvalidTokenErrorCode
                                         userInfo:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"Unexpected token at beginning of command string: %@", token.token] forKey:NSLocalizedDescriptionKey]];
        [context setError:error];
        return [ITVShellCommandParserErrorState sharedState];
    }
}

@end
