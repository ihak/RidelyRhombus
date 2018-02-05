//
//  ridleyrhombusTests.m
//  ridleyrhombusTests
//
//  Created by Hassan Ahmed Khan on 2/5/18.
//  Copyright © 2018 Hassan Ahmed Khan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Colors.h"

@interface ridleyrhombusTests : XCTestCase

@end

@implementation ridleyrhombusTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testColors {
    XCTAssertGreaterThan([Colors colors].count, 0);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
