//
//  Constants.swift
//  DailyNews
//
//  Created by Bahittin on 30.10.2023.
//

import UIKit

enum Constants: String {
    ///bf5ad777c9364b59b25d4e2142be2ebf
    case Api_Key      = "bf5ad777c9364b59b25d4e2142be2ebf"
    ///https://newsapi.org/v2/everything
    case Api_URL      = "https://newsapi.org/v2/everything"
    ///https://newsapi.org/v2/top-headlines?country=us&pageSize=20&apiKey=
    case Trending_Url = "https://newsapi.org/v2/top-headlines?country=us&pageSize=20&apiKey="
    ///https://newsapi.org/v2/everything?q=turkey&pageSize=20&apiKey=
    case Popular_Url  = "https://newsapi.org/v2/everything?q=turkey&pageSize=20&apiKey="
    ///https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/b7476f554c5ac12ef7befada38cfe990.jpg
    case null_image   = "https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/b7476f554c5ac12ef7befada38cfe990.jpg"
    ///https://newsapi.org/v2/everything?
    case Search_Url   = "https://newsapi.org/v2/everything?"
}
