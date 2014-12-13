//
//  TGLTogglClientTests.m
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

#import "TGLTogglClient.h"

@interface TGLTogglClientTests : XCTestCase

@end

@implementation TGLTogglClientTests

- (void)testThatInitWithUsernameAndPasswordsSetsValues {
    
    TGLTogglClient *client = [[TGLTogglClient alloc] initWithUserName:@"Username" AndPassword:@"Password"];
    
    XCTAssertEqualObjects(@"Username", client.username);
    XCTAssertEqualObjects(@"Password", client.password);
}

- (void)testThatInitWithApiTokenSetsUsernameAndPassord {

    TGLTogglClient *client = [[TGLTogglClient alloc] initWithApiToken:@"TestAPIToken"];
    
    XCTAssertEqualObjects(@"TestAPIToken", client.username);
    XCTAssertEqualObjects(@"api_token", client.password);
}

@end
