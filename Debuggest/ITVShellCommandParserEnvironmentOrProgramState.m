//
//  ITVShellCommandParserEnvironmentOrProgramState.m
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandParserEnvironmentOrProgramState.h"
#import "ITVShellCommandParserErrorState.h"
#import "ITVShellCommandParserArgumentsState.h"
#import "ITVShellCommandParserEnvironmentState.h"

static ITVShellCommandParserEnvironmentOrProgramState* sharedState = nil;

@implementation ITVShellCommandParserEnvironmentOrProgramState

- (ITVShellCommandParserStateBase*)nextStateForToken:(ITVShellCommandToken*)token context:(ITVShellCommandParserStateContext*)context
{
    if (token.type == ITVWhitespaceToken)  {
        return self;
    }
    if (token.type == ITVStringToken)  {
        if (context.stashedToken == nil)  {
            context.stashedToken = token;

            return self;
        }
        
        context.launchPath = context.stashedToken.token;
        context.stashedToken = token;
        
        return [ITVShellCommandParserArgumentsState sharedState];
    }
    if (token.type == ITVEqualsToken)  {
        // TODO: If an = comes after the program name in the argument list, this will erroneously error out
        if (context.stashedToken == nil)  {
            NSError* error = [NSError errorWithDomain:@"ITVShellCommandParser"
                                                 code:ITVInvalidTokenErrorCode
                                             userInfo:[NSDictionary dictionaryWithObject:@"Unexpected =" forKey:NSLocalizedDescriptionKey]];
            [context setError:error];
            return [ITVShellCommandParserErrorState sharedState];
        }
        return [ITVShellCommandParserEnvironmentState sharedState];
    }
    else  {
        NSError* error = [NSError errorWithDomain:@"ITVShellCommandParser"
                                             code:ITVInvalidTokenErrorCode
                                         userInfo:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"Unexpected token: %@", token.token] forKey:NSLocalizedDescriptionKey]];
        [context setError:error];
        return [ITVShellCommandParserErrorState sharedState];
    }
}

+ (ITVShellCommandParserEnvironmentOrProgramState*)sharedState
{
    if (!sharedState)  sharedState = [[ITVShellCommandParserEnvironmentOrProgramState alloc] init];
    
    return sharedState;
}

@end
