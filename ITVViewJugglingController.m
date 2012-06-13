//
//  ITVViewJugglingController.m
//  Debuggest
//
//  Created by Admin on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVViewJugglingController.h"

@implementation ITVViewJugglingController
@synthesize settingsTab;
@synthesize debuggerTab;
@synthesize tabView;

- (void)awakeFromNib
{
    [tabView selectTabViewItemAtIndex:0];
}

- (IBAction)switchView:(NSToolbarItem *)sender {
    [tabView selectTabViewItemAtIndex:[sender tag]];
}
@end
