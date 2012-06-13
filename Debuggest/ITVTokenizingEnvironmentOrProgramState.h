//
//  ITVTokenizingEnvironmentOrProgramState.h
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITVShellCommandTokenizerStateContext.h"
#import "ITVShellCommnadTokenizerState.h"

@interface ITVTokenizingEnvironmentOrProgramState : NSObject <ITVShellCommnadTokenizerState>

- (id<ITVShellCommnadTokenizerState>)nextStateForChar:(char)c context:(ITVShellCommandTokenizerStateContext*)context;

@end
