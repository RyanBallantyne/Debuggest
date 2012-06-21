//
//  ITVShellCommandParserArgumentsState.m
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandParserArgumentsState.h"
#import "ITVShellCommandParserErrorState.h"
#import "ITVShellCommandParserCoalescedArgumentState.h"

static ITVShellCommandParserArgumentsState* sharedState = nil;

@implementation ITVShellCommandParserArgumentsState

- (ITVShellCommandParserStateBase*)nextStateForToken:(ITVShellCommandToken*)token context:(ITVShellCommandParserStateContext*)context
{
    if (token.type == ITVWhitespaceToken)  {
        [context.arguments addObject:context.stashedToken.token];
        context.stashedToken = nil;
        
        return self;
    }
    if (token.type == ITVStringToken)  {
        if (context.stashedToken == nil)  {
            context.stashedToken = token;
            
            return self;
        }
        
        [context.arguments addObject:context.stashedToken.token];
        
        context.stashedToken = token;
        return self;
    }
    if (token.type == ITVEqualsToken)  {
        if (context.stashedToken == nil)  context.stashedToken = [ITVShellCommandToken tokenWithTokenString:@"" type:ITVStringToken];
        
        context.stashedToken = [ITVShellCommandToken tokenWithTokenString:[NSString stringWithFormat:@"%@=", context.stashedToken.token] type:ITVStringToken];
        return [ITVShellCommandParserCoalescedArgumentState sharedState];
    }
    else  {
        NSError* error = [NSError errorWithDomain:@"ITVShellCommandParser"
                                             code:ITVInvalidTokenErrorCode
                                         userInfo:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"Unexpected token: %@", token.token] forKey:NSLocalizedDescriptionKey]];
        [context setError:error];
        return [ITVShellCommandParserErrorState sharedState];
    }
}

+ (ITVShellCommandParserArgumentsState*)sharedState
{
    if (!sharedState)  sharedState = [[ITVShellCommandParserArgumentsState alloc] init];
    
    return sharedState;
}

@end
