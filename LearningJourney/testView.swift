//
//  testView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 19/10/2025.
//

import SwiftUI

struct testView: View {
    @State private var selectedMonth = Calendar.current.component(.month, from: Date())
    @State private var selectedYear = Calendar.current.component(.year, from: Date())
    @State private var showingPicker = false
    
    let months = Calendar.current.monthSymbols
    let years = Array(2000...2035)
    
    var body: some View {
        ZStack {
            // الزر الأساسي
            Button {
                showingPicker = true
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 36))
                    .foregroundStyle(Color.orange)
            }

            // النافذة المنبثقة
            if showingPicker {
                // Backdrop that dismisses on tap
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation { showingPicker = false }
                    }

                VStack(spacing: 20) {
                    Text("Select Month & Year")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    HStack(spacing: 0) {
                        // Picker للشهور
                        Picker("Month", selection: $selectedMonth) {
                            ForEach(1...12, id: \.self) { index in
                                Text(months[index - 1]).tag(index)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 150)
                        
                        // Picker للسنوات بدون فاصلة
                        Picker("Year", selection: $selectedYear) {
                            ForEach(years, id: \.self) { year in
                                Text(String(year))
                                    .tag(year)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 100)
                    }
                    .colorScheme(.dark)
                    
                    Button("Done") {
                        withAnimation {
                            showingPicker = false
                        }
                    }
                    .font(.headline)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 24)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
                .padding()
                .frame(width: 320)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(radius: 10)
                .transition(.scale.combined(with: .opacity))
                .zIndex(1)
            }
        }
        .animation(.easeInOut, value: showingPicker)
    }
}

#Preview {
    testView()
}
