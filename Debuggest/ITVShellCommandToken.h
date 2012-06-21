//
//  ITVShellCommandToken.h
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum ITVShellCommandTokenType {
    ITVDoubleQuoteToken,
    ITVEqualsToken,
    ITVEscapedCharacterToken,
    ITVSingleQuoteToken,
    ITVStringToken,
    ITVTildeToken,
    ITVWhitespaceToken
} ITVShellCommandTokenType;

@interface ITVShellCommandToken : NSObject

@property(nonatomic, readonly) ITVShellCommandTokenType type;
@property(nonatomic, readonly) NSString* token;

- (id)initWithTokenString:(NSString*)tokStr type:(ITVShellCommandTokenType)tokType;
+ (ITVShellCommandToken*)tokenWithTokenString:(NSString*)tokStr type:(ITVShellCommandTokenType)tokType;

@end
