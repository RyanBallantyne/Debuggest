//
//  ITVShellCommnadTokenizerState.h
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITVShellCommandTokenizerStateContext.h"

@protocol ITVShellCommnadTokenizerState <NSObject>

- (id<ITVShellCommnadTokenizerState>)nextStateForChar:(char)c context:(ITVShellCommandTokenizerStateContext*)context;

@end
