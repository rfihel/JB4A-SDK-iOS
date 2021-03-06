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
//  PUDHomeTableViewController.m
//  PublicDemo
//
//  Created by Matt Lathrop on 5/29/14.
//  Copyright © 2015 Salesforce Marketing Cloud. All rights reserved.
//

#import "PUDHomeViewController.h"

// Controllers
#import "PUDPageContentViewController.h"

@interface PUDHomeViewController ()

@end

@implementation PUDHomeViewController

- (NSString *)htmlPrefix {
    return @"<html style=\"margin:10px; font-size:16px; word-wrap: break-word;\"><font color=\"black\" face=\"Avenir Next\">"
    "<h3 style=\"text-align:center;\">Journey Builder for Apps (JB4A) IOS SDK</h3>";
}

- (NSArray *)pageHtml {
    return @[[self overviewHtml], [self purposeHtml], [self codeAtHtml], [self usingThisAppHtml]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageViewController.view.alpha = 0;
    
    /*
    CGFloat scale = [[UIScreen mainScreen]scale];
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, scale);
    [[UIImage imageNamed:@"test"] drawInRect:CGRectMake(0,0,320,900)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:newImage];
    */
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.pageViewController.view setAlpha:1.0];
    } completion:nil];
}

#pragma mark - page content

- (NSString *)overviewHtml {
    
    NSString *ret = @"<b>Overview</b><hr>"
                     "This is an app where you can practice using the JB4A SDK."
                     "<br/><br/>"
                     "The JB4A SDK is a key component of "
                     "<a href=\"http://www.exacttarget.com/products/mobile-marketing\">Mobile Marketing</a> for your company.<br/>";
    
    return ret;
}

- (NSString *)purposeHtml {
    
    NSString *ret = @"<b>Purpose</b><hr>"
                     "<ul>"
                     "<li>Provides a UI for demonstrating with various features of the JB4A SDK.</li><br/>"
                     "<li>Provides an example and template for creating an iOS app that uses the JB4A SDK.</li><br/>"
                     "<li>Allows you to review the SDK components by collecting debugging information and sharing via email.</li><br/>"
                     "</ul>";
    
    return ret;
}

- (NSString *)codeAtHtml {
    
    NSString *ret = @"<b>Additional Resources</b><hr>"
                    "The following resources are available to learn more about using the JB4A SDK.  They are not required to run this app, but are availble to assist you in developing an app using the JB4A SDK."
                     "<br/><br/>"
                     "<b>Code@</b><hr>"
                     "For more information about the JB4A SDK, see "
                     "<a href=\"https://code.exacttarget.com/api/mobilepush-sdks\">Code@</a><br/>"
                     "<br/>"
                     "<b>GitHub</b><hr>"
                     "To view the code for this app, please see the GitHub repository for the JB4A SDK found "
                     "<a href=\"https://github.com/ExactTarget/MobilePushSDK-iOS\">here</a>"
                     " and then open the practicefield folder.<br/>";
    
    return ret;
}

- (NSString *)usingThisAppHtml {
    
    NSString *ret = @"<b>Using this App</b><hr>"
                     "<ul>"
                     "<li>Open Preferences (see menu) to add your name.</li><br/>"
                     "<li>Wait 15 minutes to ensure your settings have been registered.</li><br/>"
                     "<li>Go to the Messages tab and select the Send Message button to begin sending messages directly to this device.</li><br/>"
                     "<li>After receiving the notification, you can then view the payload by going to the Messages tab and then tapping the View Messages button on the top right.</li><br/>"
                     "<li>You can also send the database to an email address by going to the Info tab.</li><br/>"
                     "</ul>";
    
    return ret;
}

@end
