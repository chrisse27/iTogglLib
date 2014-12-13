//
//  TGLTimeEntry+JsonTests.m
//  iTogglLib
//
//  Created by Christoph Krautz on 27/08/14.
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
#import "TGLTimeEntry+Json.h"

@interface TGLTimeEntry_JsonTests : XCTestCase

@end

@implementation TGLTimeEntry_JsonTests

- (void)testThatTimeEntryFromDictionaryCopiesAllKnownValues
{
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @123, @"id",
                                @"TestDescription", @"description",
                                @"1970-01-01T00:00:01+0000", @"start",
                                @789, @"pid",
                                @"Unknown", @"unkown",
                                nil];
    TGLTimeEntry *entry = [TGLTimeEntry timeEntryFromDictionary:dictionary];
    
    XCTAssertEqual(123, entry.identifier);
    XCTAssertEqualObjects(@"TestDescription", entry.entryDescription);
    XCTAssertEqualObjects([NSDate dateWithTimeIntervalSince1970:1.0], entry.start);
    XCTAssertEqual(789, entry.pid);
};

- (void)testThatDictionaryContainsDescriptionOfTimeEntry
{
    TGLTimeEntry *entry = [[TGLTimeEntry alloc] init];
    entry.entryDescription = @"Test";
    
    NSDictionary *dictionary = [entry dictionary];
    
    NSDictionary *timeEntryDict = [dictionary objectForKey:@"time_entry"];
    
    XCTAssertEqualObjects(@"Test", [timeEntryDict objectForKey:@"description"]);
}

- (void)testThatDictionaryContainsPidOfTimeEntry
{
    TGLTimeEntry *entry = [[TGLTimeEntry alloc] init];
    entry.pid = 789;
    
    NSDictionary *dictionary = [entry dictionary];
    
    NSDictionary *timeEntryDict = [dictionary objectForKey:@"time_entry"];
    
    XCTAssertEqualObjects([NSNumber numberWithInteger:789], [timeEntryDict objectForKey:@"pid"]);
}

@end
