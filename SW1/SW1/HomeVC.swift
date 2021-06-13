//
//  HomeVC.swift
//  SW1
//
//  Created by abdullah FH  on 02/11/1442 AH.
//

import SwiftUI

struct HomeVC: View {
    @State var MyName : String = "abdullah"
    @State var MyText : String = "isc Course"
    @State private var iStext : Bool = true
    @State var IMGData = Data.init(count: 0)
    @State var shown = false
    var body: some View {
        ZStack {
          
                Color.white.edgesIgnoringSafeArea(.all)
           
                HStack {
                    VStack{
                        if self.iStext == true {
                            Text(MyName)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 300, height: 70)
                                .background(Color.black)
                                .cornerRadius(12)
                                .padding()
                        } else {
                            Text(MyText)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 300, height: 70)
                                .background(Color.black)
                                .cornerRadius(12)
                                .padding()
                        }
                        
                        VStack{
                            if IMGData.count != 0 {
                           
                                Image(uiImage: UIImage(data: IMGData)!)
                                .resizable()
                                .frame(width: 360, height: 360)
                                .border(Color.black, width: 1)
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(3)
                                .padding()
                            Spacer()
                            }
                            
                        }
                        .frame(width: 360, height: 360)
                        .cornerRadius(3)
                        .padding()
                        Button(action: {
                            
                            self.shown.toggle()
                          
                        }, label: {
                            HStack{
                                if self.iStext == true {
                                Image(systemName: "photo.on.rectangle.angled")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding(10)
                                
                                    
                                Text("اختيار صورة")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .padding(20)
                                } else {
                                  
                                    Image(systemName: "photo.on.rectangle.angled")
                                        .font(.title)
                                        .foregroundColor(.red)
                                        .padding(10)
                                    
                                    Text("تغير الصورة")
                                        .font(.largeTitle)
                                        .foregroundColor(.red)
                                        .padding(20)
                                    
                                }
                            }
                         
                            .frame(width: 375, height: 70)
                            .background(Color.black)
                            .cornerRadius(12)
                        })
                       
                        Spacer()
                    }.sheet(isPresented: $shown) {
                        picker(shown: self.$shown, IMGData: self.$IMGData)
                        
                    }
                   
              
                } .animation(.spring())
               
            }
            
        }
    }


struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC()
    }
}
