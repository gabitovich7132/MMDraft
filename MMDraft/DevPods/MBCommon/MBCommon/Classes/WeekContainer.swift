//
//  WeekContainer.swift
//  MBCommon
//
//  Created by Zhenis Mutan on 10/27/20.
//

public class WeakContainer<T> {
    private weak var _value: AnyObject?
    public var value: T? {
        set { self._value = newValue as AnyObject }
        get { return _value as? T }
    }
    
    public init(value: T) {
        self._value = value as AnyObject
    }
}
