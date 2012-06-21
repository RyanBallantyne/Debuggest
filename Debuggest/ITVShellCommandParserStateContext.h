//
//  ITVShellCommandParserStateContext.h
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITVShellCommandToken.h"

typedef enum ITVShellCommandParserErrorCode  {
    ITVInvalidTokenErrorCode
} ITVShellCommandParserErrorCode;

@interface ITVShellCommandParserStateContext : NSObject

@property(nonatomic, retain) NSError* error;
@property(nonatomic, retain) ITVShellCommandToken* stashedToken;

@property(nonatomic, retain) NSMutableDictionary* environment;
@property(nonatomic, retain) NSMutableArray* arguments;
@property(nonatomic, retain) NSString* launchPath;

- (id)init;
+ (ITVShellCommandParserStateContext*)context;

@end
