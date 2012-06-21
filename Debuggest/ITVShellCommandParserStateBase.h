//
//  ITVShellCommandParserStateBase.h
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITVShellCommandToken.h"
#import "ITVShellCommandParserStateContext.h"

@interface ITVShellCommandParserStateBase : NSObject

// Abstract method; override in subclasses
- (ITVShellCommandParserStateBase*)nextStateForToken:(ITVShellCommandToken*)token context:(ITVShellCommandParserStateContext*)context;

+ (ITVShellCommandParserStateBase*)sharedState;

@end
