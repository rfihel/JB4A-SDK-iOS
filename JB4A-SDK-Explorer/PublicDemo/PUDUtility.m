/**
 * Copyright © 2015 Salesforce Marketing Cloud. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation and/or
 * other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its contributors
 * may be used to endorse or promote products derived from this software without
 * specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

//
//  PUDUtility.m
//  PublicDemo
//
//  Created by Matt Lathrop on 5/15/14.
//  Copyright © 2015 Salesforce Marketing Cloud. All rights reserved.
//

#import "PUDUtility.h"

// Libraries
#import "ETPush.h"

// Other
#import "PUDAppSettingConstants.h"

@interface PUDUtility()

@end

@implementation PUDUtility

#pragma mark - App Settings

+ (NSString *)configurationName {
    

    return kAppSettingAppstoreConfigName;

}


+ (NSString *)accessToken { //safe definitions exist
    return kAppSettingAppstoreAccessToken;
}

+ (NSString *)appID { //safe definitions exist
    return kAppSettingAppstoreAppId;
}

+ (NSString *)clientID { //safe definitions exist
    return kAppSettingAppstoreClientId;
}

+ (NSString *)clientSecret { //safe definitions exist
    return kAppSettingAppstoreClientSecret;
}

+ (NSString *)messageIdVanilla {
    return kAppSettingAppstoreOutboundMessageIdVanilla;
}

+ (NSString *)messageIdCloudPage {
    return kAppSettingAppstoreOutboundMessageIdCloudPage;
}

+ (NSString *)fuelAccessTokenRoute {
    return kAppSettingAppstoreAccessTokenUrl;
}

#pragma mark - public methods

+ (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)sdkVersion {
    return ETPushSDKVersionString;
}

+ (NSString *)configName {
    NSString *configName = [self configurationName];

    if (!configName) {
        return nil;
    }
    
    return configName;
}

+ (NSString *)safeAppID {
    NSString *appID = [self appID];

    if (!appID) {
        return nil;
    }
    
    if (appID.length < 15) {
        return appID;
    }
    
    NSRange range = {11, 14};
    return [appID stringByReplacingCharactersInRange:range withString:@"***********"];
}

+ (NSString *)safeAccessToken {
    NSString *accessToken = [self accessToken];

    if (!accessToken) {
        return nil;
    }
    
    if (accessToken.length < 12) {
        return accessToken;
    }
    
    NSRange range = {7, 11};
    return [accessToken stringByReplacingCharactersInRange:range withString:@"***********"];
}

+ (NSString *)safeClientID {
    NSString *clientID = [self clientID];
    if (!clientID) {
        return nil;
    }
    
    if (clientID.length < 12) {
        return clientID;
    }
    
    NSRange range = {7, 11};
    return [clientID stringByReplacingCharactersInRange:range withString:@"***********"];
}

+ (NSString *)safeClientSecret {
    NSString *clientSecret = [self clientSecret];

    NSRange range = {7, 11};
    return [clientSecret stringByReplacingCharactersInRange:range withString:@"***********"];
}

+ (NSString *)isPushEnabled {
    /**
     *  ET_NOTE: This demonstrates how to see if the current device has opted in to receive pushes. This method must return YES or the device will not receive push messages
     */
    BOOL isPushEnabled = [ETPush isPushEnabled];
    
    if (isPushEnabled) {
        return @"YES";
    }
    else {
        return @"NO";
    }
}

+ (NSString *)deviceToken {
    /**
     *  ET_NOTE: This demonstrates how to see if the current device has opted in to receive pushes
     */
    NSString *formattedDeviceToken = [[ETPush pushManager] deviceToken];
    return formattedDeviceToken;
}

+ (NSString *)deviceID {
    /**
     *  ET_NOTE: This demonstrates how to retrieve the current device id
     */
    return [ETPush safeDeviceIdentifier];
}

+ (NSString *)openDirectDelegateClassName {
    id openDirectDelegate = [[ETPush pushManager] openDirectDelegate];
    if (!openDirectDelegate) {
        return nil;
    }
    
    return NSStringFromClass([openDirectDelegate class]);
}

+ (NSString *)isLocationEnabled {
    /**
     *  ET_NOTE: This demonstrates how to see if location services are enabled
     */
    BOOL isLocationEnabled = [[ETLocationManager locationManager] locationEnabled];
    
    if (isLocationEnabled) {
        return @"YES";
    }
    else {
        return @"NO";
    }
}

+ (NSString *)buildNumber {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)bundleID {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)buildType {
    return @"APPSTORE";
}

+ (BOOL) isInternalBuild {
    return NO;
}

#pragma mark - private methods

+ (NSString *)attributeFirstName {
    NSString *firstName = [[[ETPush pushManager] allAttributes] objectForKey:kPUDAttributeFirstName];
    return firstName;
}

+ (NSString *)attributeLastName {
    NSString *lastName = [[[ETPush pushManager] allAttributes] objectForKey:kPUDAttributeLastName];
    return lastName;
}

+ (NSString *)activeActivityTags {
    NSString *tags = @"";
    
    NSSet *allTags = [[ETPush pushManager] allTags];
    
    if ([allTags containsObject:kPUDTagCampingGear.lowercaseString]) {
        tags = [tags stringByAppendingString:@"Camping Gear"];
    }
    
    if ([allTags containsObject:kPUDTagHikingSupplies.lowercaseString]) {
        if (tags.length > 0) {
            tags = [tags stringByAppendingString:@", "];
        }
        
        tags = [tags stringByAppendingString:@"Hiking Supplies"];
    }
    
    if ([allTags containsObject:kPUDTagBoatingGear.lowercaseString]) {
        if (tags.length > 0) {
            tags = [tags stringByAppendingString:@", "];
        }
        
        tags = [tags stringByAppendingString:@"Boating Gear"];
    }
    
    if ([allTags containsObject:kPUDTagFishingSupplies.lowercaseString]) {
        if (tags.length > 0) {
            tags = [tags stringByAppendingString:@", "];
        }
        
        tags = [tags stringByAppendingString:@"Fishing Supplies"];
    }
    
    if ([allTags containsObject:kPUDTagHuntingGear.lowercaseString]) {
        if (tags.length > 0) {
            tags = [tags stringByAppendingString:@", "];
        }
        
        tags = [tags stringByAppendingString:@"Hunting Gear"];
    }
    
    if ([tags isEqualToString:@""]) {
        tags = nil;
    }
    
    return tags;
}

+ (BOOL) isSendMessageAvailable {
    return YES;
}

@end
