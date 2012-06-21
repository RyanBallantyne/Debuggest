//
//  ITVShellCommnadParserState.h
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITVShellCommandParserStateContext.h"
#import "ITVShellCommandToken.h"

@protocol ITVShellCommandParserState <NSObject>

- (id<ITVShellCommandParserState>)nextStateForToken:(ITVShellCommandToken*)token context:(ITVShellCommandParserStateContext*)context;

@end
