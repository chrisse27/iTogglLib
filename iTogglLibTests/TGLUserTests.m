//
//  TGLUserTests.m
//  iTogglLib
//
//  Created by Christoph Krautz on 27/08/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "TGLUser.h"

@interface TGLUserTests : XCTestCase

@end

@implementation TGLUserTests

- (void)testThatInitWithApiTokenSetsTokenProperty
{
    TGLUser* user = [[TGLUser alloc] initWithApiToken:@"TEST_TOKEN"];
    
    XCTAssertEqualObjects(@"TEST_TOKEN", user.apiToken);
}

@end
