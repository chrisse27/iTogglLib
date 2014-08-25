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

- (void)testThatIsEquals
{
    TGLTimeEntry *entry1 = [[TGLTimeEntry alloc] initWithIdentifier:123 andDescription:@"Test" andStart:[NSDate dateWithTimeIntervalSince1970:123] andPid:456];

    TGLTimeEntry *entry2 = [[TGLTimeEntry alloc] initWithIdentifier:123 andDescription:@"Test" andStart:[NSDate dateWithTimeIntervalSince1970:123] andPid:456];
    
    XCTAssertTrue([entry1 isEqual:entry2]);
}

@end
