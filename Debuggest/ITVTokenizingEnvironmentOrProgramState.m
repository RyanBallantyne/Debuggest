//
//  ITVTokenizingEnvironmentOrProgramState.m
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVTokenizingEnvironmentOrProgramState.h"
#import "TVTokenizingEnvironmentState.h"

@implementation ITVTokenizingEnvironmentOrProgramState

- (id<ITVShellCommnadTokenizerState>)nextStateForChar:(char)c context:(ITVShellCommandTokenizerStateContext*)context
{
    switch (c) {
        case '=':
            [context appendCharToBuffer:c];
            return [[ITVTokenizingEnvironmentState alloc] init];
            
        default:
            break;
    }
}

@end
