//
//  iTogglLibTests.m
//  iTogglLibTests
//
//  Created by Christoph Krautz on 06/05/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "TGLTimeEntry.h"

@interface TGLTimeEntryTests : XCTestCase

@end

@implementation TGLTimeEntryTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatInitWithIdentifierAndDescriptionAndStartAndPidSetsCorrespondingProperties
{
    TGLTimeEntry *entry = [[TGLTimeEntry alloc] initWithIdentifier:123 andDescription:@"Test" andStart:[NSDate dateWithTimeIntervalSince1970:456] andPid:789];
    
    XCTAssertEqual(123, entry.identifier);
    XCTAssertEqual(@"Test", entry.description);
    XCTAssertEqual([NSDate dateWithTimeIntervalSince1970:456].timeIntervalSince1970, entry.start.timeIntervalSince1970);
    XCTAssertEqual(789, entry.pid);
}

- (void)testThatIsEqualToTimeEntryReturnsTrueWhenDescriptionsAndPidsAreEqual
{
    TGLTimeEntry *entry1 = [[TGLTimeEntry alloc] initWithIdentifier:123 andDescription:@"Test" andStart:[NSDate dateWithTimeIntervalSince1970:456] andPid:789];

    TGLTimeEntry *entry2 = [[TGLTimeEntry alloc] initWithIdentifier:234 andDescription:@"Test" andStart:[NSDate dateWithTimeIntervalSince1970:567] andPid:789];
    
    XCTAssertTrue([entry1 isEqualToTimeEntry:entry2]);
}

- (void)testThatIsEqualToTimeEntryReturnsTrueWhenArgumentsAreIdentical
{
    TGLTimeEntry *entry = [[TGLTimeEntry alloc] initWithIdentifier:123 andDescription:@"Test" andStart:[NSDate dateWithTimeIntervalSince1970:456] andPid:789];
    
    XCTAssertTrue([entry isEqualToTimeEntry:entry]);
}

- (void)testThatIsEqualToTimeEntryReturnsFalseWhenDescriptionsAreEqualButPidsAreNotEqual
{
    TGLTimeEntry *entry1 = [[TGLTimeEntry alloc] initWithIdentifier:123 andDescription:@"Test" andStart:[NSDate dateWithTimeIntervalSince1970:456] andPid:789];
    
    TGLTimeEntry *entry2 = [[TGLTimeEntry alloc] initWithIdentifier:234 andDescription:@"Test" andStart:[NSDate dateWithTimeIntervalSince1970:567] andPid:890];
    
    XCTAssertFalse([entry1 isEqualToTimeEntry:entry2]);
}

- (void)testThatIsEqualToTimeEntryReturnsFalseWhenDescriptionsAreNotEqualButPidsAreEqual
{
    TGLTimeEntry *entry1 = [[TGLTimeEntry alloc] initWithIdentifier:123 andDescription:@"Test1" andStart:[NSDate dateWithTimeIntervalSince1970:456] andPid:789];
    
    TGLTimeEntry *entry2 = [[TGLTimeEntry alloc] initWithIdentifier:234 andDescription:@"Test2" andStart:[NSDate dateWithTimeIntervalSince1970:567] andPid:789];
    
    XCTAssertFalse([entry1 isEqualToTimeEntry:entry2]);
}

- (void)testThatIsEqualToTimeEntryReturnsFalseWhenDescriptionsAndPidsAreNotEqual
{
    TGLTimeEntry *entry1 = [[TGLTimeEntry alloc] initWithIdentifier:123 andDescription:@"Test1" andStart:[NSDate dateWithTimeIntervalSince1970:456] andPid:789];
    
    TGLTimeEntry *entry2 = [[TGLTimeEntry alloc] initWithIdentifier:234 andDescription:@"Test2" andStart:[NSDate dateWithTimeIntervalSince1970:567] andPid:890];
    
    XCTAssertFalse([entry1 isEqualToTimeEntry:entry2]);
}

- (void)testThatIsEqualReturnsFalseWhenComparingWithObjectThatIsNotATimeEntry
{
    TGLTimeEntry *entry1 = [[TGLTimeEntry alloc] initWithIdentifier:123 andDescription:@"Test1" andStart:[NSDate dateWithTimeIntervalSince1970:456] andPid:789];
    
    NSObject *object = [[NSObject alloc] init];
    
    XCTAssertFalse([entry1 isEqual:object]);
}

@end
