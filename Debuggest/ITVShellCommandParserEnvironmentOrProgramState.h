//
//  ITVShellCommandParserEnvironmentOrProgramState.h
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVShellCommandParserStateBase.h"

@interface ITVShellCommandParserEnvironmentOrProgramState : ITVShellCommandParserStateBase

- (ITVShellCommandParserStateBase*)nextStateForToken:(ITVShellCommandToken*)token context:(ITVShellCommandParserStateContext*)context;
+ (ITVShellCommandParserEnvironmentOrProgramState*)sharedState;

@end
