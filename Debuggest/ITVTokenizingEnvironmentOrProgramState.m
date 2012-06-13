//
//  ITVTokenizingEnvironmentOrProgramState.m
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVTokenizingEnvironmentOrProgramState.h"

@implementation ITVTokenizingEnvironmentOrProgramState

- (id<ITVShellCommnadTokenizerState>)nextStateForChar:(char)c context:(ITVShellCommandTokenizerStateContext*)context
{
    switch (c) {
        case '\\':
            <#statements#>
            break;
            
        default:
            break;
    }
}

@end
