//
//  BBAppliance.m
//  HelloWorld
//
//  Created by Brian Boyle on 04/01/2015.
//
//

#import "BBAppliance.h"
#import "BBChannelsMenu.h"
#import "BBApplianceInfo.h"

@interface BBAppliance ()
@property (nonatomic, strong) NSMutableArray *applianceCategories;
@end

@implementation BBAppliance

- (id)init {
    if((self = [super init]) != nil) {
		//_topShelfController = [[TopShelfController alloc] init];
		
		self.applianceCategories = [[NSMutableArray alloc] init];
        [self.applianceCategories addObject:[BRApplianceCategory categoryWithName:@"LiveTV"
                                                              identifier:@"LiveTVId"
                                                          preferredOrder:0]];
	}

    return self;
}
- (id)applianceInfo {
    //return [BRApplianceInfo infoForApplianceBundle:[NSBundle bundleForClass:[self class]]];
    return [[BBApplianceInfo alloc] init];
}


- (id)controllerForIdentifier:(id)identifier args:(id)args {
	id menuController = nil;
	
	if ([identifier isEqualToString:@"LiveTVId"]) {
        NSLog(@"A");
        NSLog(@"Appliance INFO : %@", self.applianceInfo);
        NSLog(@"B");
		BBChannelsMenu *channelsMenu = [[BBChannelsMenu alloc] init];
        return channelsMenu;
        [[[BRApplicationStackManager singleton] stack] pushController:channelsMenu];
	}
	return menuController;
}

- (id)localizedSearchTitle {
    return @"Brian";
}

- (id)applianceName {
    return @"Brian";
}

- (id)moduleName {
    return @"Brian";
}

- (id)applianceKey {
    return @"Brian";
}

@end
