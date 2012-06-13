//
//  ITVShellCommandParser.m
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandParser.h"

@implementation ITVShellCommandParser

- (NSArray*)tokenizeString:(NSString*)string
{
    const char* str = [string UTF8String];
    NSMutableArray* tokens = [NSMutableArray array];
    // By allocating a buffer big enough to hold the entire string, we know we will never overrun it
    char* tokBuf = malloc(([string length] + 1) * sizeof(char));
    
    BOOL inQuotes = NO;
    char openQuoteChar = '\0';
    
    for (int i = 0; str[i] != '\0'; ++i)  {
        switch (str[i]) {
            case ' ':
                if (!inQuotes)  {
                    
                }
                break;
            case '"':
            case '\'':
                if (!inQuotes)  {
                    openQuoteChar = str[i];
                }
                inQuotes = !inQuotes;
                break;
            case '=':
                
                break;
                
            default:
                break;
        }
    }
    
    free(tokBuf);
    return tokens;
}

@end
