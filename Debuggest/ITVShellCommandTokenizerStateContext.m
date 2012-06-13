//
//  ITVShellCommandTokenizerStateContext.m
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandTokenizerStateContext.h"

@implementation ITVShellCommandTokenizerStateContext

@synthesize index, tokBuffIndex, tokenBuffer, inQuotes, openQuoteChar;
@synthesize tokens;

- (id)initWithTokenBufferSize:(int)tokBuffSize
{
    if (self = [super init])  {
        index = 0;
        tokBuffIndex = 0;
        inQuotes = NO;
        openQuoteChar = '\0';
        
        tokenBuffer = malloc((tokBuffSize + 1) * sizeof(char));
        tokens = [NSMutableArray array];
    }
    
    return self;
}

+ (ITVShellCommandTokenizerStateContext*)contextWithTokenBufferSize:(int)tokBuffSize
{
    return [[ITVShellCommandTokenizerStateContext alloc] initWithTokenBufferSize:tokBuffSize];
}

- (void)dealloc
{
    free(tokenBuffer);
}


- (void)appendCharToBuffer:(char)c
{
    if (c == '"' || c == '\'')  {
        if (!inQuotes)  {
            inQuotes = YES;
            openQuoteChar = c;
        }
        else if (c == openQuoteChar)  {
            inQuotes = NO;
            openQuoteChar = '\0';
        }
        
        // Yes, this conditional IS different than the above.
        if (c == openQuoteChar)  {
            return;
        }
    }
    
    tokenBuffer[tokBuffIndex++] = c;
}

- (void)ingestCurrentToken
{
    tokenBuffer[tokBuffIndex] = '\0';
    [tokens addObject:[NSString stringWithUTF8String:tokenBuffer]];
    tokBuffIndex = 0;
}

@end
