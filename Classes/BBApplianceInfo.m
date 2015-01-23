//
//  BBApplianceInfo.m
//  HelloWorld
//
//  Created by Brian Boyle on 04/01/2015.
//
//

#import "BBApplianceInfo.h"

@interface BBApplianceInfo ()

@end

@implementation BBApplianceInfo

- (NSDictionary *)info {
    return [[NSBundle bundleWithIdentifier:@"com.apple.frontrow.appliance.livetv"] infoDictionary];
}

- (NSString *)key {
    //return nil;
    return [[[NSBundle bundleWithIdentifier:@"com.apple.frontrow.appliance.livetv"] infoDictionary] objectForKey:(id)kCFBundleIdentifierKey];
}

- (NSString *)name;
{
    return [[[NSBundle bundleWithIdentifier:@"com.apple.frontrow.appliance.livetv"] infoDictionary] objectForKey:(id)kCFBundleNameKey];
}

- (float)preferredOrder;
{
    return 0.0;
}

- (id)localizedStringsFileName;
{
    // return @"NitoTVLocalizable";
    return nil;
}


@end
