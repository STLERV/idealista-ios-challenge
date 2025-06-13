//
//  AdsListsPresenterTests.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 13/6/25.
//

import XCTest
@testable import IdealistaiOSChanllenge

final class AdsListsPresenterTests: XCTestCase {

    var sut: AdsListPresenter!
    var viewMock: AdsListViewMock!
    var interactorMock: AdsListInteractorMock!

    override func setUp() {
        viewMock = AdsListViewMock()
        interactorMock = AdsListInteractorMock()
        sut = AdsListPresenter(interactor: interactorMock)
        sut.view = viewMock
    }

    override func tearDown() {
        super.tearDown()
        releaseSut()
    }
    
    func releaseSut() {
        sut = nil
        interactorMock = nil
        viewMock = nil
    }

    func testSutIsntNil() {
        XCTAssertNotNil(sut)
    }

    func testOnViewDidLoad() {
        let expectation = XCTestExpectation(description: "Esperando fetch async")
        sut.onViewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertEqual(self.interactorMock.fetchAdsCount, 1)
            XCTAssertEqual(self.viewMock.displayAdsCount, 1)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testGetAd() {
        sut.ads = [AdList.mock]
        let res = sut.getAd(index: 0)
        XCTAssertEqual(res?.id, AdList.mock.id)
    }

    func testGetAdsCount() {
        sut.ads = [AdList.mock, AdList.mock]
        XCTAssertEqual(sut.getAdsCount(), 2)
    }
}
