//
//  TGLTimeEntry+JsonTests.m
//  iTogglLib
//
//  Created by Christoph Krautz on 27/08/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "TGLTimeEntry.h"
#import "TGLTimeEntry+Json.h"

@interface TGLTimeEntry_JsonTests : XCTestCase

@end

@implementation TGLTimeEntry_JsonTests

- (void)testThatTimeEntryFromDictionaryReturnsCorrectEntry
{
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @123, @"id",
                                @"TestDescription", @"description",
                                @"1970-01-01T00:00:01+0000", @"start",
                                @789, @"pid",
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
