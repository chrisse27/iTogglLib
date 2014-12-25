//
//  iTogglLibTests.m
//  iTogglLib
//
//  Created by Christoph Krautz on 06/05/14.
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

#import "TGLTimeEntry.h"

@interface TGLTimeEntryTests : XCTestCase

@end

@implementation TGLTimeEntryTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testThatIsEqualToTimeEntryReturnsTrueWhenDescriptionsAndPidsAreEqual
{
    TGLTimeEntry *entry1 = [[TGLTimeEntry alloc] init];
    entry1.identifier = 123;
    entry1.entryDescription = @"Test";
    entry1.pid = 789;

    TGLTimeEntry *entry2 = [[TGLTimeEntry alloc] init];
    entry2.identifier = 123;
    entry2.entryDescription = @"Test";
    entry2.pid = 789;
    
    XCTAssertTrue([entry1 isEqualToTimeEntry:entry2]);
}

- (void)testThatIsEqualToTimeEntryReturnsTrueWhenArgumentsAreIdentical
{
    TGLTimeEntry *entry = [[TGLTimeEntry alloc] init];
    entry.identifier = 123;
    entry.entryDescription = @"Test";
    entry.pid = 789;
    
    XCTAssertTrue([entry isEqualToTimeEntry:entry]);
}

- (void)testThatIsEqualToTimeEntryReturnsFalseWhenDescriptionsAreEqualButPidsAreNotEqual
{
    TGLTimeEntry *entry1 = [[TGLTimeEntry alloc] init];
    entry1.identifier = 123;
    entry1.entryDescription = @"Test";
    entry1.pid = 789;

    TGLTimeEntry *entry2 = [[TGLTimeEntry alloc] init];
    entry2.identifier = 123;
    entry2.entryDescription = @"Test";
    entry2.pid = 890;
    
    XCTAssertFalse([entry1 isEqualToTimeEntry:entry2]);
}

- (void)testThatIsEqualToTimeEntryReturnsFalseWhenDescriptionsAreNotEqualButPidsAreEqual
{
    TGLTimeEntry *entry1 = [[TGLTimeEntry alloc] init];
    entry1.identifier = 123;
    entry1.entryDescription = @"Test1";
    entry1.pid = 789;
    
    TGLTimeEntry *entry2 = [[TGLTimeEntry alloc] init];
    entry2.identifier = 123;
    entry2.entryDescription = @"Test2";
    entry2.pid = 789;
    
    XCTAssertFalse([entry1 isEqualToTimeEntry:entry2]);
}

- (void)testThatIsEqualToTimeEntryReturnsFalseWhenDescriptionsAndPidsAreNotEqual
{
    TGLTimeEntry *entry1 = [[TGLTimeEntry alloc] init];
    entry1.identifier = 123;
    entry1.entryDescription = @"Test1";
    entry1.pid = 789;
    
    TGLTimeEntry *entry2 = [[TGLTimeEntry alloc] init];
    entry2.identifier = 123;
    entry2.entryDescription = @"Test2";
    entry2.pid = 890;
    
    XCTAssertFalse([entry1 isEqualToTimeEntry:entry2]);
}

- (void)testThatIsEqualReturnsFalseWhenComparingWithObjectThatIsNotATimeEntry
{
    TGLTimeEntry *entry1 = [[TGLTimeEntry alloc] init];
    entry1.identifier = 123;
    entry1.entryDescription = @"Test1";
    entry1.pid = 789;
    
    NSObject *object = [[NSObject alloc] init];
    
    XCTAssertFalse([entry1 isEqual:object]);
}

@end
