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
    tokens = [self coalesceTokens:tokens];
    
    for (ITVShellCommandToken* token in tokens)  {
        
    }
}

// We can simplify our parsing if we combine sequences of tokens that we want to treat as one single string token
- (NSArray*)coalesceTokens:(NSArray*)tokens
{
    NSMutableArray* coalescedTokens = [NSMutableArray arrayWithCapacity:[tokens count]];
    NSMutableArray* tokensToCoalesce = [NSMutableArray arrayWithCapacity:10];
    BOOL inQuotes = NO;
    enum ITVShellCommandTokenType openQuoteType = -1;
    
    ITVShellCommandToken*(^coalesce)(NSArray*) = ^(NSArray* toCoalesce) {
        NSMutableString* tokStr = [NSMutableString string];
        
        for (ITVShellCommandToken* tok in toCoalesce)  {
            [tokStr appendString:tok.token];
        }
        
        return [ITVShellCommandToken tokenWithTokenString:tokStr type:ITVStringToken];
    };
    
    // Run through the array of tokens, adding things that might need coalescing to the tokensToCoalesce array.
    // When we encounter something that should not be coalesced, we coalesce the tokensToCoalesce array.
    // Everything inside quotes should be coalesced, and if the quoted sequence is adjacent to escape sequences or other strings, they should also be coalesced.
    // Strings and escape sequences should be coalesced.
    // Tildes should be replaced with the user's home directory, and coalesced into adjacent strings/escape sequences/quoted sequences
    // Every other thing will trigger coalescense and empty out the toCoalesce array.
    for (ITVShellCommandToken* tok in tokens)  {
        switch (tok.type) {
            case ITVSingleQuoteToken:
            case ITVDoubleQuoteToken:  {
                if (!inQuotes)  {
                    inQuotes = YES;
                    openQuoteType = tok.type;
                }
                else if (tok.type != openQuoteType)  {
                    [tokensToCoalesce addObject:tok];
                }
                else  {
                    inQuotes = NO;
                }
                break;
            }
            case ITVStringToken:
            case ITVEscapedCharacterToken:  {
                [tokensToCoalesce addObject:tok];
                break;
            }
            case ITVTildeToken:  {
                [tokensToCoalesce addObject:[ITVShellCommandToken tokenWithTokenString:NSHomeDirectory() type:ITVStringToken]];
                break;
            }
                
            default:
                if (inQuotes)  {
                    [tokensToCoalesce addObject:tok];
                    continue;
                }
                
                if ([tokensToCoalesce count] > 0)  {
                    [coalescedTokens addObject:coalesce(tokensToCoalesce)];
                    [tokensToCoalesce removeAllObjects];
                }                
                [coalescedTokens addObject:tok];
                break;
        }
    }
    if ([tokensToCoalesce count] > 0)  [coalescedTokens addObject:coalesce(tokensToCoalesce)];
    
    return coalescedTokens;
}

@end
