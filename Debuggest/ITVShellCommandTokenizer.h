//
//  ITVShellCommandTokenizer.h
//  Debuggest
//
//  Created by Admin on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITVShellCommandToken.h"

@interface ITVShellCommandTokenizer : NSObject

- (NSArray*)tokenizeString:(NSString*)string;

@end
