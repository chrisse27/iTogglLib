//
//  TGLProject+JsonTest.m
//  iTogglLib
//
//  Created by Christoph Krautz on 15/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "TGLProject+Json.h"

@interface TGLProject_JsonTest : XCTestCase

@end

@implementation TGLProject_JsonTest

- (void)testExample
{
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @123, @"id",
                                @"TestName", @"name",
                                nil];
    TGLProject *project = [TGLProject projectFromDictionary:dictionary];
    
    XCTAssertEqual(123, project.identifier);
    XCTAssertEqualObjects(@"TestName", project.name);
}

@end