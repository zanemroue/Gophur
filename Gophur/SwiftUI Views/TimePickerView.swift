//
//  TimePickerView.swift
//  Gophur
//
//  Created by Zane Mroue on 11/12/2022.
//

import SwiftUI

struct TimePickerView: UIViewRepresentable {

    @Binding var selectedTime: Date

    func makeUIView(context: Context) -> UIDatePicker {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.addTarget(context.coordinator,
                         action: #selector(Coordinator.timeChanged(_:)),
                         for: .valueChanged)
        return picker
    }

    func updateUIView(_ uiView: UIDatePicker, context: Context) {
        uiView.setDate(selectedTime, animated: true)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: TimePickerView

        init(_ parent: TimePickerView) {
            self.parent = parent
        }

        @objc func timeChanged(_ sender: UIDatePicker) {
            parent.selectedTime = sender.date
        }
    }
}

