//
//  ITVShellCommandParserEnvironmentState.m
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandParserEnvironmentState.h"
#import "ITVShellCommandParserEnvironmentOrProgramState.h"
#import "ITVShellCommandParserErrorState.h"

@implementation ITVShellCommandParserEnvironmentState

- (ITVShellCommandParserStateBase*)nextStateForToken:(ITVShellCommandToken*)token context:(ITVShellCommandParserStateContext*)context
{
    if (token.type == ITVWhitespaceToken)  {
        return self;
    }
    if (token.type == ITVStringToken)  {
        [context.environment setObject:token.token forKey:context.stashedToken.token];
        
        context.stashedToken = nil;
        
        return [ITVShellCommandParserEnvironmentOrProgramState sharedState];
    }
    else  {
        NSError* error = [NSError errorWithDomain:@"ITVShellCommandParser"
                                             code:ITVInvalidTokenErrorCode
                                         userInfo:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"Unexpected token: %@", token.token] forKey:NSLocalizedDescriptionKey]];
        [context setError:error];
        return [ITVShellCommandParserErrorState sharedState];
    }
}

@end
