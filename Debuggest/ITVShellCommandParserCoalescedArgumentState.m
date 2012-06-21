//
//  ITVShellCommandParserCoalescedArgumentState.m
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandParserCoalescedArgumentState.h"
#import "ITVShellCommandParserErrorState.h"
#import "ITVShellCommandParserArgumentsState.h"

@implementation ITVShellCommandParserCoalescedArgumentState

- (ITVShellCommandParserStateBase*)nextStateForToken:(ITVShellCommandToken*)token context:(ITVShellCommandParserStateContext*)context
{
    if (token.type == ITVWhitespaceToken)  {
        [context.arguments addObject:context.stashedToken.token];
        
        context.stashedToken = nil;
        return [ITVShellCommandParserArgumentsState sharedState];
    }
    if (token.type == ITVStringToken || token.type == ITVEqualsToken)  {
        context.stashedToken = [ITVShellCommandToken tokenWithTokenString:[NSString stringWithFormat:@"%@=", context.stashedToken.token] type:ITVStringToken];
        
        return self;
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
