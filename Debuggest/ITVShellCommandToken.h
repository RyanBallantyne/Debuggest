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
} ITVShellCommnadTokenType;

@interface ITVShellCommandToken : NSObject

@property(nonatomic, readonly) ITVShellCommnadTokenType type;
@property(nonatomic, readonly) NSString* token;

- (id)initWithTokenString:(NSString*)tokStr type:(ITVShellCommnadTokenType)tokType;
+ (ITVShellCommandToken*)tokenWithTokenString:(NSString*)tokStr type:(ITVShellCommnadTokenType)tokType;

@end
