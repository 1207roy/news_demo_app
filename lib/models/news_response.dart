import 'package:json_annotation/json_annotation.dart';
import 'package:newsapp/models/models.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}

var demoJsonData = {
      "status": "ok",
      "totalResults": 70,
      "articles": [
        {
          "source": {"id": "fox-news", "name": "Fox News"},
          "author": "Dom Calicchio",
          "title": "Los Angeles bar owner rips Garcetti, Newsom over double standard on outdoor dining - Fox News",
          "description":
              "A Los Angeles bar owner was fighting back tears Friday, claiming Mayor Eric Garcetti had shut down the outdoor patio at her business -- while letting a Hollywood movie crew set up an outdoor dining area just a short distance away.",
          "url":
              "https://www.foxnews.com/us/los-angeles-bar-owner-rips-garcetti-newsom-over-double-standard-on-outdoor-dining",
          "urlToImage": "https://static.foxnews.com/foxnews.com/content/uploads/2020/12/Ladymask2.jpg",
          "publishedAt": "2020-12-05T06:21:26Z",
          "content":
              "A Los Angeles bar owner was fighting back tears Friday, claiming Mayor Eric Garcetti had shut down the outdoor patio at her business -- while letting a Hollywood movie crew set up an outdoor dining a… [+4113 chars]"
        },
        {
          "source": {"id": "cnn", "name": "CNN"},
          "author": "Annie Grayer, CNN",
          "title": "First shipments of coronavirus vaccine will fall short - CNN",
          "description":
              "The first shipments of coronavirus vaccine won't cover even the small number of people designated to be in  the first group to be immunized, states are learning.",
          "url": "https://www.cnn.com/2020/12/05/health/first-covid-vaccine-shipments-inadequate/index.html",
          "urlToImage":
              "https://cdn.cnn.com/cnnnext/dam/assets/201119175524-02-pfizer-kalamazoo-facility-super-tease.jpeg",
          "publishedAt": "2020-12-05T05:45:00Z",
          "content":
              "(CNN)State health departments and governors' offices across the country are finally being told by the Centers for Disease Control and Prevention and Operation Warp Speed how many doses of the coronav… [+5422 chars]"
        },
        {
          "source": {"id": "the-wall-street-journal", "name": "The Wall Street Journal"},
          "author": "Jeffrey A. Trachtenberg",
          "title":
              "Barnes & Noble’s New Boss Tries to Save the Chain—and Traditional Bookselling - The Wall Street Journal",
          "description":
              "The struggling bookseller has laid off once-powerful managers and overturned relationships with publishers in favor of a more local approach",
          "url":
              "https://www.wsj.com/articles/barnes-nobles-new-boss-tries-to-save-the-chainand-traditional-bookselling-11607144485",
          "urlToImage": "https://images.wsj.net/im-268033/social",
          "publishedAt": "2020-12-05T05:01:00Z",
          "content":
              "A year ago, John Radford had little control over the book selection at the Barnes &amp; Noble store he manages in Idaho Falls, Idaho. Executives in New York decided which titles to carry. The retaile… [+986 chars]"
        },
        {
          "source": {"id": null, "name": "HuffPost"},
          "author": "Mary Papenfuss",
          "title": "CNBC's Controversial Rick Santelli Pitches A Fit Over Coronavirus Safety Measures - HuffPost",
          "description":
              "\"You’re doing a disservice to the viewer,\" CNBC's Andrew Ross Sorkin snapped back. \"I would like to keep our viewers as healthy as humanly possible.\"",
          "url":
              "https://www.huffpost.com/entry/rick-santelli-andrew-ross-sorkin-cnbc-covid-19_n_5fcae2f3c5b6636e09255800",
          "urlToImage":
              "https://img.huffingtonpost.com/asset/5fcaeb4f240000b10140b43c.png?cache=ZoqDgyCuVr&ops=1200_630",
          "publishedAt": "2020-12-05T04:04:00Z",
          "content":
              "In an astoundingly emotional on-air tirade Friday, CNBC personality Rick Santelli sputtered and railed against the need to restrict restaurant outings and to wear face masks to help stem the surging … [+2682 chars]"
        },
        {
          "source": {"id": null, "name": "Salt Lake Tribune"},
          "author": null,
          "title": "Utah coronavirus cases up 3,005 Friday, with 8 more deaths reported - Salt Lake Tribune",
          "description":
              "<b>Editor’s note:</b> <i>The Salt Lake Tribune is providing free access to critical stories about the coronavirus. Sign up for </i><a href=\"https://sltrib.formstack.com/forms/topstories\"><i>our Top Stories newsletter</i></a><i>, sent to your inbox ev",
          "url": "https://sltrib.com//news/2020/12/04/utah-coronavirus-cases-up/",
          "urlToImage":
              "https://www.sltrib.com/resizer/bPgQPj5PnGEiSHU7nLNta-0Zb-o=/1200x630/cloudfront-us-east-1.images.arcpublishing.com/sltrib/NMEFJHZEENEDVI5O2IHSI6NHHI.JPG",
          "publishedAt": "2020-12-05T03:04:59Z",
          "content":
              "Editors note:The Salt Lake Tribune is providing free access to critical stories about the coronavirus. Sign up for our Top Stories newsletter, sent to your inbox every weekday morning. To support jou… [+2481 chars]"
        },
        {
          "source": {"id": null, "name": "KKTV 11 News"},
          "author": "KKTV 11 News",
          "title": "Strange lights in the sky over Colorado Springs - KKTV",
          "description": "Starlink satellites spotted over Colorado Springs",
          "url": "https://www.kktv.com/2020/12/05/strange-lights-in-the-sky-over-colorado-springs/",
          "urlToImage":
              "https://gray-kktv-prod.cdn.arcpublishing.com/resizer/b_Em-KGYSq5bQ3A8-NgP9Vg-v4Q=/980x0/smart/cloudfront-us-east-1.images.arcpublishing.com/gray/SNENNRJN5VP7BN2BSF2N4V3TAI.jpg",
          "publishedAt": "2020-12-05T02:51:00Z",
          "content":
              "COLORADO SPRINGS, Colo. (KKTV) - Phone calls and emails from concerned residents around Colorado Springs poured in tonight. Callers reported a dozens of lights moving through the sky, in a straight l… [+723 chars]"
        },
        {
          "source": {"id": "cnn", "name": "CNN"},
          "author": "Brian Fung, CNN Business",
          "title": "US government won't extend the deadline for a TikTok deal, but negotiations continue - CNN",
          "description":
              "The US government will not extend the Dec. 4 deadline for TikTok's Chinese parent to sell off the social media app, but it will also decline to enforce the executive order requiring the sale, according to a person familiar with the matter.",
          "url": "https://www.cnn.com/2020/12/04/tech/tiktok-deadline/index.html",
          "urlToImage": "https://cdn.cnn.com/cnnnext/dam/assets/201111174645-01-tik-tok-0827-super-tease.jpg",
          "publishedAt": "2020-12-05T01:15:00Z",
          "content":
              "(CNN Business)The US government will not extend the Dec. 4 deadline for TikTok's Chinese parent to sell off the social media app, but it will also decline to enforce the executive order requiring the… [+1576 chars]"
        },
        {
          "source": {"id": null, "name": "Simple Flying"},
          "author": "",
          "title": "Delta Cuts Cash Burn Almost 50% As It Aims For Break-Even Spring - Simple Flying",
          "description":
              "On December 3rd, Delta Air Lines CEO Ed Bastian sent out a wide-ranging memo to its staff worldwide.…",
          "url": "https://simpleflying.com/delta-cash-burn-cut/",
          "urlToImage":
              "https://simpleflying.com/wp-content/uploads/2020/12/Delta-Air-Lines-Airbus-A330-302-N823NW-scaled.jpg",
          "publishedAt": "2020-12-05T01:01:14Z",
          "content":
              "On December 3rd, Delta Air Lines CEO Ed Bastian sent out a wide-ranging memo to its staff worldwide. In it, the airline expanded on its testing program for employees while also offering a vision of g… [+5364 chars]"
        },
        {
          "source": {"id": null, "name": "Vox"},
          "author": "Jariel Arvin",
          "title": "Denmark has announced it will end all oil and gas exploration by 2050 - Vox.com",
          "description":
              "Denmark becomes the first major oil-producing country to announce an end to oil production and extraction.",
          "url": "https://www.vox.com/22153325/denmark-oil-gas-north-sea-extraction",
          "urlToImage":
              "https://cdn.vox-cdn.com/thumbor/f79DIrJb0JFU9VMi8DkuVwdJw5w=/0x419:5530x3314/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/22146581/1228525917.jpg",
          "publishedAt": "2020-12-05T00:55:38Z",
          "content":
              "Denmark has just taken a significant step to lead the world on addressing climate change. The country announced that it will phase out all oil and gas exploration contracts in the North Sea by 2050. … [+6201 chars]"
        },
        {
          "source": {"id": null, "name": "fox13now.com"},
          "author": "Jeff Tavss",
          "title": "Intermountain Healthcare merger with Sanford Health called off - fox13now.com",
          "description":
              "The proposed merger between Utah's Intermountain Healthcare with Sanford Health has been called off.",
          "url":
              "https://www.fox13now.com/news/local-news/intermountain-healthcare-merger-with-sanford-health-called-off",
          "urlToImage":
              "https://ewscripps.brightspotcdn.com/dims4/default/5e42704/2147483647/strip/true/crop/1920x1008+0+36/resize/1200x630!/quality/90/?url=http%3A%2F%2Fmediaassets.fox13now.com%2Ftribune-network%2Ftribkstu-files-wordpress%2F2018%2F03%2Fintermountain-medical-center.jpg",
          "publishedAt": "2020-12-05T00:30:11Z",
          "content":
              "SALT LAKE CITY The proposed merger between Utah's Intermountain Healthcare with Sanford Health has been called off.\r\nSanford Health officials announced Friday the merger deal has been \"indefinitely s… [+1054 chars]"
        },
        {
          "source": {"id": null, "name": "CNET"},
          "author": "Kyle Hyatt",
          "title": "Cadillac dealers are jumping ship rather than upgrade for EV sales, report says - CNET",
          "description":
              "GM's luxury arm is paying dealers unwilling to invest in EV sales to give up their franchise agreements.",
          "url": "https://www.cnet.com/roadshow/news/cadillac-franchise-dealers-jump-ship-ev-sales-lyriq/",
          "urlToImage":
              "https://cnet2.cbsistatic.com/img/2-_wmP42Nde3L2-yx_OKnzgEsoE=/1200x630/2020/11/24/ba37649a-ae3b-47d0-bfb0-276d081acbbc/ogi-cadillac.jpg",
          "publishedAt": "2020-12-05T00:29:08Z",
          "content":
              "Cadillac wants to make EVs its future, but some dealers aren't on board.\r\nCadillac\r\nAs Cadillac gears up to become a manufacturer of electric vehicles, it's reached a point where it needs to start pr… [+1586 chars]"
        },
        {
          "source": {"id": null, "name": "nj.com"},
          "author": "Spencer Kent | NJ Advance Media for NJ.com",
          "title": "COVID-19 vaccines on their way to N.J. hospitals - nj.com",
          "description": "A handful of hospitals could receive the new coronavirus vaccine in just days.",
          "url": "https://www.nj.com/coronavirus/2020/12/covid-19-vaccines-on-their-way-to-nj-hospitals.html",
          "urlToImage":
              "https://www.nj.com/resizer/3ggXInMACcv05Rwfglg_lLzzXEY=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/NPENF6PR4NBWNCWAWILDWITUUE.jpg",
          "publishedAt": "2020-12-05T00:18:00Z",
          "content":
              "A handful of New Jersey hospitals could receive batches of the new COVID-19 vaccines in a matter of days, Gov. Phil Murphy said Friday.\r\nThe news of the selected hospitals comes as the nation prepare… [+4357 chars]"
        },
        {
          "source": {"id": null, "name": "New York Post"},
          "author": "David Meyer, Bruce Golding",
          "title": "Accused MTA overtime cheat Thomas Caputo may lose hefty pension he racked up - New York Post ",
          "description":
              "An accused MTA overtime cheat has been collecting a massive pension that the feds say was boosted by pay he didn’t actually earn — but that gravy train could soon be thrown into reverse! Thomas Cap…",
          "url": "https://nypost.com/2020/12/04/accused-mta-overtime-cheat-thomas-caputo-may-lose-hefty-pension/",
          "urlToImage":
              "https://nypost.com/wp-content/uploads/sites/2/2020/12/Thomas-Caputo.jpg?quality=90&strip=all&w=1200",
          "publishedAt": "2020-12-05T00:17:00Z",
          "content":
              "An accused MTA overtime cheat has been collecting a massive pension that the feds say was boosted by pay he didnt actually earn but that gravy train could soon be thrown into reverse!\r\nThomas Caputo,… [+2552 chars]"
        },
        {
          "source": {"id": null, "name": "TheStreet"},
          "author": "Bret Kenwell",
          "title": "Next Week's Game Plan: Cramer's 'Mad Money' Recap (Friday 12/4/20) - TheStreet",
          "description": "Updates from Salesforce, Starbucks and others are due in the week ahead.",
          "url": "https://www.thestreet.com/jim-cramer/cramers-mad-money-recap-dec-4",
          "urlToImage":
              "https://www.thestreet.com/.image/t_share/MTY4NjUxNTQzNTUwMTc0ODU1/billionaire-ken-fisher-on-the-stocks-to-own-in-this-bull-market.jpg",
          "publishedAt": "2020-12-04T23:54:00Z",
          "content":
              "Jim Cramer took a look at next week’s game plan on CNBC’s “Mad Money” TV show on Friday. \r\nOn Monday, investors will be hoping to have some sort of traction in Washington regarding a stimulus bill. A… [+6845 chars]"
        },
        {
          "source": {"id": null, "name": "HuffPost"},
          "author": "Monica Torres",
          "title": "Can Your Employer Require You To Get A COVID-19 Vaccine? - HuffPost",
          "description":
              "Legal experts weigh in on what could happen at work once a coronavirus vaccine is authorized in America.",
          "url": "https://www.huffpost.com/entry/can-employer-require-covid-vaccine_l_5fc932c1c5b613828e3324a6",
          "urlToImage":
              "https://img.huffingtonpost.com/asset/5fc933a4210000870173e1c0.jpeg?cache=UrJkNM27ax&ops=1778_1000",
          "publishedAt": "2020-12-04T23:52:00Z",
          "content":
              "Yes, there is a legal precedent for employers mandating vaccines, but there are also many legal accommodations companies must consider.\r\nThere is not yet a COVID-19 vaccine authorized for general use… [+6503 chars]"
        },
        {
          "source": {"id": null, "name": "Deadline"},
          "author": "Bruce Haring",
          "title": "Disney Cruise Line Drops Anchor, Cancels Departures Through The End Of February - Deadline",
          "description":
              "The Disney Cruise Line announced Friday that it has suspended all departures through the end of February. The move continues cutbacks at the company, which has seen layoffs and the end of such vehicles as Radio Disney in recent days, as the pandemic’s fallout…",
          "url": "https://deadline.com/2020/12/disney-cruise-line-cancels-departures-through-end-february-1234650792/",
          "urlToImage": "https://deadline.com/wp-content/uploads/2020/12/AP_20074051579186.jpg?w=512",
          "publishedAt": "2020-12-04T23:48:00Z",
          "content":
              "The Disney Cruise Line announced Friday that it has suspended all departures through the end of February.\r\nThe move continues cutbacks at the company, which has seen layoffs and the end of such vehic… [+1634 chars]"
        },
        {
          "source": {"id": null, "name": "Motley Fool"},
          "author": "Dan Caplinger",
          "title": "These Stocks Hold the Key to the Market's Returns in 2021 - Motley Fool",
          "description": "It's not a sector many investors are looking at right now -- but they should be.",
          "url": "https://www.fool.com/investing/2020/12/04/these-stocks-hold-the-key-to-the-markets-returns-i/",
          "urlToImage": "https://g.foolcdn.com/editorial/images/603710/2021-getty.jpg",
          "publishedAt": "2020-12-04T23:47:40Z",
          "content":
              "The stock market pushed further into record territory on Friday, closing a remarkable week. There are plenty of uncertainties in the market right now, but investors are nevertheless convinced that ev… [+4100 chars]"
        },
        {
          "source": {"id": null, "name": "MarketWatch"},
          "author": "Sarah E. Needleman",
          "title": "Netflix sued by Activision Blizzard for allegedly poaching its former CFO - MarketWatch",
          "description": "",
          "url":
              "https://www.marketwatch.com/story/netflix-sued-by-activision-blizzard-for-allegedly-poaching-its-former-cfo-11607125087",
          "urlToImage": "https://images.mktw.net/im-268820/social",
          "publishedAt": "2020-12-04T23:38:00Z",
          "content":
              "Activision Blizzard Inc. \r\n ATVI,\r\n +2.65%\r\nis suing Netflix Inc. \r\n NFLX,\r\n +0.16%\r\nfor allegedly poaching its former finance chief and causing competitive harm, citing a pattern of behavior by the … [+874 chars]"
        },
        {
          "source": {"id": "engadget", "name": "Engadget"},
          "author": "",
          "title": "The Ravn X is a 55000-pound drone for launching satellites - Engadget",
          "description":
              "This week, a company based out of Alabama called Aevum unveiled the Ravn X, a drone designed to carry and launch satellites into low-orbit.",
          "url": "https://www.engadget.com/aevum-ravn-x-233606617.html",
          "urlToImage":
              "https://o.aolcdn.com/images/dims?resize=1200%2C630&crop=1200%2C630%2C0%2C0&quality=95&image_uri=https%3A%2F%2Fs.yimg.com%2Fos%2Fcreatr-uploaded-images%2F2020-12%2F5b86a380-3686-11eb-b6e1-fb349a73488f&client=amp-blogside-v2&signature=314150dd385eaf61279e04839355b606930db5d6",
          "publishedAt": "2020-12-04T23:36:59Z",
          "content":
              "This week, a company based out of Alabama called Aevum unveiled the Ravn X, a drone designed to carry and launch satellites into low-orbit. It weighs in at approximately 55,000 pounds when it’s carry… [+679 chars]"
        },
        {
          "source": {"id": "techcrunch", "name": "TechCrunch"},
          "author": "Anthony Ha",
          "title": "Daily Crunch: Slack and Salesforce execs explain their big acquisition - TechCrunch",
          "description":
              "We learn more about Slack’s future, Revolut adds new payment features and DoorDash pushes its IPO range upward. This is your Daily Crunch for December 4, 2020. The big story: Slack and Salesforce execs explain their big acquisition After Salesforce announced …",
          "url": "http://techcrunch.com/2020/12/04/daily-crunch-slack-salesforce-interview/",
          "urlToImage": "https://techcrunch.com/wp-content/uploads/2020/06/GettyImages-1211180761.jpg?w=600",
          "publishedAt": "2020-12-04T23:12:22Z",
          "content":
              "We learn more about Slack’s future, Revolut adds new payment features and DoorDash pushes its IPO range upward. This is your Daily Crunch for December 4, 2020.\r\nThe big story: Slack and Salesforce ex… [+2287 chars]"
        }
      ]
    };
