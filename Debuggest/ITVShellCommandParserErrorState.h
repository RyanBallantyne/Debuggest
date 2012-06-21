//
//  ITVShellCommandParserErrorState.h
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandParserStateBase.h"

@interface ITVShellCommandParserErrorState : ITVShellCommandParserStateBase

- (ITVShellCommandParserStateBase*)nextStateForToken:(ITVShellCommandToken*)token context:(ITVShellCommandParserStateContext*)context;
+ (ITVShellCommandParserErrorState*)sharedState;

@end
