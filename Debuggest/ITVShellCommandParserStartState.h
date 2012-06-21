//
//  ITVShellCommandParserStartState.h
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITVShellCommandParserState.h"
#import "ITVShellCommandParserStateBase.h"

@interface ITVShellCommandParserStartState : ITVShellCommandParserStateBase

- (ITVShellCommandParserStateBase*)nextStateForToken:(ITVShellCommandToken*)token context:(ITVShellCommandParserStateContext*)context;

@end
