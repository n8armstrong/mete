//
//  CurrentMeetingStore.swift
//  Mete
//
//  Created by Nate Armstrong on 3/16/15.
//  Copyright (c) 2015 Nate Armstrong. All rights reserved.
//

import UIKit

class CurrentMeetingStore: EventEmitter {

  var meeting: Meeting?


  func emitChange() {
    emit(.Change)
  }

  func addChangeListener(listener: AnyObject, selector: Selector) {
    on(.Change, send: selector, to: listener)
  }

  func get() -> Meeting? {
    return meeting
  }

  func set(meeting: Meeting?) {
    self.meeting = meeting
    NSUserDefaults.standardUserDefaults().setObject(meeting?.email,
      forKey: "CurrentMeetingEmail")
    emitChange()
  }

  func clear() {
    self.set(nil)
  }

}
