//
//  TGLProject+JsonTest.m
//  iTogglLib
//
//  Created by Christoph Krautz on 15/09/14.
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

#import <XCTest/XCTest.h>

#import "TGLProject.h"
#import "TGLProject+Json.h"

@interface TGLProject_JsonTest : XCTestCase

@end

@implementation TGLProject_JsonTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testThatProjectFromDictionaryReturnsCorrectPRoject
{
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @123, @"id",
                                @"TestName", @"name",
                                @11, @"color",
                                nil];
    TGLProject *project = [TGLProject projectFromDictionary:dictionary];
    
    XCTAssertEqual(123, project.identifier);
    XCTAssertEqualObjects(@"TestName", project.name);
    XCTAssertEqual(11, project.color);
}

@end
