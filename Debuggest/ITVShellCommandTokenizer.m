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
    __block ITVShellCommandTokenType bufType = -1;
    __block int buffi = 0;
    
    void(^commitBuffer)(ITVShellCommandTokenType) = ^(ITVShellCommandTokenType triggeredByTokenType){
        if (bufType == -1)  bufType = triggeredByTokenType;
        
        if (buffi > 0 && bufType != triggeredByTokenType)  {
            tokBuf[buffi] = '\0';
            [tokens addObject:[ITVShellCommandToken tokenWithTokenString:[NSString stringWithUTF8String:tokBuf] type:bufType]];
            
            buffi = 0;
            bufType = triggeredByTokenType;
        }        
    };
    
    for (int i = 0; str[i] != '\0'; ++i)  {
        switch (str[i])  {
            default:  {
                commitBuffer(ITVStringToken);
                
                tokBuf[buffi++] = str[i];
                break;
            }
            case ' ':
            case '\t':
            case '\n':  {
                commitBuffer(ITVWhitespaceToken);
                
                tokBuf[buffi++] = str[i];
                break;
            }
            case '=':  {
                commitBuffer(-1);
                
                [tokens addObject:[ITVShellCommandToken tokenWithTokenString:@"=" type:ITVEqualsToken]];
                break;
            }
            case '\'':  {
                commitBuffer(-1);
                
                [tokens addObject:[ITVShellCommandToken tokenWithTokenString:@"'" type:ITVSingleQuoteToken]];
                break;
            }
            case '"':  {
                commitBuffer(-1);
                
                [tokens addObject:[ITVShellCommandToken tokenWithTokenString:@"\"" type:ITVDoubleQuoteToken]];
                break;
            }
            case '~':  {
                commitBuffer(-1);
                
                [tokens addObject:[ITVShellCommandToken tokenWithTokenString:@"~" type:ITVTildeToken]];
                break;
            }
            case '\\':  {
                commitBuffer(-1);
                
                [tokens addObject:[ITVShellCommandToken tokenWithTokenString:[NSString stringWithFormat:@"%c", str[++i]] type:ITVEscapedCharacterToken]];
                break;
            }
        }
    }
    commitBuffer(-1);
    
    free(tokBuf);
    return tokens;
}

@end
