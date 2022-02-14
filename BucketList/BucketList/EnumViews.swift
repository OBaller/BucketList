//
//  EnumViews.swift
//  BucketList
//
//  Created by naseem on 14/02/2022.
//

import SwiftUI

struct EnumViews: View {
    enum LoadingState {
        case loading, success, failed
    }
    
    var loadingState = LoadingState.loading

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        if loadingState == .loading {
            LoadingView()
        } else if loadingState == .success {
            SuccessView()
        } else if loadingState == .failed {
            FailedView()
        }

    }
}

struct EnumViews_Previews: PreviewProvider {
    static var previews: some View {
        EnumViews()
    }
}


struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}
