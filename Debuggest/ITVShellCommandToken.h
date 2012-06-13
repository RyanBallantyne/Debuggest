//
//  ITVShellCommandToken.h
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum ITVShellCommandTokenType {
    ITVEnvironmentVariable,
    ITVProgramName,
    ITVArgument,
    ITVHomeDirectoryCharacter
} ITVShellCommnadTokenType;

@interface ITVShellCommandToken : NSObject

@property(nonatomic, readonly) ITVShellCommnadTokenType type;
@property(nonatomic, readonly) NSString* token;

@end
