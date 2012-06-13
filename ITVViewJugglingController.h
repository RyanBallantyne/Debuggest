//
//  ITVViewJugglingController.h
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITVViewJugglingController : NSObject
@property (weak) IBOutlet NSToolbarItem *settingsTab;
@property (weak) IBOutlet NSToolbarItem *debuggerTab;
@property (weak) IBOutlet NSTabView *tabView;

- (IBAction)switchView:(NSToolbarItem *)sender;

@end
