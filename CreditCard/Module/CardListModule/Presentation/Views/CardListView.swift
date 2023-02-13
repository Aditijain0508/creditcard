//
//  cardsView.swift
//

import SwiftUI
import Network
import AVKit

struct CardsView: View {
    let cards: Cards
    let imageHeightWidth: CGFloat = 100.0
    let topPadding: CGFloat = 20
    let vStackPadding: CGFloat = 5
    let height: CGFloat = 60
    
    var body: some View {
        VStack() {
            HStack() {
                Image("visa")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageHeightWidth, height: imageHeightWidth, alignment: .center)
                    .padding(EdgeInsets(top: topPadding, leading: 0, bottom: 0, trailing: 0))
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(cards.title)")
                        .bold()
                        .padding(vStackPadding)
                    HStack(spacing: 0) {
                        Text("\(cards.cardsdescription)")
                            .padding(5)
                        Spacer()
                    }
                    .font(.caption)
                }
            }
            .frame(height: height)
            .foregroundColor(.white)
            .padding(.bottom)
        }
        .background(Color.teal)

    }
}

struct CardListView<Model>: View where Model: CardListViewModel {
   
    @ObservedObject var listViewModel: Model
   
    var body: some View {
        VStack {
            List {
                if let cards = listViewModel.cardss {
                    ForEach(cards, id: \.id) { cards in
                        CardsView(cards: cards)
                    }
                }
            }
            .listStyle(.plain)
            .onAppear {
                listViewModel.fetchProducts()
            }
            .navigationTitle(CardListViewConstants.cardsTittle)
        }
    }
}
