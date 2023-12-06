import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    var body: some View {
        VStack {
            LittleLemonLogo() // 1
                .padding(.top, 50)
            
            
            if model.displayingReservationForm{ // 2
                Text("Reservation Details")
                    .padding([.leading, .trailing], 40)
                    .padding([.top, .bottom], 8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
            }else{
                Text("Select a location")
                    .padding([.leading, .trailing], 40)
                    .padding([.top, .bottom], 8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
            }
           
            
            NavigationView {
                List(model.restaurants, id: \.phoneNumber) { restaurantLocation in
                    NavigationLink(destination: ReservationForm(restaurantLocation).environmentObject(model)) {
                        VStack(alignment: .leading) {
                            Text(restaurantLocation.city)
                                .font(.title2)
                            HStack{
                                Text(restaurantLocation.neighborhood)
                                    .font(.footnote)
                                    .foregroundColor(Color.gray)
                                Text("-")
                                    .font(.footnote)
                                    .foregroundColor(Color.gray)
                                Text(restaurantLocation.phoneNumber)
                                    .font(.footnote)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                }
            }
        }
        
        .padding(.top, -10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}

