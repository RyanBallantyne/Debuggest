//
//  ITVShellCommandToken.m
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandToken.h"

@implementation ITVShellCommandToken

@synthesize token, type;

- (id)initWithTokenString:(NSString*)tokStr type:(ITVShellCommandTokenType)tokType
{
    if (self = [super init])  {
        token = tokStr;
        type = tokType;
    }
    
    return self;
}

+ (ITVShellCommandToken*)tokenWithTokenString:(NSString*)tokStr type:(ITVShellCommandTokenType)tokType
{
    return [[ITVShellCommandToken alloc] initWithTokenString:tokStr type:tokType];
}

- (NSString*)description
{
    NSString* typeStr;
    switch (type) {
        case ITVDoubleQuoteToken:
            typeStr = @"ITVDoubleQuoteToken";
            break;
        case ITVEqualsToken:
            typeStr = @"ITVEqualsToken";
            break;
        case ITVEscapedCharacterToken:
            typeStr = @"ITVEscapedCharacterToken";
            break;
        case ITVSingleQuoteToken:
            typeStr = @"ITVSingleQuoteToken";
            break;
        case ITVStringToken:
            typeStr = @"ITVStringToken";
            break;
        case ITVTildeToken:
            typeStr = @"ITVTildeToken";
            break;
        case ITVWhitespaceToken:
            typeStr = @"ITVWhitespaceToken";
            break;
            
        default:
            typeStr = [NSString stringWithFormat:@"%d", type];
            break;
    }
    
    return [NSString stringWithFormat:@"%@(%@)", typeStr, token];
}

@end
