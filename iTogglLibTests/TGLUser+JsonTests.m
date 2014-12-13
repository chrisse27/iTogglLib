//
//  TGLUSer+JsonTests.m
//  iTogglLib
//
//  Created by Christoph Krautz on 13/12/14.
//  Copyright 2014 Christoph Krautz
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "TGLUser.h"
#import "TGLUser+Json.h"

@interface TGLUser_JsonTests : XCTestCase

@end

@implementation TGLUser_JsonTests

- (void)testThatUserFromDictionaryCopiesAllKnownValues {
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @"TestApiToken", @"api_token",
                                @"TestName", @"fullname",
                                @"TestEMail", @"email",
                                @"Unknown", @"unknown",
                                nil];
    TGLUser *user = [TGLUser userFromDictionary:dictionary];
    
    XCTAssertEqualObjects(@"TestApiToken", user.apiToken);
    XCTAssertEqualObjects(@"TestName", user.fullName);
    XCTAssertEqualObjects(@"TestEMail", user.eMail);
}

@end
