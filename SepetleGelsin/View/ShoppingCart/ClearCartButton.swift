import SwiftUI

struct ClearCartButton: View {
    @State private var showingAlert = false
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
        Button (action: {
            showingAlert.toggle()
        }){
            Image(systemName: "trash")
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("UYARI"),
                  message: Text("Sepeti boşaltmak ister misiniz"),
                  primaryButton: .destructive(Text("Evet")){
                self.viewModel.shoppingCartList.removeAll()
            },
                  secondaryButton: .cancel(Text("İptal")) )
        }

    }
}

struct ClearCart_Previews: PreviewProvider {
    static var previews: some View {
        ClearCartButton()
    }
}