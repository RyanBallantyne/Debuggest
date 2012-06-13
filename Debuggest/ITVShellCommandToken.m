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

- (id)initWithTokenString:(NSString*)tokStr type:(ITVShellCommnadTokenType)tokType
{
    if (self = [super init])  {
        token = tokStr;
        type = tokType;
    }
    
    return self;
}

+ (ITVShellCommandToken*)tokenWithTokenString:(NSString*)tokStr type:(ITVShellCommnadTokenType)tokType
{
    return [[ITVShellCommandToken alloc] initWithTokenString:tokStr type:tokType];
}

@end
