//
//  ITVShellCommandTokenizerStateContext.h
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITVShellCommandTokenizerStateContext : NSObject

@property(nonatomic, assign) int index;
@property(nonatomic, assign) int tokBuffIndex;
@property(nonatomic, readonly) char* tokenBuffer;
@property(nonatomic, assign) BOOL inQuotes;
@property(nonatomic, assign) char openQuoteChar;
@property(nonatomic, retain) NSMutableArray* tokens;

@end
