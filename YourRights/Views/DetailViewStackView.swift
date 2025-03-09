//
//  DetailViewStackView.swift
//  YourRights
//
//  Created by Robenus Waktole on 3/8/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct DetailViewStackView: View {
    @Binding var scrum: DailyScrum
    @Binding var editingScrum: DailyScrum
    @Binding var isPresentingEditView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
                .navigationTitle(scrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingEditView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Confirm") {
                            isPresentingEditView = false
                            scrum = editingScrum
                        }
                    }
                }
        }
    }
}

@available(iOS 16.0, *)
#Preview {
    DetailViewStackView(scrum: .constant(DailyScrum.sampleData[0]), editingScrum: .constant(DailyScrum.sampleData[0]), isPresentingEditView: .constant(true))
}
