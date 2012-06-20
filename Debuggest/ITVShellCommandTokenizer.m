//
//  ITVShellCommandTokenizer.m
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandTokenizer.h"

@implementation ITVShellCommandTokenizer

- (NSArray*)tokenizeString:(NSString*)string
{
    NSMutableArray* tokens = [NSMutableArray array];
    const char* str = [string UTF8String];
    // By allocating a buffer big enough to hold the entire string, we know we will never overrun it
    char* tokBuf = malloc(([string length] + 1) * sizeof(char));
    int buffi = 0;
    
    for (int i = 0; str[i] != '\0'; ++i)  {
        switch (str[i])  {
            default:  {
                
                break;
            }
            case ' ':
            case '\t':
            case '\n':  {
                
                break;
            }
            case '=':  {
                [tokens addObject:[[ITVShellCommandToken alloc] initWithTokenString:@"=" type:ITVEqualsToken]];
                break;
            }
            case '\'':  {
                [tokens addObject:[[ITVShellCommandToken alloc] initWithTokenString:@"'" type:ITVSingleQuoteToken]];
                break;
            }
            case '"':  {
                [tokens addObject:[[ITVShellCommandToken alloc] initWithTokenString:@"\"" type:ITVDoubleQuoteToken]];
                break;
            }
            case '~':  {
                [tokens addObject:[[ITVShellCommandToken alloc] initWithTokenString:@"~" type:ITVTildeToken]];
                break;
            }
            case '\\':  {
                [tokens addObject:[[ITVShellCommandToken alloc] initWithTokenString:[NSString stringWithFormat:@"%c", str[++i]] type:ITVEscapedCharacterToken]];
                break;
            }
        }
    }
    
    free(tokBuf);
    return tokens;
}

@end
