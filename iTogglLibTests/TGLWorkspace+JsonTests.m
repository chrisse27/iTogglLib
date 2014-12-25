//
//  TGLWorkspace+JsonTests.m
//  iTogglLib
//
//  Created by Christoph Krautz on 23/10/14.
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

#import "TGLWorkspace.h"
#import "TGLWorkspace+Json.h"

@interface TGLWorkspace_JsonTests : XCTestCase

@end

@implementation TGLWorkspace_JsonTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testThatWorkspaceFromDictionaryCopiesAllKnownValues {
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @123, @"id",
                                @"TestName", @"name",
                                @"Unknown", @"unkown",
                                nil];
    TGLWorkspace *workspace = [TGLWorkspace workspaceFromDictionary:dictionary];
    
    XCTAssertEqual(123, workspace.identifier);
    XCTAssertEqualObjects(@"TestName", workspace.name);
}

- (void)testThatWorkspaceFromDictionarySetsIdentifierToZeroIfDictionaryDoesNotContainId {
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @"TestName", @"name",
                                nil];
    TGLWorkspace *workspace = [TGLWorkspace workspaceFromDictionary:dictionary];
    
    XCTAssertEqual(0, workspace.identifier);
}

@end
