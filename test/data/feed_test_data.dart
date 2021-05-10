import 'package:podcustard/actions/store_feed_action.dart';
import 'package:podcustard/models/rss/rss_feed.dart';
import 'package:podcustard/services/feeds_service.dart';

import '../mocks/http_client_mocks.dart';

/// Use the feeds service with a fake http client that returns previously saved
/// response data for the after dark podcast
Future<RssFeed> getInTheDarkFeed() async {
  final service = FeedsService(FakeHttpClient(response: in_the_dark_feed));
  final action = await service.retrieveFeed('url') as StoreFeedAction;
  return action.feed;
}

/// typical xml from some rss feeds
/// - in_the_dark_feed
/// - twit_feed
///
final in_the_dark_feed = '''
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>In the Dark</title>
    <link>http://www.apmreports.org/in-the-dark</link>
    <description>Serial investigative journalism from APM Reports, with host Madeleine Baran and a team of reporters. In Season 1, we looked at the abduction of Jacob Wetterling in rural Minnesota and the accountability of sheriffs in solving crime. In Season 2, we examined the case of Curtis Flowers, who has been tried six times for the same crime. He's won appeal after appeal, but every time, prosecutor Doug Evans just tries the case again.</description>
    <language>en-us</language>
    <copyright>Copyright 2020 American Public Media</copyright>
    <ttl>60</ttl>
    <itunes:author>APM Reports</itunes:author>
    <itunes:summary>Serial investigative journalism from APM Reports, with host Madeleine Baran and a team of reporters. In Season 1, we looked at the abduction of Jacob Wetterling in rural Minnesota and the accountability of sheriffs in solving crime. In Season 2, we examined the case of Curtis Flowers, who has been tried six times for the same crime. He's won appeal after appeal, but every time, prosecutor Doug Evans just tries the case again.</itunes:summary>
    <itunes:type>serial</itunes:type>
    <itunes:complete>No</itunes:complete>
    <itunes:explicit>no</itunes:explicit>
    <atom:link rel="self" type="application/rss+builder" href="https://feeds.publicradio.org/public_feeds/in-the-dark/itunes/rss"/>
    <itunes:owner>
      <itunes:name>APM Reports</itunes:name>
      <itunes:email>inthedark@apmreports.org</itunes:email>
    </itunes:owner>
    <itunes:image href="https://img.apmcdn.org/0e8e58bbebd60d66265923e012ff633a683d7a7b/uncropped/16675f-20180413-in-the-dark-apm-reports.jpg"/>
    <itunes:category text="Society &amp;amp; Culture">
      <itunes:category text="Documentary"/>
    </itunes:category>
    <image>
      <url>https://img.apmcdn.org/0e8e58bbebd60d66265923e012ff633a683d7a7b/uncropped/16675f-20180413-in-the-dark-apm-reports.jpg</url>
      <title>In the Dark</title>
      <link>http://www.apmreports.org/in-the-dark</link>
    </image>
    <item>
      <title>S2 E18: The Recusal</title>
      <description>
        <![CDATA[District Attorney Doug Evans has prosecuted Curtis Flowers for 23 years and six trials. Now he says he's done.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[District Attorney Doug Evans has prosecuted Curtis Flowers for 23 years and six trials. Now he says he's done.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>18</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[District Attorney Doug Evans has prosecuted Curtis Flowers for 23 years and six trials. Now he says he's done.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[District Attorney Doug Evans has prosecuted Curtis Flowers for 23 years and six trials. Now he says he's done.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 07 Jan 2020 18:29:45 -0600</pubDate>
      <enclosure length="17295613" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2020/01/07/inthedarks02e18_128.mp3"/>
      <itunes:duration>00:18:00</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2020/01/07/inthedarks02e18_128.mp3</guid>
    </item>
    <item>
      <title>S2 E17: Home</title>
      <description>
        <![CDATA[After almost 23 years, Curtis Flowers is no longer behind bars. For his family, it's a long-awaited reunion. But not everyone in Winona is happy.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[After almost 23 years, Curtis Flowers is no longer behind bars. For his family, it's a long-awaited reunion. But not everyone in Winona is happy.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>17</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[After almost 23 years, Curtis Flowers is no longer behind bars. For his family, it's a long-awaited reunion. But not everyone in Winona is happy.   Support investigative journalism with a donation ...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[After almost 23 years, Curtis Flowers is no longer behind bars. For his family, it's a long-awaited reunion. But not everyone in Winona is happy.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Sun, 22 Dec 2019 14:58:01 -0600</pubDate>
      <enclosure length="40755494" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2019/12/22/inthedarks02e17_128.mp3"/>
      <itunes:duration>00:42:27</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2019/12/22/inthedarks02e17_128.mp3</guid>
    </item>
    <item>
      <title>S2 E16: A Hearing</title>
      <description>
        <![CDATA[After nearly 23 years locked up, Curtis Flowers has a chance to get out on bail -- if his lawyers can convince the judge to rule in his favor.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[After nearly 23 years locked up, Curtis Flowers has a chance to get out on bail -- if his lawyers can convince the judge to rule in his favor.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>16</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[After nearly 23 years locked up, Curtis Flowers has a chance to get out on bail -- if his lawyers can convince the judge to rule in his favor.   Support investigative journalism with a donation to ...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[After nearly 23 years locked up, Curtis Flowers has a chance to get out on bail -- if his lawyers can convince the judge to rule in his favor.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 17 Dec 2019 20:33:11 -0600</pubDate>
      <enclosure length="45939452" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2019/12/17/inthedarks02e16_128.mp3"/>
      <itunes:duration>00:47:51</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2019/12/17/inthedarks02e16_128.mp3</guid>
    </item>
    <item>
      <title>S2 E15: Revelations</title>
      <description>
        <![CDATA[It's been 11 days since the U.S. Supreme Court threw out Curtis Flowers' conviction. But the story didn't end there. In recent days, there have been three other significant developments, including new details from a key witness, that may determine Flowers' fate.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[It's been 11 days since the U.S. Supreme Court threw out Curtis Flowers' conviction. But the story didn't end there. In recent days, there have been three other significant developments, including new details from a key witness, that may determine Flowers' fate.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>15</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[It's been 11 days since the U.S. Supreme Court threw out Curtis Flowers' conviction. But the story didn't end there. In recent days, there have been three other significant developments, including ...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[It's been 11 days since the U.S. Supreme Court threw out Curtis Flowers' conviction. But the story didn't end there. In recent days, there have been three other significant developments, including new details from a key witness, that may determine Flowers' fate.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 02 Jul 2019 00:00:31 -0500</pubDate>
      <enclosure length="54034489" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2019/07/02/inthedarks02e15_128.mp3"/>
      <itunes:duration>00:56:16</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2019/07/02/inthedarks02e15_128.mp3</guid>
    </item>
    <item>
      <title>S2 E14: The Decision</title>
      <description>
        <![CDATA[On Friday, June 21, after months of deliberation, the U.S. Supreme Court handed down its opinion in the Curtis Flowers case. In a 7-2 ruling, the justices threw out the conviction from his sixth trial, in 2010. The decision of what happens next -- whether to release Flowers or begin a seventh trial -- now lies with the same prosecutor who's pursued him from the beginning: Doug Evans.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[On Friday, June 21, after months of deliberation, the U.S. Supreme Court handed down its opinion in the Curtis Flowers case. In a 7-2 ruling, the justices threw out the conviction from his sixth trial, in 2010. The decision of what happens next -- whether to release Flowers or begin a seventh trial -- now lies with the same prosecutor who's pursued him from the beginning: Doug Evans.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>14</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[On Friday, June 21, after months of deliberation, the U.S. Supreme Court handed down its opinion in the Curtis Flowers case. In a 7-2 ruling, the justices threw out the conviction from his sixth tr...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[On Friday, June 21, after months of deliberation, the U.S. Supreme Court handed down its opinion in the Curtis Flowers case. In a 7-2 ruling, the justices threw out the conviction from his sixth trial, in 2010. The decision of what happens next -- whether to release Flowers or begin a seventh trial -- now lies with the same prosecutor who's pursued him from the beginning: Doug Evans.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Sat, 22 Jun 2019 05:39:11 -0500</pubDate>
      <enclosure length="14811111" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2019/06/22/inthedarks02e14_128.mp3"/>
      <itunes:duration>00:15:25</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2019/06/22/inthedarks02e14_128.mp3</guid>
    </item>
    <item>
      <title>S2 E13: Oral Arguments</title>
      <description>
        <![CDATA[After nearly nine years of appeals of his sixth trial, Curtis Flowers finally had his case argued before the U.S. Supreme Court. At issue was whether DA Doug Evans tried to keep African-Americans off the jury in the 2010 trial. Flowers wasn't at the Supreme Court -- he remains on death row in Mississippi -- but the In the Dark team was. This is what we saw.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[After nearly nine years of appeals of his sixth trial, Curtis Flowers finally had his case argued before the U.S. Supreme Court. At issue was whether DA Doug Evans tried to keep African-Americans off the jury in the 2010 trial. Flowers wasn't at the Supreme Court -- he remains on death row in Mississippi -- but the In the Dark team was. This is what we saw.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>13</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[After nearly nine years of appeals of his sixth trial, Curtis Flowers finally had his case argued before the U.S. Supreme Court. At issue was whether DA Doug Evans tried to keep African-Americans o...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[After nearly nine years of appeals of his sixth trial, Curtis Flowers finally had his case argued before the U.S. Supreme Court. At issue was whether DA Doug Evans tried to keep African-Americans off the jury in the 2010 trial. Flowers wasn't at the Supreme Court -- he remains on death row in Mississippi -- but the In the Dark team was. This is what we saw.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 26 Mar 2019 20:18:06 -0500</pubDate>
      <enclosure length="45219318" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2019/03/26/inthedarks02e13_128.mp3"/>
      <itunes:duration>00:47:06</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2019/03/26/inthedarks02e13_128.mp3</guid>
    </item>
    <item>
      <title>S2 E12: Before the Court</title>
      <description>
        <![CDATA[We resume Season Two with the U.S. Supreme Court weighing Curtis Flowers' case. We preview oral arguments and delve into the allegations at the heart of the appeal: that Doug Evans tried to keep African-Americans off the jury in Flowers' sixth trial.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[We resume Season Two with the U.S. Supreme Court weighing Curtis Flowers' case. We preview oral arguments and delve into the allegations at the heart of the appeal: that Doug Evans tried to keep African-Americans off the jury in Flowers' sixth trial.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>12</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[We resume Season Two with the U.S. Supreme Court weighing Curtis Flowers' case. We preview oral arguments and delve into the allegations at the heart of the appeal: that Doug Evans tried to keep Af...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[We resume Season Two with the U.S. Supreme Court weighing Curtis Flowers' case. We preview oral arguments and delve into the allegations at the heart of the appeal: that Doug Evans tried to keep African-Americans off the jury in Flowers' sixth trial.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 19 Mar 2019 00:00:00 -0500</pubDate>
      <enclosure length="39288026" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2019/03/19/inthedarks02e12_128.mp3"/>
      <itunes:duration>00:40:55</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2019/03/19/inthedarks02e12_128.mp3</guid>
    </item>
    <item>
      <title>Coming Soon: New Episodes of Season Two</title>
      <description>
        <![CDATA[Our second season spanned a year in Mississippi where we revealed misconduct, injustice and racial divide in the six trials of Curtis Flowers. The U.S. Supreme Court will now decide if the prosecutor racially discriminated in jury selection. In four new episodes starting March 19, we'll go into the courtroom for oral arguments, report the decision and examine the effect of the ruling.   <a href="https://contribute.publicradio.org/contribute.php?refId=ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[Our second season spanned a year in Mississippi where we revealed misconduct, injustice and racial divide in the six trials of Curtis Flowers. The U.S. Supreme Court will now decide if the prosecutor racially discriminated in jury selection. In four new episodes starting March 19, we'll go into the courtroom for oral arguments, report the decision and examine the effect of the ruling.   <a href="https://contribute.publicradio.org/contribute.php?refId=ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>trailer</itunes:episodeType>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[Our second season spanned a year in Mississippi where we revealed misconduct, injustice and racial divide in the six trials of Curtis Flowers. The U.S. Supreme Court will now decide if the prosecut...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[Our second season spanned a year in Mississippi where we revealed misconduct, injustice and racial divide in the six trials of Curtis Flowers. The U.S. Supreme Court will now decide if the prosecutor racially discriminated in jury selection. In four new episodes starting March 19, we'll go into the courtroom for oral arguments, report the decision and examine the effect of the ruling.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 19 Feb 2019 00:05:10 -0600</pubDate>
      <enclosure length="2177193" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2019/02/19/s2newepisodes_128.mp3"/>
      <itunes:duration>00:02:16</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2019/02/19/s2newepisodes_128.mp3</guid>
    </item>
    <item>
      <title>S2 Update: Q&amp;A + A Fire in Winona</title>
      <description>
        <![CDATA[We answer your questions and report on a fire in Winona.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[We answer your questions and report on a fire in Winona.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>bonus</itunes:episodeType>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[We answer your questions and report on a fire in Winona.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[We answer your questions and report on a fire in Winona.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 27 Nov 2018 00:00:00 -0600</pubDate>
      <enclosure length="61775888" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/11/27/s2updateqafire_128.mp3"/>
      <itunes:duration>01:04:20</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/11/27/s2updateqafire_128.mp3</guid>
    </item>
    <item>
      <title>S2 Update: SCOTUS Takes the Case</title>
      <description>
        <![CDATA[The U.S. Supreme Court has agreed to hear Curtis Flowers' appeal. Now the justices will examine if District Attorney Doug Evans had a history of racial discrimination in jury selection.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[The U.S. Supreme Court has agreed to hear Curtis Flowers' appeal. Now the justices will examine if District Attorney Doug Evans had a history of racial discrimination in jury selection.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>bonus</itunes:episodeType>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[The U.S. Supreme Court has agreed to hear Curtis Flowers' appeal. Now the justices will examine if District Attorney Doug Evans had a history of racial discrimination in jury selection.   Support i...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[The U.S. Supreme Court has agreed to hear Curtis Flowers' appeal. Now the justices will examine if District Attorney Doug Evans had a history of racial discrimination in jury selection.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Sat, 03 Nov 2018 00:00:00 -0500</pubDate>
      <enclosure length="9454698" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/11/03/inthedarks02updatescotus_128.mp3"/>
      <itunes:duration>00:09:50</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/11/03/inthedarks02updatescotus_128.mp3</guid>
    </item>
    <item>
      <title>S1 Update: The Wetterling File</title>
      <description>
        <![CDATA[In Season 1 of our podcast, we reported that the Jacob Wetterling case was a botched investigation. Just yesterday, law enforcement acknowledged it too.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[In Season 1 of our podcast, we reported that the Jacob Wetterling case was a botched investigation. Just yesterday, law enforcement acknowledged it too.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>bonus</itunes:episodeType>
      <itunes:season>1</itunes:season>
      <itunes:subtitle>
        <![CDATA[In Season 1 of our podcast, we reported that the Jacob Wetterling case was a botched investigation. Just yesterday, law enforcement acknowledged it too.   Support investigative journalism with a do...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[In Season 1 of our podcast, we reported that the Jacob Wetterling case was a botched investigation. Just yesterday, law enforcement acknowledged it too.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Fri, 21 Sep 2018 00:00:00 -0500</pubDate>
      <enclosure length="26972088" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/09/21/inthedarks01updatefile_128.mp3"/>
      <itunes:duration>00:28:05</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/09/21/inthedarks01updatefile_128.mp3</guid>
    </item>
    <item>
      <title>S2 Update: Back to Winona</title>
      <description>
        <![CDATA[Two months after the season ended, we return to Winona to see what has changed. Turns out, a lot. Curtis Flowers' mother has died. The whole town is talking about the case. Flowers' defense lawyers are including our findings in their legal filings to the Supreme Court. Citizens are trying to file bar complaints against the district attorney, Doug Evans. One man has gone into hiding, his personal safety threatened because he spoke to us. In this update episode, we look at what's happened in Winona since our last episode and what happens next with Curtis Flowers' case.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[Two months after the season ended, we return to Winona to see what has changed. Turns out, a lot. Curtis Flowers' mother has died. The whole town is talking about the case. Flowers' defense lawyers are including our findings in their legal filings to the Supreme Court. Citizens are trying to file bar complaints against the district attorney, Doug Evans. One man has gone into hiding, his personal safety threatened because he spoke to us. In this update episode, we look at what's happened in Winona since our last episode and what happens next with Curtis Flowers' case.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>bonus</itunes:episodeType>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[Two months after the season ended, we return to Winona to see what has changed. Turns out, a lot. Curtis Flowers' mother has died. The whole town is talking about the case. Flowers' defense lawyers...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[Two months after the season ended, we return to Winona to see what has changed. Turns out, a lot. Curtis Flowers' mother has died. The whole town is talking about the case. Flowers' defense lawyers are including our findings in their legal filings to the Supreme Court. Citizens are trying to file bar complaints against the district attorney, Doug Evans. One man has gone into hiding, his personal safety threatened because he spoke to us. In this update episode, we look at what's happened in Winona since our last episode and what happens next with Curtis Flowers' case.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 18 Sep 2018 00:00:00 -0500</pubDate>
      <enclosure length="32371169" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/09/18/inthedarks02update_128.mp3"/>
      <itunes:duration>00:33:43</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/09/18/inthedarks02update_128.mp3</guid>
    </item>
    <item>
      <title>S2 E11: The End</title>
      <description>
        <![CDATA[For the last episode of the season, we went to meet Jeffery Armstrong, who, a few years after Curtis Flowers first went to prison, found what might have been a key piece of evidence. What he found -- and where he found it -- offers hints that someone else may have committed the Tardy Furniture murders. Armstrong turned the evidence into the cops. And then, he says, it disappeared.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[For the last episode of the season, we went to meet Jeffery Armstrong, who, a few years after Curtis Flowers first went to prison, found what might have been a key piece of evidence. What he found -- and where he found it -- offers hints that someone else may have committed the Tardy Furniture murders. Armstrong turned the evidence into the cops. And then, he says, it disappeared.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>11</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[For the last episode of the season, we went to meet Jeffery Armstrong, who, a few years after Curtis Flowers first went to prison, found what might have been a key piece of evidence. What he found ...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[For the last episode of the season, we went to meet Jeffery Armstrong, who, a few years after Curtis Flowers first went to prison, found what might have been a key piece of evidence. What he found -- and where he found it -- offers hints that someone else may have committed the Tardy Furniture murders. Armstrong turned the evidence into the cops. And then, he says, it disappeared.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 03 Jul 2018 00:00:00 -0500</pubDate>
      <enclosure length="34806280" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/07/03/inthedarks02e11_128.mp3"/>
      <itunes:duration>00:36:15</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/07/03/inthedarks02e11_128.mp3</guid>
    </item>
    <item>
      <title>S2 E10: Discovery</title>
      <description>
        <![CDATA[Prosecutors have always said that Curtis Flowers was the only serious suspect in the Tardy Furniture investigation. But we found a document showing that another man, Willie James Hemphill, had also been questioned just days after the murders. Who was he? Why was he questioned? When we finally found Hemphill, living in Indianapolis, he had some very surprising things to say about the case.   <a href="https://contribute.publicradio.org/contribute.php?refId=ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[Prosecutors have always said that Curtis Flowers was the only serious suspect in the Tardy Furniture investigation. But we found a document showing that another man, Willie James Hemphill, had also been questioned just days after the murders. Who was he? Why was he questioned? When we finally found Hemphill, living in Indianapolis, he had some very surprising things to say about the case.   <a href="https://contribute.publicradio.org/contribute.php?refId=ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>10</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[Prosecutors have always said that Curtis Flowers was the only serious suspect in the Tardy Furniture investigation. But we found a document showing that another man, Willie James Hemphill, had also...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[Prosecutors have always said that Curtis Flowers was the only serious suspect in the Tardy Furniture investigation. But we found a document showing that another man, Willie James Hemphill, had also been questioned just days after the murders. Who was he? Why was he questioned? When we finally found Hemphill, living in Indianapolis, he had some very surprising things to say about the case.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 26 Jun 2018 00:00:00 -0500</pubDate>
      <enclosure length="61505074" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/06/26/inthedarks02e10_128.mp3"/>
      <itunes:duration>01:04:04</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/06/26/inthedarks02e10_128.mp3</guid>
    </item>
    <item>
      <title>S2 E9: Why Curtis?</title>
      <description>
        <![CDATA[After re-examining the case, we'd found no direct evidence linking Curtis Flowers to the murders at Tardy Furniture. But we had one lingering question: How did Flowers become the main suspect? Why would investigators focus so much on Flowers based on so little evidence? In short, why Curtis? We decided to find out.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[After re-examining the case, we'd found no direct evidence linking Curtis Flowers to the murders at Tardy Furniture. But we had one lingering question: How did Flowers become the main suspect? Why would investigators focus so much on Flowers based on so little evidence? In short, why Curtis? We decided to find out.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>9</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[After re-examining the case, we'd found no direct evidence linking Curtis Flowers to the murders at Tardy Furniture. But we had one lingering question: How did Flowers become the main suspect? Why ...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[After re-examining the case, we'd found no direct evidence linking Curtis Flowers to the murders at Tardy Furniture. But we had one lingering question: How did Flowers become the main suspect? Why would investigators focus so much on Flowers based on so little evidence? In short, why Curtis? We decided to find out.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 19 Jun 2018 00:00:00 -0500</pubDate>
      <enclosure length="54275305" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/06/19/inthedarks02e09_128.mp3"/>
      <itunes:duration>00:56:32</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/06/19/inthedarks02e09_128.mp3</guid>
    </item>
    <item>
      <title>S2 E8: The D.A.</title>
      <description>
        <![CDATA[After investigating every aspect of the Curtis Flowers case, we were nearly ready to present what we'd found to District Attorney Doug Evans. But first we tried to learn all we could about him: his childhood, his years as a police officer and his record as district attorney. Then, finally, we met the man who's spent more than two decades trying to have Flowers executed.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[After investigating every aspect of the Curtis Flowers case, we were nearly ready to present what we'd found to District Attorney Doug Evans. But first we tried to learn all we could about him: his childhood, his years as a police officer and his record as district attorney. Then, finally, we met the man who's spent more than two decades trying to have Flowers executed.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>8</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[After investigating every aspect of the Curtis Flowers case, we were nearly ready to present what we'd found to District Attorney Doug Evans. But first we tried to learn all we could about him: his...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[After investigating every aspect of the Curtis Flowers case, we were nearly ready to present what we'd found to District Attorney Doug Evans. But first we tried to learn all we could about him: his childhood, his years as a police officer and his record as district attorney. Then, finally, we met the man who's spent more than two decades trying to have Flowers executed.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 12 Jun 2018 00:00:00 -0500</pubDate>
      <enclosure length="59043374" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/06/12/inthedarks02e08_128.mp3"/>
      <itunes:duration>01:01:30</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/06/12/inthedarks02e08_128.mp3</guid>
    </item>
    <item>
      <title>S2 E7: The Trials of Curtis Flowers</title>
      <description>
        <![CDATA[There's one critical aspect of the Curtis Flowers case that we haven't looked at yet -- the makeup of the juries. Each of the four times Flowers was convicted, the jury was all white or nearly all white. So we decided to look more closely at why so few black jurors had been selected. And it wasn't always happenstance.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[There's one critical aspect of the Curtis Flowers case that we haven't looked at yet -- the makeup of the juries. Each of the four times Flowers was convicted, the jury was all white or nearly all white. So we decided to look more closely at why so few black jurors had been selected. And it wasn't always happenstance.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>7</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[There's one critical aspect of the Curtis Flowers case that we haven't looked at yet -- the makeup of the juries. Each of the four times Flowers was convicted, the jury was all white or nearly all ...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[There's one critical aspect of the Curtis Flowers case that we haven't looked at yet -- the makeup of the juries. Each of the four times Flowers was convicted, the jury was all white or nearly all white. So we decided to look more closely at why so few black jurors had been selected. And it wasn't always happenstance.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 05 Jun 2018 00:00:00 -0500</pubDate>
      <enclosure length="58698530" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/06/05/inthedarks02e07_128.mp3"/>
      <itunes:duration>01:01:08</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/06/05/inthedarks02e07_128.mp3</guid>
    </item>
    <item>
      <title>S2 E6: Punishment</title>
      <description>
        <![CDATA[Odell Hallmon, the state's key witness in the Curtis Flowers case, is serving three consecutive life sentences. We wondered what he might say now that there are no deals to cut, and he will spend the rest of his days in prison. Would he stick to his story that Flowers had confessed to the Tardy Furniture murders? We wrote him letters and sent him a friend request on Facebook. Weeks went by and we heard nothing. And then, one day, he wrote back.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[Odell Hallmon, the state's key witness in the Curtis Flowers case, is serving three consecutive life sentences. We wondered what he might say now that there are no deals to cut, and he will spend the rest of his days in prison. Would he stick to his story that Flowers had confessed to the Tardy Furniture murders? We wrote him letters and sent him a friend request on Facebook. Weeks went by and we heard nothing. And then, one day, he wrote back.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>6</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[Odell Hallmon, the state's key witness in the Curtis Flowers case, is serving three consecutive life sentences. We wondered what he might say now that there are no deals to cut, and he will spend t...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[Odell Hallmon, the state's key witness in the Curtis Flowers case, is serving three consecutive life sentences. We wondered what he might say now that there are no deals to cut, and he will spend the rest of his days in prison. Would he stick to his story that Flowers had confessed to the Tardy Furniture murders? We wrote him letters and sent him a friend request on Facebook. Weeks went by and we heard nothing. And then, one day, he wrote back.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 29 May 2018 00:00:00 -0500</pubDate>
      <enclosure length="42051597" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/05/29/inthedarks02e06_128.mp3"/>
      <itunes:duration>00:43:48</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/05/29/inthedarks02e06_128.mp3</guid>
    </item>
    <item>
      <title>S2 E5: Privilege</title>
      <description>
        <![CDATA[No witness has been more important to the prosecution's case against Curtis Flowers than Odell Hallmon. He testified in four trials that Flowers had confessed to him while the two men were in prison together. Hallmon has an astonishingly long criminal history that includes repeated charges for drug dealing, assault, and robbery. So how reliable is his testimony and did he receive anything in exchange for it? In this episode, we investigate the veracity of the prosecution's star witness.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[No witness has been more important to the prosecution's case against Curtis Flowers than Odell Hallmon. He testified in four trials that Flowers had confessed to him while the two men were in prison together. Hallmon has an astonishingly long criminal history that includes repeated charges for drug dealing, assault, and robbery. So how reliable is his testimony and did he receive anything in exchange for it? In this episode, we investigate the veracity of the prosecution's star witness.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>5</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[No witness has been more important to the prosecution's case against Curtis Flowers than Odell Hallmon. He testified in four trials that Flowers had confessed to him while the two men were in priso...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[No witness has been more important to the prosecution's case against Curtis Flowers than Odell Hallmon. He testified in four trials that Flowers had confessed to him while the two men were in prison together. Hallmon has an astonishingly long criminal history that includes repeated charges for drug dealing, assault, and robbery. So how reliable is his testimony and did he receive anything in exchange for it? In this episode, we investigate the veracity of the prosecution's star witness.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 22 May 2018 00:00:00 -0500</pubDate>
      <enclosure length="46307195" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/05/22/inthedarks02e05_128.mp3"/>
      <itunes:duration>00:48:14</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/05/22/inthedarks02e05_128.mp3</guid>
    </item>
    <item>
      <title>S2 E4: The Confessions</title>
      <description>
        <![CDATA[Over the years, three inmates have claimed that Curtis Flowers confessed to them that he killed four people at the Tardy Furniture store. But they've all changed their stories at one time or another. In this episode, we investigate who's really telling the truth.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[Over the years, three inmates have claimed that Curtis Flowers confessed to them that he killed four people at the Tardy Furniture store. But they've all changed their stories at one time or another. In this episode, we investigate who's really telling the truth.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>4</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[Over the years, three inmates have claimed that Curtis Flowers confessed to them that he killed four people at the Tardy Furniture store. But they've all changed their stories at one time or anothe...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[Over the years, three inmates have claimed that Curtis Flowers confessed to them that he killed four people at the Tardy Furniture store. But they've all changed their stories at one time or another. In this episode, we investigate who's really telling the truth.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 15 May 2018 00:00:00 -0500</pubDate>
      <enclosure length="50803194" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/05/15/inthedarks02e04_128.mp3"/>
      <itunes:duration>00:52:55</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/05/15/inthedarks02e04_128.mp3</guid>
    </item>
    <item>
      <title>S2 E3: The Gun</title>
      <description>
        <![CDATA[Investigators never found the gun used to kill four people at Tardy Furniture. Yet the gun, and the bullets matched to it, became a key piece of evidence against Curtis Flowers. In this episode, we examine the strange histories of the gun and the man who owned it.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[Investigators never found the gun used to kill four people at Tardy Furniture. Yet the gun, and the bullets matched to it, became a key piece of evidence against Curtis Flowers. In this episode, we examine the strange histories of the gun and the man who owned it.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>3</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[Investigators never found the gun used to kill four people at Tardy Furniture. Yet the gun, and the bullets matched to it, became a key piece of evidence against Curtis Flowers. In this episode, we...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[Investigators never found the gun used to kill four people at Tardy Furniture. Yet the gun, and the bullets matched to it, became a key piece of evidence against Curtis Flowers. In this episode, we examine the strange histories of the gun and the man who owned it.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 08 May 2018 00:00:00 -0500</pubDate>
      <enclosure length="45171239" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/05/08/inthedarks02e03_128.mp3"/>
      <itunes:duration>00:47:03</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/05/08/inthedarks02e03_128.mp3</guid>
    </item>
    <item>
      <title>S2 E2: The Route</title>
      <description>
        <![CDATA[The case against Curtis Flowers relies heavily on three threads of evidence: the route he allegedly walked the morning of the murders, the gun that investigators believe he used, and the people he supposedly confessed to in jail. In this episode, we meet the witnesses who said they saw Flowers walking through downtown Winona, Mississippi, the morning of the murders. Some of their stories now waver on key details.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[The case against Curtis Flowers relies heavily on three threads of evidence: the route he allegedly walked the morning of the murders, the gun that investigators believe he used, and the people he supposedly confessed to in jail. In this episode, we meet the witnesses who said they saw Flowers walking through downtown Winona, Mississippi, the morning of the murders. Some of their stories now waver on key details.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>2</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[The case against Curtis Flowers relies heavily on three threads of evidence: the route he allegedly walked the morning of the murders, the gun that investigators believe he used, and the people he ...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[The case against Curtis Flowers relies heavily on three threads of evidence: the route he allegedly walked the morning of the murders, the gun that investigators believe he used, and the people he supposedly confessed to in jail. In this episode, we meet the witnesses who said they saw Flowers walking through downtown Winona, Mississippi, the morning of the murders. Some of their stories now waver on key details.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 01 May 2018 02:00:00 -0500</pubDate>
      <enclosure length="50547524" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/05/01/inthedarks02e02_128.mp3"/>
      <itunes:duration>00:52:39</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/05/01/inthedarks02e02_128.mp3</guid>
    </item>
    <item>
      <title>S2 E1: July 16, 1996</title>
      <description>
        <![CDATA[On the morning of July 16, 1996, someone walked into a furniture store in downtown Winona, Mississippi, and murdered four employees. Each was shot in the head. It was perhaps the most shocking crime the small town had ever seen. Investigators charged a man named Curtis Flowers with the murders. What followed was a two-decade legal odyssey in which Flowers was tried six times for the same crime. He remains on death row, though some people believe he's innocent. For the second season of In the Dark, we spent a year digging into the Flowers case. We found a town divided by race and a murder conviction supported by questionable evidence. And it all began that summer morning in 1996 with a horrifying crime scene that left investigators puzzled.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[On the morning of July 16, 1996, someone walked into a furniture store in downtown Winona, Mississippi, and murdered four employees. Each was shot in the head. It was perhaps the most shocking crime the small town had ever seen. Investigators charged a man named Curtis Flowers with the murders. What followed was a two-decade legal odyssey in which Flowers was tried six times for the same crime. He remains on death row, though some people believe he's innocent. For the second season of In the Dark, we spent a year digging into the Flowers case. We found a town divided by race and a murder conviction supported by questionable evidence. And it all began that summer morning in 1996 with a horrifying crime scene that left investigators puzzled.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>1</itunes:episode>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[On the morning of July 16, 1996, someone walked into a furniture store in downtown Winona, Mississippi, and murdered four employees. Each was shot in the head. It was perhaps the most shocking crim...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[On the morning of July 16, 1996, someone walked into a furniture store in downtown Winona, Mississippi, and murdered four employees. Each was shot in the head. It was perhaps the most shocking crime the small town had ever seen. Investigators charged a man named Curtis Flowers with the murders. What followed was a two-decade legal odyssey in which Flowers was tried six times for the same crime. He remains on death row, though some people believe he's innocent. For the second season of In the Dark, we spent a year digging into the Flowers case. We found a town divided by race and a murder conviction supported by questionable evidence. And it all began that summer morning in 1996 with a horrifying crime scene that left investigators puzzled.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 01 May 2018 01:00:00 -0500</pubDate>
      <enclosure length="40675334" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/05/01/inthedarks02e01_128.mp3"/>
      <itunes:duration>00:42:22</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/05/01/inthedarks02e01_128.mp3</guid>
    </item>
    <item>
      <title>Season Two: The Trailer</title>
      <description>
        <![CDATA[Curtis Flowers has been tried six times for the same crime. For 21 years, Flowers has maintained his innocence. He's won appeal after appeal, but every time, the prosecutor just tries the case again. What does the evidence reveal? And how can the justice system ignore the prosecutor's record and keep Flowers on death row?   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[Curtis Flowers has been tried six times for the same crime. For 21 years, Flowers has maintained his innocence. He's won appeal after appeal, but every time, the prosecutor just tries the case again. What does the evidence reveal? And how can the justice system ignore the prosecutor's record and keep Flowers on death row?   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>trailer</itunes:episodeType>
      <itunes:season>2</itunes:season>
      <itunes:subtitle>
        <![CDATA[Curtis Flowers has been tried six times for the same crime. For 21 years, Flowers has maintained his innocence. He's won appeal after appeal, but every time, the prosecutor just tries the case agai...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[Curtis Flowers has been tried six times for the same crime. For 21 years, Flowers has maintained his innocence. He's won appeal after appeal, but every time, the prosecutor just tries the case again. What does the evidence reveal? And how can the justice system ignore the prosecutor's record and keep Flowers on death row?   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Mon, 16 Apr 2018 00:00:00 -0500</pubDate>
      <enclosure length="2224840" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2018/04/16/season2trailer_128.mp3"/>
      <itunes:duration>00:02:19</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2018/04/16/season2trailer_128.mp3</guid>
    </item>
    <item>
      <title>S1 Update: A Sentencing, A Demand, No Closure</title>
      <description>
        <![CDATA[The sentencing of Danny Heinrich on Nov. 21, 2016, brought to a close the 27-year investigation into the abduction and murder of Jacob Wetterling. But it didn't end the story.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[The sentencing of Danny Heinrich on Nov. 21, 2016, brought to a close the 27-year investigation into the abduction and murder of Jacob Wetterling. But it didn't end the story.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>bonus</itunes:episodeType>
      <itunes:season>1</itunes:season>
      <itunes:subtitle>
        <![CDATA[The sentencing of Danny Heinrich on Nov. 21, 2016, brought to a close the 27-year investigation into the abduction and murder of Jacob Wetterling. But it didn't end the story.   Support investigati...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[The sentencing of Danny Heinrich on Nov. 21, 2016, brought to a close the 27-year investigation into the abduction and murder of Jacob Wetterling. But it didn't end the story.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Fri, 02 Dec 2016 00:00:00 -0600</pubDate>
      <enclosure length="35143748" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2016/12/02/inthedarkupdate_128.mp3"/>
      <itunes:duration>00:36:36</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2016/12/02/inthedarkupdate_128.mp3</guid>
    </item>
    <item>
      <title>S1 E9: The Truth</title>
      <description>
        <![CDATA[When Danny Heinrich confessed in court on Sept. 6 to abducting and murdering Jacob Wetterling and assaulting Jared Scheierl 27 years ago, investigators declared that at last, the public had the truth. But despite Heinrich's excruciatingly detailed accounts, the truth remains elusive. Many questions remain unanswered.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[When Danny Heinrich confessed in court on Sept. 6 to abducting and murdering Jacob Wetterling and assaulting Jared Scheierl 27 years ago, investigators declared that at last, the public had the truth. But despite Heinrich's excruciatingly detailed accounts, the truth remains elusive. Many questions remain unanswered.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>9</itunes:episode>
      <itunes:season>1</itunes:season>
      <itunes:subtitle>
        <![CDATA[When Danny Heinrich confessed in court on Sept. 6 to abducting and murdering Jacob Wetterling and assaulting Jared Scheierl 27 years ago, investigators declared that at last, the public had the tru...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[When Danny Heinrich confessed in court on Sept. 6 to abducting and murdering Jacob Wetterling and assaulting Jared Scheierl 27 years ago, investigators declared that at last, the public had the truth. But despite Heinrich's excruciatingly detailed accounts, the truth remains elusive. Many questions remain unanswered.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 25 Oct 2016 00:00:00 -0500</pubDate>
      <enclosure length="40328285" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2016/10/25/inthedark9_128.mp3"/>
      <itunes:duration>00:42:00</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2016/10/25/inthedark9_128.mp3</guid>
    </item>
    <item>
      <title>S1 E8: What's Going on Down There?</title>
      <description>
        <![CDATA[In November 2012, a police officer named Tom Decker was shot and killed in Cold Spring, Minn., after getting out of his car to check on a man who lived above a bar. The man was quickly arrested and held in the Stearns County jail. He was interrogated but then released without charges. The state crime bureau later ruled him out as a suspect. Investigators turned their focus to another man, Eric Thomes, who hanged himself before he could be charged with the crime. Nearly four years after the murder, Sheriff John Sanner has refused to close the case "because we're still hopeful that new information will come in," he said.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[In November 2012, a police officer named Tom Decker was shot and killed in Cold Spring, Minn., after getting out of his car to check on a man who lived above a bar. The man was quickly arrested and held in the Stearns County jail. He was interrogated but then released without charges. The state crime bureau later ruled him out as a suspect. Investigators turned their focus to another man, Eric Thomes, who hanged himself before he could be charged with the crime. Nearly four years after the murder, Sheriff John Sanner has refused to close the case "because we're still hopeful that new information will come in," he said.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>8</itunes:episode>
      <itunes:season>1</itunes:season>
      <itunes:subtitle>
        <![CDATA[In November 2012, a police officer named Tom Decker was shot and killed in Cold Spring, Minn., after getting out of his car to check on a man who lived above a bar. The man was quickly arrested and...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[In November 2012, a police officer named Tom Decker was shot and killed in Cold Spring, Minn., after getting out of his car to check on a man who lived above a bar. The man was quickly arrested and held in the Stearns County jail. He was interrogated but then released without charges. The state crime bureau later ruled him out as a suspect. Investigators turned their focus to another man, Eric Thomes, who hanged himself before he could be charged with the crime. Nearly four years after the murder, Sheriff John Sanner has refused to close the case "because we're still hopeful that new information will come in," he said.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 18 Oct 2016 00:00:00 -0500</pubDate>
      <enclosure length="44265376" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2016/10/18/inthedark8_128.mp3"/>
      <itunes:duration>00:46:06</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2016/10/18/inthedark8_128.mp3</guid>
    </item>
    <item>
      <title>S1 E7: This Quiet Place</title>
      <description>
        <![CDATA[Soon after the abduction and murder of Jacob Wetterling in 1989, Stearns County sheriff's investigators came face to face with his killer, Danny Heinrich, who would confess to the crime 27 years later. Then they let him go. It wasn't the first time that had happened in Stearns County.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[Soon after the abduction and murder of Jacob Wetterling in 1989, Stearns County sheriff's investigators came face to face with his killer, Danny Heinrich, who would confess to the crime 27 years later. Then they let him go. It wasn't the first time that had happened in Stearns County.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>7</itunes:episode>
      <itunes:season>1</itunes:season>
      <itunes:subtitle>
        <![CDATA[Soon after the abduction and murder of Jacob Wetterling in 1989, Stearns County sheriff's investigators came face to face with his killer, Danny Heinrich, who would confess to the crime 27 years la...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[Soon after the abduction and murder of Jacob Wetterling in 1989, Stearns County sheriff's investigators came face to face with his killer, Danny Heinrich, who would confess to the crime 27 years later. Then they let him go. It wasn't the first time that had happened in Stearns County.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 11 Oct 2016 00:00:00 -0500</pubDate>
      <enclosure length="38950517" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2016/10/11/inthedark7_128.mp3"/>
      <itunes:duration>00:40:34</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2016/10/11/inthedark7_128.mp3</guid>
    </item>
    <item>
      <title>S1 E6: Stranger Danger</title>
      <description>
        <![CDATA[In the 1970s and early '80s, missing children weren't considered a policing priority. You couldn't even enter missing child information into the FBI's national crime database. But that changed quickly.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[In the 1970s and early '80s, missing children weren't considered a policing priority. You couldn't even enter missing child information into the FBI's national crime database. But that changed quickly.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>6</itunes:episode>
      <itunes:season>1</itunes:season>
      <itunes:subtitle>
        <![CDATA[In the 1970s and early '80s, missing children weren't considered a policing priority. You couldn't even enter missing child information into the FBI's national crime database. But that changed quic...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[In the 1970s and early '80s, missing children weren't considered a policing priority. You couldn't even enter missing child information into the FBI's national crime database. But that changed quickly.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 04 Oct 2016 00:00:00 -0500</pubDate>
      <enclosure length="35325342" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2016/10/04/inthedark6_128.mp3"/>
      <itunes:duration>00:36:47</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2016/10/04/inthedark6_128.mp3</guid>
    </item>
    <item>
      <title>S1 E5: Person of Interest</title>
      <description>
        <![CDATA[Dan Rassier now wishes he'd insisted that police search his family's St. Joseph farm top to bottom the night Jacob Wetterling was abducted. That way, they would have known there was nothing to find. And it would have been harder for them to come back 21 years later to search with backhoes and declare him a "person of interest" in the case.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[Dan Rassier now wishes he'd insisted that police search his family's St. Joseph farm top to bottom the night Jacob Wetterling was abducted. That way, they would have known there was nothing to find. And it would have been harder for them to come back 21 years later to search with backhoes and declare him a "person of interest" in the case.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>5</itunes:episode>
      <itunes:season>1</itunes:season>
      <itunes:subtitle>
        <![CDATA[Dan Rassier now wishes he'd insisted that police search his family's St. Joseph farm top to bottom the night Jacob Wetterling was abducted. That way, they would have known there was nothing to find...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[Dan Rassier now wishes he'd insisted that police search his family's St. Joseph farm top to bottom the night Jacob Wetterling was abducted. That way, they would have known there was nothing to find. And it would have been harder for them to come back 21 years later to search with backhoes and declare him a "person of interest" in the case.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 27 Sep 2016 00:00:00 -0500</pubDate>
      <enclosure length="45606448" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2016/09/27/inthedark5_128.mp3"/>
      <itunes:duration>00:47:30</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2016/09/27/inthedark5_128.mp3</guid>
    </item>
    <item>
      <title>S1 E4: The Circus</title>
      <description>
        <![CDATA[The Wetterling abduction story kept getting bigger as the case served as a conduit for public fear and grief. Capitalizing on a growing sense that pedophiles lurked in every shadow, the likes of Maury Povich and Geraldo Rivera joined the cause with sensational retellings of the crime and its consequences.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[The Wetterling abduction story kept getting bigger as the case served as a conduit for public fear and grief. Capitalizing on a growing sense that pedophiles lurked in every shadow, the likes of Maury Povich and Geraldo Rivera joined the cause with sensational retellings of the crime and its consequences.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>4</itunes:episode>
      <itunes:season>1</itunes:season>
      <itunes:subtitle>
        <![CDATA[The Wetterling abduction story kept getting bigger as the case served as a conduit for public fear and grief. Capitalizing on a growing sense that pedophiles lurked in every shadow, the likes of Ma...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[The Wetterling abduction story kept getting bigger as the case served as a conduit for public fear and grief. Capitalizing on a growing sense that pedophiles lurked in every shadow, the likes of Maury Povich and Geraldo Rivera joined the cause with sensational retellings of the crime and its consequences.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 20 Sep 2016 00:00:00 -0500</pubDate>
      <enclosure length="35111198" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2016/09/20/inthedark4_128.mp3"/>
      <itunes:duration>00:36:34</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2016/09/20/inthedark4_128.mp3</guid>
    </item>
    <item>
      <title>S1 E3: The One Who Got Away</title>
      <description>
        <![CDATA[The closest you can get to a conversation with Jacob Wetterling about his abduction is to talk to Jared Scheierl. Scheierl was walking home from an ice skating rink in Cold Spring in January 1989 when a man who turned out to be Danny Heinrich forced him into a car, assaulted him, and let him go, uttering some chilling parting words: "If they come close to finding out who I am, I'll find you and kill you." That was nine months before Jacob's abduction.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[The closest you can get to a conversation with Jacob Wetterling about his abduction is to talk to Jared Scheierl. Scheierl was walking home from an ice skating rink in Cold Spring in January 1989 when a man who turned out to be Danny Heinrich forced him into a car, assaulted him, and let him go, uttering some chilling parting words: "If they come close to finding out who I am, I'll find you and kill you." That was nine months before Jacob's abduction.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>3</itunes:episode>
      <itunes:season>1</itunes:season>
      <itunes:subtitle>
        <![CDATA[The closest you can get to a conversation with Jacob Wetterling about his abduction is to talk to Jared Scheierl. Scheierl was walking home from an ice skating rink in Cold Spring in January 1989 w...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[The closest you can get to a conversation with Jacob Wetterling about his abduction is to talk to Jared Scheierl. Scheierl was walking home from an ice skating rink in Cold Spring in January 1989 when a man who turned out to be Danny Heinrich forced him into a car, assaulted him, and let him go, uttering some chilling parting words: "If they come close to finding out who I am, I'll find you and kill you." That was nine months before Jacob's abduction.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Tue, 13 Sep 2016 00:00:00 -0500</pubDate>
      <enclosure length="43031890" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2016/09/13/inthedark3_128.mp3"/>
      <itunes:duration>00:44:49</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2016/09/13/inthedark3_128.mp3</guid>
    </item>
    <item>
      <title>S1 E2: The Circle</title>
      <description>
        <![CDATA[When Jacob Wetterling was taken, authorities launched what would turn into one of the largest searches for any missing person in the history of the United States. But that first night, law enforcement didn't cover all the basics.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[When Jacob Wetterling was taken, authorities launched what would turn into one of the largest searches for any missing person in the history of the United States. But that first night, law enforcement didn't cover all the basics.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>2</itunes:episode>
      <itunes:season>1</itunes:season>
      <itunes:subtitle>
        <![CDATA[When Jacob Wetterling was taken, authorities launched what would turn into one of the largest searches for any missing person in the history of the United States. But that first night, law enforcem...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[When Jacob Wetterling was taken, authorities launched what would turn into one of the largest searches for any missing person in the history of the United States. But that first night, law enforcement didn't cover all the basics.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Wed, 07 Sep 2016 02:00:00 -0500</pubDate>
      <enclosure length="36958925" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2016/09/07/inthedark2_128.mp3"/>
      <itunes:duration>00:38:29</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2016/09/07/inthedark2_128.mp3</guid>
    </item>
    <item>
      <title>S1 E1: The Crime</title>
      <description>
        <![CDATA[The abduction of Jacob Wetterling, which made parents more vigilant and led to the first national requirement that states track sex offenders via registries, took place before moonrise on a warm October night in 1989.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[The abduction of Jacob Wetterling, which made parents more vigilant and led to the first national requirement that states track sex offenders via registries, took place before moonrise on a warm October night in 1989.   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>full</itunes:episodeType>
      <itunes:episode>1</itunes:episode>
      <itunes:season>1</itunes:season>
      <itunes:subtitle>
        <![CDATA[The abduction of Jacob Wetterling, which made parents more vigilant and led to the first national requirement that states track sex offenders via registries, took place before moonrise on a warm Oc...]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[The abduction of Jacob Wetterling, which made parents more vigilant and led to the first national requirement that states track sex offenders via registries, took place before moonrise on a warm October night in 1989.   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Wed, 07 Sep 2016 01:00:00 -0500</pubDate>
      <enclosure length="33382927" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2016/09/07/inthedark1_128.mp3"/>
      <itunes:duration>00:34:46</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2016/09/07/inthedark1_128.mp3</guid>
    </item>
    <item>
      <title>Season One: The Trailer</title>
      <description>
        <![CDATA[After he disappeared nearly 27 years ago, Jacob Wetterling's remains have been found. Why did it take so long?   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </description>
      <content:encoded>
        <![CDATA[After he disappeared nearly 27 years ago, Jacob Wetterling's remains have been found. Why did it take so long?   <a href="https://support.americanpublicmedia.org/ITD_PodcastFeed">Support investigative journalism with a donation to In the Dark</a>.]]>
      </content:encoded>
      <itunes:episodeType>trailer</itunes:episodeType>
      <itunes:season>1</itunes:season>
      <itunes:subtitle>
        <![CDATA[After he disappeared nearly 27 years ago, Jacob Wetterling's remains have been found. Why did it take so long?   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:subtitle>
      <itunes:summary>
        <![CDATA[After he disappeared nearly 27 years ago, Jacob Wetterling's remains have been found. Why did it take so long?   Support investigative journalism with a donation to In the Dark.]]>
      </itunes:summary>
      <itunes:author>APM Reports</itunes:author>
      <pubDate>Mon, 29 Aug 2016 00:00:00 -0500</pubDate>
      <enclosure length="3481116" type="audio/mpeg" url="https://play.podtrac.com/APM-InTheDark/play.publicradio.org/itunes/d/podcast/apmreports/in-the-dark/2016/08/29/inthedark0_128.mp3"/>
      <itunes:duration>00:03:37</itunes:duration>
      <guid isPermaLink="false">/apmreports/in-the-dark/2016/08/29/inthedark0_128.mp3</guid>
    </item>
  </channel>
</rss>
''';

// http://feeds.twit.tv/twit.xml
final twit_feed = '''
<?xml version="1.0" encoding="utf-8" ?>
<rss xmlns:atom="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:creativeCommons="http://backend.userland.com/creativeCommonsRssModule" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/" version="2.0">
	<channel>
		<title>This Week in Tech (MP3)</title>
		<link>https://twit.tv/shows/this-week-in-tech</link>
		<generator>TWiT Feed Generator v3.6.11</generator>
		<docs>http://blogs.law.harvard.edu/tech/rss</docs>
		<language>en-US</language>
		<copyright>This work is licensed under a Creative Commons License - Attribution-NonCommercial-NoDerivatives 4.0 International - http://creativecommons.org/licenses/by-nc-nd/4.0/</copyright>
		<creativeCommons:license>http://creativecommons.org/licenses/by-nc-nd/4.0/</creativeCommons:license>
		<managingEditor>distro@twit.tv (TWiT Editors)</managingEditor>
		<webMaster>distro@twit.tv (TWiT Engineering)</webMaster>
		<ttl>720</ttl>
		<sy:updatePeriod>weekly</sy:updatePeriod>
		<sy:updateFrequency>1</sy:updateFrequency>
		<lastBuildDate>Sun, 19 Jan 2020 21:15:47 PST</lastBuildDate>
		<pubDate>Sun, 19 Jan 2020 21:15:47 PST</pubDate>
		<itunes:type>episodic</itunes:type>
		<itunes:author>TWiT</itunes:author>
		<itunes:subtitle>Your first podcast of the week is the last word in tech. </itunes:subtitle>
		<itunes:summary>Your first podcast of the week is the last word in tech. Join the top tech pundits in a roundtable discussion of the latest trends in high tech.

Records live every Sunday at 5:15pm Eastern / 2:15pm Pacific / 22:15 UTC.</itunes:summary>
		<description>Your first podcast of the week is the last word in tech. Join the top tech pundits in a roundtable discussion of the latest trends in high tech.

Records live every Sunday at 5:15pm Eastern / 2:15pm Pacific / 22:15 UTC.</description>
<itunes:keywords>TWiT, Technology, Leo Laporte, TechTV, This Week in Technology</itunes:keywords>
	<itunes:explicit>false</itunes:explicit>
	<itunes:block>no</itunes:block>
	<itunes:owner>
		<itunes:name>Leo Laporte</itunes:name>
		<itunes:email>distro@twit.tv</itunes:email>
	</itunes:owner>
		<itunes:category text="News">
			<itunes:category text="Tech News"/>
</itunes:category>
		<itunes:category text="Technology" />
	<image>
		<title>This Week in Tech (Audio)</title>
		<url>https://elroy.twit.tv/sites/default/files/styles/twit_album_art_144x144/public/images/shows/this_week_in_tech/album_art/audio/twit1400audio.jpg?itok=XgGJoyWt</url>
		<link>https://twit.tv/shows/this-week-in-tech</link>
		<width>144</width>
		<height>144</height>
	</image>
	<itunes:image href="https://elroy.twit.tv/sites/default/files/styles/twit_album_art_2048x2048/public/images/shows/this_week_in_tech/album_art/audio/twit1400audio.jpg?itok=J0vhatZb" />
	<atom:link href="http://feeds.twit.tv/twit.xml" type="application/rss+xml" rel="self"/>
		<item>
			<title>TWiT 754: I Dream of Wiki</title>
			<itunes:title>I Dream of Wiki</itunes:title>
			<itunes:episodeType>full</itunes:episodeType>
			<pubDate>Sun, 19 Jan 2020 17:12:42 PST</pubDate>
			<itunes:episode>754</itunes:episode>
			<link>https://twit.tv/shows/this-week-in-tech/episodes/754</link>
			<comments>https://twit.tv/shows/this-week-in-tech/episodes/754</comments>
			<itunes:author>TWiT</itunes:author>
			<category>Tech News</category>
			<itunes:explicit>clean</itunes:explicit>
			<itunes:subtitle>FBI vs Apple, Google vs Cookies, Biden vs CDA 230</itunes:subtitle>
			<itunes:keywords>TWiT, this week in tech, Leo Laporte, patrick norton, Sam Abuelsamid, Georgia Dow, Mojo vision, clearview, FBI, Barr, trump, Apple, iPhone, Pensacola, Biden, CDA, section 230, Google, privacy, cookies, verizon, One Search, Cable Haunt, NOBUS, EU</itunes:keywords>
			<description>
<![CDATA[
<p><img src="https://elroy.twit.tv/sites/default/files/styles/twit_album_art_2048x2048/public/images/shows/this_week_in_tech/album_art/audio/twit1400audio.jpg?itok=J0vhatZb" align="right" hspace="20" vspace="20" border="0" width="300" height="300" title="This Week in Tech (Audio)" alt="This Week in Tech (Audio)"/></p><p>This Week's Stories:</p><ul><li> Mojo Vision: Augmented Reality contact lenses</li><li> The face recognition company that will end privacy</li><li> FBI vs Apple 2: Pensacola Boogaloo</li><li> NOBUS: why the NSA's "NObody But US" theory of exploits fail</li><li> Cable Haunt: critical vulnerability in many cable modems</li><li> Apple and Google are cracking down on location privacy, and ad tech companies are unhappy</li><li> Don't worry about your kids' phone use so much</li><li> Google will kill 3rd-party cookies by 2022</li><li> Verizon's "private" search engine</li><li> The EU is not asking Apple to kill the lightning plug</li><li> Our secret shame: the box of cords in our garage</li><li> Digital hoarding: iTunes vs Gmail</li><li> Amazon wants you to pay with a wave of your hand</li><li> Sim swapping attacks: hacking customer service</li><li> Joe Biden wants to repeal Section 230. This is dangerous.</li><li> Sonos, Tile, and Pop Sockets testify against Google, Apple, and Amazon in Congress</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/Georgia_Dow" target="_blank">Georgia Dow</a>, <a href="https://twit.tv/people/sam-abuelsamid">Sam Abuelsamid</a>, and <a href="https://twit.tv/people/patrick-norton">Patrick Norton</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://capterra.com/twit">capterra.com/twit</a></li>
<li><a href="http://expressvpn.com/twit">expressvpn.com/twit</a></li>
<li><a href="http://WWT.COM/TWIT">WWT.COM/TWIT</a></li>
<li><a href="http://itpro.tv/twit">itpro.tv/twit  promo code TWIT30</a></li>
</ul></p>
]]>
			</description>
			<itunes:summary><![CDATA[
<p>This Week's Stories:</p><ul><li> Mojo Vision: Augmented Reality contact lenses</li><li> The face recognition company that will end privacy</li><li> FBI vs Apple 2: Pensacola Boogaloo</li><li> NOBUS: why the NSA's "NObody But US" theory of exploits fail</li><li> Cable Haunt: critical vulnerability in many cable modems</li><li> Apple and Google are cracking down on location privacy, and ad tech companies are unhappy</li><li> Don't worry about your kids' phone use so much</li><li> Google will kill 3rd-party cookies by 2022</li><li> Verizon's "private" search engine</li><li> The EU is not asking Apple to kill the lightning plug</li><li> Our secret shame: the box of cords in our garage</li><li> Digital hoarding: iTunes vs Gmail</li><li> Amazon wants you to pay with a wave of your hand</li><li> Sim swapping attacks: hacking customer service</li><li> Joe Biden wants to repeal Section 230. This is dangerous.</li><li> Sonos, Tile, and Pop Sockets testify against Google, Apple, and Amazon in Congress</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/Georgia_Dow" target="_blank">Georgia Dow</a>, <a href="https://twit.tv/people/sam-abuelsamid">Sam Abuelsamid</a>, and <a href="https://twit.tv/people/patrick-norton">Patrick Norton</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://capterra.com/twit">capterra.com/twit</a></li>
<li><a href="http://expressvpn.com/twit">expressvpn.com/twit</a></li>
<li><a href="http://WWT.COM/TWIT">WWT.COM/TWIT</a></li>
<li><a href="http://itpro.tv/twit">itpro.tv/twit  promo code TWIT30</a></li>
</ul></p>
]]></itunes:summary>
			<content:encoded><![CDATA[
<p>This Week's Stories:</p><ul><li> Mojo Vision: Augmented Reality contact lenses</li><li> The face recognition company that will end privacy</li><li> FBI vs Apple 2: Pensacola Boogaloo</li><li> NOBUS: why the NSA's "NObody But US" theory of exploits fail</li><li> Cable Haunt: critical vulnerability in many cable modems</li><li> Apple and Google are cracking down on location privacy, and ad tech companies are unhappy</li><li> Don't worry about your kids' phone use so much</li><li> Google will kill 3rd-party cookies by 2022</li><li> Verizon's "private" search engine</li><li> The EU is not asking Apple to kill the lightning plug</li><li> Our secret shame: the box of cords in our garage</li><li> Digital hoarding: iTunes vs Gmail</li><li> Amazon wants you to pay with a wave of your hand</li><li> Sim swapping attacks: hacking customer service</li><li> Joe Biden wants to repeal Section 230. This is dangerous.</li><li> Sonos, Tile, and Pop Sockets testify against Google, Apple, and Amazon in Congress</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/Georgia_Dow" target="_blank">Georgia Dow</a>, <a href="https://twit.tv/people/sam-abuelsamid">Sam Abuelsamid</a>, and <a href="https://twit.tv/people/patrick-norton">Patrick Norton</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://capterra.com/twit">capterra.com/twit</a></li>
<li><a href="http://expressvpn.com/twit">expressvpn.com/twit</a></li>
<li><a href="http://WWT.COM/TWIT">WWT.COM/TWIT</a></li>
<li><a href="http://itpro.tv/twit">itpro.tv/twit  promo code TWIT30</a></li>
</ul></p>
]]></content:encoded>
				<itunes:image href="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_600x450/public/images/episodes/812589/hero/edit.00_24_34_37.still004.jpg?itok=8fQqOTN7"/>
			<guid isPermaLink="false">https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0754/twit0754.mp3</guid>
			<itunes:duration>2:13:55</itunes:duration>
			<enclosure url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0754/twit0754.mp3" length="64417208" type="audio/mpeg"/>
			<media:content url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0754/twit0754.mp3" fileSize="64417208" type="audio/mpeg" medium="audio">
				<media:title type="plain">TWiT 754: I Dream of Wiki</media:title>
				<media:description type="plain">FBI vs Apple, Google vs Cookies, Biden vs CDA 230</media:description>
				<media:keywords>TWiT, this week in tech, Leo Laporte, patrick norton, Sam Abuelsamid, Georgia Dow, Mojo vision, clearview, FBI, Barr, trump, Apple, iPhone, Pensacola, Biden, CDA, section 230, Google, privacy, cookies, verizon, One Search, Cable Haunt, NOBUS, EU</media:keywords>
				<media:thumbnail url="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_400x300/public/images/episodes/812589/hero/edit.00_24_34_37.still004.jpg?itok=gx5XcJEo" width="400" height="225" />
				<media:rating scheme="urn:simple">nonadult</media:rating>
				<media:rating scheme="urn:v-chip">tv-g</media:rating>
				<media:category scheme="urn:iab:categories" label="Technology &amp; Computing">IAB19</media:category>		<media:credit role="anchor person">Leo Laporte</media:credit>
		<media:credit role="reporter">Georgia Dow</media:credit>
		<media:credit role="reporter">Sam Abuelsamid</media:credit>
		<media:credit role="reporter">Patrick Norton</media:credit>
			</media:content>
		</item>
		<item>
			<title>TWiT 753: I Got Waylaid in Switzerland</title>
			<itunes:title>I Got Waylaid in Switzerland</itunes:title>
			<itunes:episodeType>full</itunes:episodeType>
			<pubDate>Sun, 12 Jan 2020 13:54:12 PST</pubDate>
			<itunes:episode>753</itunes:episode>
			<link>https://twit.tv/shows/this-week-in-tech/episodes/753</link>
			<comments>https://twit.tv/shows/this-week-in-tech/episodes/753</comments>
			<itunes:author>TWiT</itunes:author>
			<category>Tech News</category>
			<itunes:explicit>clean</itunes:explicit>
			<itunes:subtitle>The Best Tech from CES 2020</itunes:subtitle>
			<itunes:keywords>TWiT, this week in tech, Leo Laporte, Padre, Father Robert Ballecer, Ant Pruitt, jason hiner, CES, ces 2020, Best of CES, sex tech, Apple, amazon, Charmin rollbot, samsung 8k tv, eRosary</itunes:keywords>
			<description>
<![CDATA[
<p><img src="https://elroy.twit.tv/sites/default/files/styles/twit_album_art_2048x2048/public/images/shows/this_week_in_tech/album_art/audio/twit1400audio.jpg?itok=J0vhatZb" align="right" hspace="20" vspace="20" border="0" width="300" height="300" title="This Week in Tech (Audio)" alt="This Week in Tech (Audio)"/></p><p>CES 2020 wrap-up</p><ul><li> Sex tech at CES 2020</li><li> Apple, Amazon, and others talk privacy at CES 2020</li><li> Tech Giants at CES 2020</li><li> The Sands: all the weirdest stuff at CES 2020</li><li> The best TVs at CES 2020</li><li> Future Concepts at CES 2020</li><li> The Charmin Rollbot</li><li> Biggest CES 2020 trends: vegetable-based meat, driverless cars, and bendable computers</li><li> Our favorite gadgets from CES 2020: from 8k TVs to electronic rosaries</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twit.tv/people/ant-pruitt">Ant Pruitt</a>, <a href="https://twit.tv/people/fr-robert-ballecer-sj">Fr. Robert Ballecer, SJ</a>, and <a href="https://twitter.com/jasonhiner" target="_blank">Jason Hiner</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://www.stamps.com/radio/twit">www.stamps.com - promo code: TWIT</a></li>
<li><a href="http://Epson.com/ecotankleo">Epson.com/ecotankleo</a></li>
<li><a href="http://mintmobile.com/twit">mintmobile.com/twit</a></li>
<li><a href="http://ustudio.com">ustudio.com</a></li>
</ul></p>
]]>
			</description>
			<itunes:summary><![CDATA[
<p>CES 2020 wrap-up</p><ul><li> Sex tech at CES 2020</li><li> Apple, Amazon, and others talk privacy at CES 2020</li><li> Tech Giants at CES 2020</li><li> The Sands: all the weirdest stuff at CES 2020</li><li> The best TVs at CES 2020</li><li> Future Concepts at CES 2020</li><li> The Charmin Rollbot</li><li> Biggest CES 2020 trends: vegetable-based meat, driverless cars, and bendable computers</li><li> Our favorite gadgets from CES 2020: from 8k TVs to electronic rosaries</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twit.tv/people/ant-pruitt">Ant Pruitt</a>, <a href="https://twit.tv/people/fr-robert-ballecer-sj">Fr. Robert Ballecer, SJ</a>, and <a href="https://twitter.com/jasonhiner" target="_blank">Jason Hiner</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://www.stamps.com/radio/twit">www.stamps.com - promo code: TWIT</a></li>
<li><a href="http://Epson.com/ecotankleo">Epson.com/ecotankleo</a></li>
<li><a href="http://mintmobile.com/twit">mintmobile.com/twit</a></li>
<li><a href="http://ustudio.com">ustudio.com</a></li>
</ul></p>
]]></itunes:summary>
			<content:encoded><![CDATA[
<p>CES 2020 wrap-up</p><ul><li> Sex tech at CES 2020</li><li> Apple, Amazon, and others talk privacy at CES 2020</li><li> Tech Giants at CES 2020</li><li> The Sands: all the weirdest stuff at CES 2020</li><li> The best TVs at CES 2020</li><li> Future Concepts at CES 2020</li><li> The Charmin Rollbot</li><li> Biggest CES 2020 trends: vegetable-based meat, driverless cars, and bendable computers</li><li> Our favorite gadgets from CES 2020: from 8k TVs to electronic rosaries</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twit.tv/people/ant-pruitt">Ant Pruitt</a>, <a href="https://twit.tv/people/fr-robert-ballecer-sj">Fr. Robert Ballecer, SJ</a>, and <a href="https://twitter.com/jasonhiner" target="_blank">Jason Hiner</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://www.stamps.com/radio/twit">www.stamps.com - promo code: TWIT</a></li>
<li><a href="http://Epson.com/ecotankleo">Epson.com/ecotankleo</a></li>
<li><a href="http://mintmobile.com/twit">mintmobile.com/twit</a></li>
<li><a href="http://ustudio.com">ustudio.com</a></li>
</ul></p>
]]></content:encoded>
				<itunes:image href="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_600x450/public/images/episodes/812369/hero/edit.02_24_12_23.still004.jpg?itok=QsAD00pr"/>
			<guid isPermaLink="false">https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0753/twit0753.mp3</guid>
			<itunes:duration>2:22:40</itunes:duration>
			<enclosure url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0753/twit0753.mp3" length="68612682" type="audio/mpeg"/>
			<media:content url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0753/twit0753.mp3" fileSize="68612682" type="audio/mpeg" medium="audio">
				<media:title type="plain">TWiT 753: I Got Waylaid in Switzerland</media:title>
				<media:description type="plain">The Best Tech from CES 2020</media:description>
				<media:keywords>TWiT, this week in tech, Leo Laporte, Padre, Father Robert Ballecer, Ant Pruitt, jason hiner, CES, ces 2020, Best of CES, sex tech, Apple, amazon, Charmin rollbot, samsung 8k tv, eRosary</media:keywords>
				<media:thumbnail url="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_400x300/public/images/episodes/812369/hero/edit.02_24_12_23.still004.jpg?itok=-uesxHVI" width="400" height="225" />
				<media:rating scheme="urn:simple">nonadult</media:rating>
				<media:rating scheme="urn:v-chip">tv-g</media:rating>
				<media:category scheme="urn:iab:categories" label="Technology &amp; Computing">IAB19</media:category>		<media:credit role="anchor person">Leo Laporte</media:credit>
		<media:credit role="reporter">Ant Pruitt</media:credit>
		<media:credit role="reporter">Fr. Robert Ballecer, SJ</media:credit>
		<media:credit role="reporter">Jason Hiner</media:credit>
			</media:content>
		</item>
		<item>
			<title>TWiT 752: More Seam than Bezel</title>
			<itunes:title>More Seam than Bezel</itunes:title>
			<itunes:episodeType>full</itunes:episodeType>
			<pubDate>Sun, 05 Jan 2020 17:25:30 PST</pubDate>
			<itunes:episode>752</itunes:episode>
			<link>https://twit.tv/shows/this-week-in-tech/episodes/752</link>
			<comments>https://twit.tv/shows/this-week-in-tech/episodes/752</comments>
			<itunes:author>TWiT</itunes:author>
			<category>Tech News</category>
			<itunes:explicit>clean</itunes:explicit>
			<itunes:subtitle>CES Preview, 2020's New Tech Laws</itunes:subtitle>
			<itunes:keywords>TWiT, this week in tech, Leo Laporte, Ed Bott, Ben Johnson, Dwight Silverman, CES, ces 2020, segway, Wall-E, 8k tvs, 3D, hologram, Cambridge Analytica, 5G, california, AB 5, gig workers, CCPA, california consumer privacy act, Wyze, 1924, public domain</itunes:keywords>
			<description>
<![CDATA[
<p><img src="https://elroy.twit.tv/sites/default/files/styles/twit_album_art_2048x2048/public/images/shows/this_week_in_tech/album_art/audio/twit1400audio.jpg?itok=J0vhatZb" align="right" hspace="20" vspace="20" border="0" width="300" height="300" title="This Week in Tech (Audio)" alt="This Week in Tech (Audio)"/></p><p>This Week's Stories:</p><ul><li> CES Preview: what to expect at the 2020 show</li><li> Segway's new Wall-E pod chair</li><li> 8k TVs take over CES - what about bandwidth caps?</li><li> 3D is back at CES - get ready for Star Wars holograms</li><li> Fresh Cambridge Analytica leak: 68 countries targeted</li><li> 5G in 2020: hype or happening?</li><li> How to fix California' gig worker law</li><li> California Consumer Privacy Act hits January 1</li><li> Wyze Camera breach response: quick and decisive</li><li> 1924 belongs to us all now</li><li> TRACED Act passes, robocallers put on notice</li><li> Hofeller Files break gerrymandering plot wide open</li><li> IRS forces Turbo Tax to show free filing product</li><li> Fake Twitter accounts spew thousands of pro-Iran propaganda tweets</li><li> Australian fires: horrific images online</li><li> Google will stop swindling the US on taxes</li><li> Google's Head of International Relations left because Google started to be evil</li><li> Samsung Galaxy S20 arriving February 11th</li><li> Sonos bricking old speakers</li><li> Fry's is in big trouble</li><li> Y2K bug strikes again: NYC parking meters break in 2020, 11-19</li><li> #TeamTrees gets \$20M</li><li> YouTube's #1 star turned 8 in 2019</li><li> EU: AI cannot patent inventions</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/dsilverman" target="_blank">Dwight Silverman</a>, <a href="http://wbur.org" target="_blank">Ben Brock Johnson</a>, and <a href="https://twitter.com/edbott" target="_blank">Ed Bott</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://getguru.com/twit">getguru.com/twit</a></li>
<li><a href="http://HealthIQ.com/twit">HealthIQ.com/twit</a></li>
<li><a href="http://FreshBooks.com/twit">FreshBooks.com/twit</a></li>
<li><a href="http://casper.com/twit1">casper.com/twit1 - promo code: TWIT1</a></li>
</ul></p>
]]>
			</description>
			<itunes:summary><![CDATA[
<p>This Week's Stories:</p><ul><li> CES Preview: what to expect at the 2020 show</li><li> Segway's new Wall-E pod chair</li><li> 8k TVs take over CES - what about bandwidth caps?</li><li> 3D is back at CES - get ready for Star Wars holograms</li><li> Fresh Cambridge Analytica leak: 68 countries targeted</li><li> 5G in 2020: hype or happening?</li><li> How to fix California' gig worker law</li><li> California Consumer Privacy Act hits January 1</li><li> Wyze Camera breach response: quick and decisive</li><li> 1924 belongs to us all now</li><li> TRACED Act passes, robocallers put on notice</li><li> Hofeller Files break gerrymandering plot wide open</li><li> IRS forces Turbo Tax to show free filing product</li><li> Fake Twitter accounts spew thousands of pro-Iran propaganda tweets</li><li> Australian fires: horrific images online</li><li> Google will stop swindling the US on taxes</li><li> Google's Head of International Relations left because Google started to be evil</li><li> Samsung Galaxy S20 arriving February 11th</li><li> Sonos bricking old speakers</li><li> Fry's is in big trouble</li><li> Y2K bug strikes again: NYC parking meters break in 2020, 11-19</li><li> #TeamTrees gets \$20M</li><li> YouTube's #1 star turned 8 in 2019</li><li> EU: AI cannot patent inventions</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/dsilverman" target="_blank">Dwight Silverman</a>, <a href="http://wbur.org" target="_blank">Ben Brock Johnson</a>, and <a href="https://twitter.com/edbott" target="_blank">Ed Bott</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://getguru.com/twit">getguru.com/twit</a></li>
<li><a href="http://HealthIQ.com/twit">HealthIQ.com/twit</a></li>
<li><a href="http://FreshBooks.com/twit">FreshBooks.com/twit</a></li>
<li><a href="http://casper.com/twit1">casper.com/twit1 - promo code: TWIT1</a></li>
</ul></p>
]]></itunes:summary>
			<content:encoded><![CDATA[
<p>This Week's Stories:</p><ul><li> CES Preview: what to expect at the 2020 show</li><li> Segway's new Wall-E pod chair</li><li> 8k TVs take over CES - what about bandwidth caps?</li><li> 3D is back at CES - get ready for Star Wars holograms</li><li> Fresh Cambridge Analytica leak: 68 countries targeted</li><li> 5G in 2020: hype or happening?</li><li> How to fix California' gig worker law</li><li> California Consumer Privacy Act hits January 1</li><li> Wyze Camera breach response: quick and decisive</li><li> 1924 belongs to us all now</li><li> TRACED Act passes, robocallers put on notice</li><li> Hofeller Files break gerrymandering plot wide open</li><li> IRS forces Turbo Tax to show free filing product</li><li> Fake Twitter accounts spew thousands of pro-Iran propaganda tweets</li><li> Australian fires: horrific images online</li><li> Google will stop swindling the US on taxes</li><li> Google's Head of International Relations left because Google started to be evil</li><li> Samsung Galaxy S20 arriving February 11th</li><li> Sonos bricking old speakers</li><li> Fry's is in big trouble</li><li> Y2K bug strikes again: NYC parking meters break in 2020, 11-19</li><li> #TeamTrees gets \$20M</li><li> YouTube's #1 star turned 8 in 2019</li><li> EU: AI cannot patent inventions</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/dsilverman" target="_blank">Dwight Silverman</a>, <a href="http://wbur.org" target="_blank">Ben Brock Johnson</a>, and <a href="https://twitter.com/edbott" target="_blank">Ed Bott</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://getguru.com/twit">getguru.com/twit</a></li>
<li><a href="http://HealthIQ.com/twit">HealthIQ.com/twit</a></li>
<li><a href="http://FreshBooks.com/twit">FreshBooks.com/twit</a></li>
<li><a href="http://casper.com/twit1">casper.com/twit1 - promo code: TWIT1</a></li>
</ul></p>
]]></content:encoded>
				<itunes:image href="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_600x450/public/images/episodes/812102/hero/edit.01_25_31_08.still004.jpg?itok=CC_GSmLp"/>
			<guid isPermaLink="false">https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0752/twit0752.mp3</guid>
			<itunes:duration>2:18:24</itunes:duration>
			<enclosure url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0752/twit0752.mp3" length="66568026" type="audio/mpeg"/>
			<media:content url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0752/twit0752.mp3" fileSize="66568026" type="audio/mpeg" medium="audio">
				<media:title type="plain">TWiT 752: More Seam than Bezel</media:title>
				<media:description type="plain">CES Preview, 2020's New Tech Laws</media:description>
				<media:keywords>TWiT, this week in tech, Leo Laporte, Ed Bott, Ben Johnson, Dwight Silverman, CES, ces 2020, segway, Wall-E, 8k tvs, 3D, hologram, Cambridge Analytica, 5G, california, AB 5, gig workers, CCPA, california consumer privacy act, Wyze, 1924, public domain</media:keywords>
				<media:thumbnail url="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_400x300/public/images/episodes/812102/hero/edit.01_25_31_08.still004.jpg?itok=56eZhAvF" width="400" height="225" />
				<media:rating scheme="urn:simple">nonadult</media:rating>
				<media:rating scheme="urn:v-chip">tv-g</media:rating>
				<media:category scheme="urn:iab:categories" label="Technology &amp; Computing">IAB19</media:category>		<media:credit role="anchor person">Leo Laporte</media:credit>
		<media:credit role="reporter">Dwight Silverman</media:credit>
		<media:credit role="reporter">Ben Brock Johnson</media:credit>
		<media:credit role="reporter">Ed Bott</media:credit>
			</media:content>
		</item>
		<item>
			<title>TWiT 751: The Year's Best</title>
			<itunes:title>The Year's Best</itunes:title>
			<itunes:episodeType>full</itunes:episodeType>
			<pubDate>Sun, 29 Dec 2019 08:15:00 PST</pubDate>
			<itunes:episode>751</itunes:episode>
			<link>https://twit.tv/shows/this-week-in-tech/episodes/751</link>
			<comments>https://twit.tv/shows/this-week-in-tech/episodes/751</comments>
			<itunes:author>TWiT</itunes:author>
			<category>Tech News</category>
			<itunes:explicit>clean</itunes:explicit>
			<itunes:subtitle>The best TWiT highlights of 2019!</itunes:subtitle>
			<itunes:keywords>Technology, Leo Laporte, public domain, CRISPR, san francisco, facial recognition, grumpy cat, huawei, trump, foursquare, facebook, zuckerberg, ftc, iPhone 11, Apple TV+, Jason Snell</itunes:keywords>
			<description>
<![CDATA[
<p><img src="https://elroy.twit.tv/sites/default/files/styles/twit_album_art_2048x2048/public/images/shows/this_week_in_tech/album_art/audio/twit1400audio.jpg?itok=J0vhatZb" align="right" hspace="20" vspace="20" border="0" width="300" height="300" title="This Week in Tech (Audio)" alt="This Week in Tech (Audio)"/></p><p>Leo Laporte takes us through the past year in tech. 2019 highlights include Chinese CRISPR Babies, San Francisco's facial recognition surveillance ban, Grumpy Cat's sad death, the United States versus Huawei, Facebook's \$5 billion FTC fine, the debut of Apple TV+, and more!</p> 
<p>Happy New Year from Leo and the TWiT crew!</p> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://HealthIQ.com/twit">HealthIQ.com/twit</a></li>
<li><a href="http://LastPass.com/twit">LastPass.com/twit</a></li>
<li><a href="http://mackweldon.com">mackweldon.com promo code TWIT</a></li>
</ul></p>
]]>
			</description>
			<itunes:summary><![CDATA[
<p>Leo Laporte takes us through the past year in tech. 2019 highlights include Chinese CRISPR Babies, San Francisco's facial recognition surveillance ban, Grumpy Cat's sad death, the United States versus Huawei, Facebook's \$5 billion FTC fine, the debut of Apple TV+, and more!</p> 
<p>Happy New Year from Leo and the TWiT crew!</p> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://HealthIQ.com/twit">HealthIQ.com/twit</a></li>
<li><a href="http://LastPass.com/twit">LastPass.com/twit</a></li>
<li><a href="http://mackweldon.com">mackweldon.com promo code TWIT</a></li>
</ul></p>
]]></itunes:summary>
			<content:encoded><![CDATA[
<p>Leo Laporte takes us through the past year in tech. 2019 highlights include Chinese CRISPR Babies, San Francisco's facial recognition surveillance ban, Grumpy Cat's sad death, the United States versus Huawei, Facebook's \$5 billion FTC fine, the debut of Apple TV+, and more!</p> 
<p>Happy New Year from Leo and the TWiT crew!</p> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://HealthIQ.com/twit">HealthIQ.com/twit</a></li>
<li><a href="http://LastPass.com/twit">LastPass.com/twit</a></li>
<li><a href="http://mackweldon.com">mackweldon.com promo code TWIT</a></li>
</ul></p>
]]></content:encoded>
				<itunes:image href="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_600x450/public/images/episodes/811982/hero/edit.02_04_29_58.still004.jpg?itok=HMmphmZg"/>
			<guid isPermaLink="false">https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0751/twit0751.mp3</guid>
			<itunes:duration>2:06:14</itunes:duration>
			<enclosure url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0751/twit0751.mp3" length="60779500" type="audio/mpeg"/>
			<media:content url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0751/twit0751.mp3" fileSize="60779500" type="audio/mpeg" medium="audio">
				<media:title type="plain">TWiT 751: The Year's Best</media:title>
				<media:description type="plain">The best TWiT highlights of 2019!</media:description>
				<media:keywords>Technology, Leo Laporte, public domain, CRISPR, san francisco, facial recognition, grumpy cat, huawei, trump, foursquare, facebook, zuckerberg, ftc, iPhone 11, Apple TV+, Jason Snell</media:keywords>
				<media:thumbnail url="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_400x300/public/images/episodes/811982/hero/edit.02_04_29_58.still004.jpg?itok=1MV-x5BF" width="400" height="225" />
				<media:rating scheme="urn:simple">nonadult</media:rating>
				<media:rating scheme="urn:v-chip">tv-g</media:rating>
				<media:category scheme="urn:iab:categories" label="Technology &amp; Computing">IAB19</media:category>		<media:credit role="anchor person">Leo Laporte</media:credit>
			</media:content>
		</item>
		<item>
			<title>TWiT 750: Another Decade is in the Can</title>
			<itunes:title>Another Decade is in the Can</itunes:title>
			<itunes:episodeType>full</itunes:episodeType>
			<pubDate>Sun, 22 Dec 2019 15:44:42 PST</pubDate>
			<itunes:episode>750</itunes:episode>
			<link>https://twit.tv/shows/this-week-in-tech/episodes/750</link>
			<comments>https://twit.tv/shows/this-week-in-tech/episodes/750</comments>
			<itunes:author>TWiT</itunes:author>
			<category>Tech News</category>
			<itunes:explicit>clean</itunes:explicit>
			<itunes:subtitle>Top Tech News of the Decade</itunes:subtitle>
			<itunes:keywords>TWiT, this week in tech, Leo Laporte, Stacey Higginbotham, Mary Jo Foley, Mikah Sargent, Apple, Google, facebook, tesla, Steve Jobs, Microsoft, Snowden, Yahoo, amazon, trump, Twitter, pokemon go, samsung, alexa</itunes:keywords>
			<description>
<![CDATA[
<p><img src="https://elroy.twit.tv/sites/default/files/styles/twit_album_art_2048x2048/public/images/shows/this_week_in_tech/album_art/audio/twit1400audio.jpg?itok=J0vhatZb" align="right" hspace="20" vspace="20" border="0" width="300" height="300" title="This Week in Tech (Audio)" alt="This Week in Tech (Audio)"/></p><p>On This Week in Tech's 2019 Holiday Special, Leo Laporte, Stacey Higginbotham, Mary Jo Foley, and Mikah Sargent run down the top Tech News stories of 2010 - 2019.</p> 
<p><strong>Hosts:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a>, <a href="https://twit.tv/people/mary-jo-foley">Mary Jo Foley</a>, <a href="https://twit.tv/people/stacey-higginbotham">Stacey Higginbotham</a>, and <a href="https://twit.tv/people/mikah-sargent">Mikah Sargent</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://www.stamps.com/radio/twit">www.stamps.com - promo code: TWIT</a></li>
<li><a href="http://do.co/twit"> do.co/twit</a></li>
<li><a href="http://masterclass.com/twit">masterclass.com/twit</a></li>
<li><a href="http://mackweldon.com">mackweldon.com promo code TWIT</a></li>
</ul></p>
]]>
			</description>
			<itunes:summary><![CDATA[
<p>On This Week in Tech's 2019 Holiday Special, Leo Laporte, Stacey Higginbotham, Mary Jo Foley, and Mikah Sargent run down the top Tech News stories of 2010 - 2019.</p> 
<p><strong>Hosts:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a>, <a href="https://twit.tv/people/mary-jo-foley">Mary Jo Foley</a>, <a href="https://twit.tv/people/stacey-higginbotham">Stacey Higginbotham</a>, and <a href="https://twit.tv/people/mikah-sargent">Mikah Sargent</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://www.stamps.com/radio/twit">www.stamps.com - promo code: TWIT</a></li>
<li><a href="http://do.co/twit"> do.co/twit</a></li>
<li><a href="http://masterclass.com/twit">masterclass.com/twit</a></li>
<li><a href="http://mackweldon.com">mackweldon.com promo code TWIT</a></li>
</ul></p>
]]></itunes:summary>
			<content:encoded><![CDATA[
<p>On This Week in Tech's 2019 Holiday Special, Leo Laporte, Stacey Higginbotham, Mary Jo Foley, and Mikah Sargent run down the top Tech News stories of 2010 - 2019.</p> 
<p><strong>Hosts:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a>, <a href="https://twit.tv/people/mary-jo-foley">Mary Jo Foley</a>, <a href="https://twit.tv/people/stacey-higginbotham">Stacey Higginbotham</a>, and <a href="https://twit.tv/people/mikah-sargent">Mikah Sargent</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://www.stamps.com/radio/twit">www.stamps.com - promo code: TWIT</a></li>
<li><a href="http://do.co/twit"> do.co/twit</a></li>
<li><a href="http://masterclass.com/twit">masterclass.com/twit</a></li>
<li><a href="http://mackweldon.com">mackweldon.com promo code TWIT</a></li>
</ul></p>
]]></content:encoded>
				<itunes:image href="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_600x450/public/images/episodes/811847/hero/twit750cheers.jpg?itok=D7yrf906"/>
			<guid isPermaLink="false">https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0750/twit0750.mp3</guid>
			<itunes:duration>2:50:33</itunes:duration>
			<enclosure url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0750/twit0750.mp3" length="82002005" type="audio/mpeg"/>
			<media:content url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0750/twit0750.mp3" fileSize="82002005" type="audio/mpeg" medium="audio">
				<media:title type="plain">TWiT 750: Another Decade is in the Can</media:title>
				<media:description type="plain">Top Tech News of the Decade</media:description>
				<media:keywords>TWiT, this week in tech, Leo Laporte, Stacey Higginbotham, Mary Jo Foley, Mikah Sargent, Apple, Google, facebook, tesla, Steve Jobs, Microsoft, Snowden, Yahoo, amazon, trump, Twitter, pokemon go, samsung, alexa</media:keywords>
				<media:thumbnail url="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_400x300/public/images/episodes/811847/hero/twit750cheers.jpg?itok=XRJUxYcC" width="400" height="225" />
				<media:rating scheme="urn:simple">nonadult</media:rating>
				<media:rating scheme="urn:v-chip">tv-g</media:rating>
				<media:category scheme="urn:iab:categories" label="Technology &amp; Computing">IAB19</media:category>		<media:credit role="anchor person">Leo Laporte</media:credit>
		<media:credit role="anchor person">Mary Jo Foley</media:credit>
		<media:credit role="anchor person">Stacey Higginbotham</media:credit>
		<media:credit role="anchor person">Mikah Sargent</media:credit>
			</media:content>
		</item>
		<item>
			<title>TWiT 749: At Least She Double Bagged It</title>
			<itunes:title>At Least She Double Bagged It</itunes:title>
			<itunes:episodeType>full</itunes:episodeType>
			<pubDate>Sun, 15 Dec 2019 20:49:32 PST</pubDate>
			<itunes:episode>749</itunes:episode>
			<link>https://twit.tv/shows/this-week-in-tech/episodes/749</link>
			<comments>https://twit.tv/shows/this-week-in-tech/episodes/749</comments>
			<itunes:author>TWiT</itunes:author>
			<category>Tech News</category>
			<itunes:explicit>clean</itunes:explicit>
			<itunes:subtitle>Mac Pro, Ring Hacked, Tik Tok Top 100</itunes:subtitle>
			<itunes:keywords>TWiT, this week in tech, Leo Laporte, Paris Martineau, Owen JJ Stone, Rosemary Orchard, Apple, Mac Pro, golden globes, The Morning Show, AirPods, AirPods Pro, amazon, echo, alexa, Samuel L. Jackson</itunes:keywords>
			<description>
<![CDATA[
<p><img src="https://elroy.twit.tv/sites/default/files/styles/twit_album_art_2048x2048/public/images/shows/this_week_in_tech/album_art/audio/twit1400audio.jpg?itok=J0vhatZb" align="right" hspace="20" vspace="20" border="0" width="300" height="300" title="This Week in Tech (Audio)" alt="This Week in Tech (Audio)"/></p><p>This Week's Stories</p><ul><li>Mac Pro: only 1/3rd the cost of a banana duct-taped to a wall</li><li>Apple TV+ gets its first Golden Globe award nomination</li><li>AirPods make Apple \$4 billion/quarter</li><li>Here's how to get Samuel L. Jackson on your Amazon Echo</li><li>Ring camera hacked to tell child to destroy their room</li><li>Google gives US ATF location info on 1500 users</li><li>Ask a Millennial: what's the deal with Tik Tok?</li><li>Jack Dorsey wants an open standard Twitter</li><li>Facebook wants end-to-end encryption. AG Barr is not so happy about that.</li><li>India wants to get all its citizens' data</li><li>New Orleans narrowly avoids ransomware hit</li><li>Samsung didn't really sell a million Galaxy Folds, and other silly phone stories</li><li>Paris Martineau's ultimate guide to Influencers</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/rosemaryorchard" target="_blank">Rosemary Orchard</a>, <a href="https://theoutline.com" target="_blank">Paris Martineau</a>, and <a href="https://twitter.com/ohdoctah" target="_blank">Owen JJ Stone</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://masterclass.com/twit">masterclass.com/twit</a></li>
<li><a href="http://brave.com/twit">brave.com/TWIT</a></li>
<li><a href="http://expressvpn.com/twit">expressvpn.com/twit</a></li>
<li><a href="http://Bombas.com/twit">Bombas.com/twit</a></li>
</ul></p>
]]>
			</description>
			<itunes:summary><![CDATA[
<p>This Week's Stories</p><ul><li>Mac Pro: only 1/3rd the cost of a banana duct-taped to a wall</li><li>Apple TV+ gets its first Golden Globe award nomination</li><li>AirPods make Apple \$4 billion/quarter</li><li>Here's how to get Samuel L. Jackson on your Amazon Echo</li><li>Ring camera hacked to tell child to destroy their room</li><li>Google gives US ATF location info on 1500 users</li><li>Ask a Millennial: what's the deal with Tik Tok?</li><li>Jack Dorsey wants an open standard Twitter</li><li>Facebook wants end-to-end encryption. AG Barr is not so happy about that.</li><li>India wants to get all its citizens' data</li><li>New Orleans narrowly avoids ransomware hit</li><li>Samsung didn't really sell a million Galaxy Folds, and other silly phone stories</li><li>Paris Martineau's ultimate guide to Influencers</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/rosemaryorchard" target="_blank">Rosemary Orchard</a>, <a href="https://theoutline.com" target="_blank">Paris Martineau</a>, and <a href="https://twitter.com/ohdoctah" target="_blank">Owen JJ Stone</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://masterclass.com/twit">masterclass.com/twit</a></li>
<li><a href="http://brave.com/twit">brave.com/TWIT</a></li>
<li><a href="http://expressvpn.com/twit">expressvpn.com/twit</a></li>
<li><a href="http://Bombas.com/twit">Bombas.com/twit</a></li>
</ul></p>
]]></itunes:summary>
			<content:encoded><![CDATA[
<p>This Week's Stories</p><ul><li>Mac Pro: only 1/3rd the cost of a banana duct-taped to a wall</li><li>Apple TV+ gets its first Golden Globe award nomination</li><li>AirPods make Apple \$4 billion/quarter</li><li>Here's how to get Samuel L. Jackson on your Amazon Echo</li><li>Ring camera hacked to tell child to destroy their room</li><li>Google gives US ATF location info on 1500 users</li><li>Ask a Millennial: what's the deal with Tik Tok?</li><li>Jack Dorsey wants an open standard Twitter</li><li>Facebook wants end-to-end encryption. AG Barr is not so happy about that.</li><li>India wants to get all its citizens' data</li><li>New Orleans narrowly avoids ransomware hit</li><li>Samsung didn't really sell a million Galaxy Folds, and other silly phone stories</li><li>Paris Martineau's ultimate guide to Influencers</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/rosemaryorchard" target="_blank">Rosemary Orchard</a>, <a href="https://theoutline.com" target="_blank">Paris Martineau</a>, and <a href="https://twitter.com/ohdoctah" target="_blank">Owen JJ Stone</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://masterclass.com/twit">masterclass.com/twit</a></li>
<li><a href="http://brave.com/twit">brave.com/TWIT</a></li>
<li><a href="http://expressvpn.com/twit">expressvpn.com/twit</a></li>
<li><a href="http://Bombas.com/twit">Bombas.com/twit</a></li>
</ul></p>
]]></content:encoded>
				<itunes:image href="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_600x450/public/images/episodes/811628/hero/twit749.jpg?itok=zHZuH85o"/>
			<guid isPermaLink="false">https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0749/twit0749.mp3</guid>
			<itunes:duration>2:33:26</itunes:duration>
			<enclosure url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0749/twit0749.mp3" length="73789107" type="audio/mpeg"/>
			<media:content url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0749/twit0749.mp3" fileSize="73789107" type="audio/mpeg" medium="audio">
				<media:title type="plain">TWiT 749: At Least She Double Bagged It</media:title>
				<media:description type="plain">Mac Pro, Ring Hacked, Tik Tok Top 100</media:description>
				<media:keywords>TWiT, this week in tech, Leo Laporte, Paris Martineau, Owen JJ Stone, Rosemary Orchard, Apple, Mac Pro, golden globes, The Morning Show, AirPods, AirPods Pro, amazon, echo, alexa, Samuel L. Jackson</media:keywords>
				<media:thumbnail url="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_400x300/public/images/episodes/811628/hero/twit749.jpg?itok=lDsF0iS6" width="400" height="225" />
				<media:rating scheme="urn:simple">nonadult</media:rating>
				<media:rating scheme="urn:v-chip">tv-g</media:rating>
				<media:category scheme="urn:iab:categories" label="Technology &amp; Computing">IAB19</media:category>		<media:credit role="anchor person">Leo Laporte</media:credit>
		<media:credit role="reporter">Rosemary Orchard</media:credit>
		<media:credit role="reporter">Paris Martineau</media:credit>
		<media:credit role="reporter">Owen JJ Stone</media:credit>
			</media:content>
		</item>
		<item>
			<title>TWiT 748: The BAT FAANGs</title>
			<itunes:title>The BAT FAANGs</itunes:title>
			<itunes:episodeType>full</itunes:episodeType>
			<pubDate>Sun, 08 Dec 2019 17:42:19 PST</pubDate>
			<itunes:episode>748</itunes:episode>
			<link>https://twit.tv/shows/this-week-in-tech/episodes/748</link>
			<comments>https://twit.tv/shows/this-week-in-tech/episodes/748</comments>
			<itunes:author>TWiT</itunes:author>
			<category>Tech News</category>
			<itunes:explicit>clean</itunes:explicit>
			<itunes:subtitle>Mac Pro, Google's End of an Era, the Future of War</itunes:subtitle>
			<itunes:keywords>TWiT, this week in tech, Leo Laporte, Amy Webb, Christina Warren, Apple, Mac Pro, huawei, China, silicon valley, Google, Watchmen, amazon, 5G, intel, reddit, elon musk, magic leap</itunes:keywords>
			<description>
<![CDATA[
<p><img src="https://elroy.twit.tv/sites/default/files/styles/twit_album_art_2048x2048/public/images/shows/this_week_in_tech/album_art/audio/twit1400audio.jpg?itok=J0vhatZb" align="right" hspace="20" vspace="20" border="0" width="300" height="300" title="This Week in Tech (Audio)" alt="This Week in Tech (Audio)"/></p><p>Stories this Week</p><ul><li> Mac Pro is only for Pros</li><li> Apple's pivot to services plays on our trust of Apple</li><li> How amoral should companies be?</li><li> Silicon Valley Finale</li><li> Larry and Sergei ride off into the sunset - what happens next?</li><li> How worried should companies be about government regulation?</li><li> Why we're watching Watchmen</li><li> Amazon comes to New York, without tax benefits</li><li> Stadiums as a metaphor for tech</li><li> Amazon's re:Invent is all about AI</li><li> Huawei makes "America-free" Phones</li><li> What is the future of war?</li><li> Is 5G going to be like LTE or WiMAX?</li><li> Intel admits failure</li><li> Reddit bans Russian sock puppets</li><li> Elon dodges pedo bullet</li><li> Magic Leap is the most amazing, important, incredible failure ever </li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twit.tv/people/christina-warren">Christina Warren</a> and <a href="https://amywebb.io/" target="_blank">Amy Webb</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://molekule.com">Molekule.com  promo code TWIT10</a></li>
<li><a href="http://WWT.COM/TWIT">WWT.COM/TWIT</a></li>
<li><a href="http://mintmobile.com/twit">mintmobile.com/twit</a></li>
<li><a href="http://privacy.com/twit">privacy.com/twit</a></li>
</ul></p>
]]>
			</description>
			<itunes:summary><![CDATA[
<p>Stories this Week</p><ul><li> Mac Pro is only for Pros</li><li> Apple's pivot to services plays on our trust of Apple</li><li> How amoral should companies be?</li><li> Silicon Valley Finale</li><li> Larry and Sergei ride off into the sunset - what happens next?</li><li> How worried should companies be about government regulation?</li><li> Why we're watching Watchmen</li><li> Amazon comes to New York, without tax benefits</li><li> Stadiums as a metaphor for tech</li><li> Amazon's re:Invent is all about AI</li><li> Huawei makes "America-free" Phones</li><li> What is the future of war?</li><li> Is 5G going to be like LTE or WiMAX?</li><li> Intel admits failure</li><li> Reddit bans Russian sock puppets</li><li> Elon dodges pedo bullet</li><li> Magic Leap is the most amazing, important, incredible failure ever </li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twit.tv/people/christina-warren">Christina Warren</a> and <a href="https://amywebb.io/" target="_blank">Amy Webb</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://molekule.com">Molekule.com  promo code TWIT10</a></li>
<li><a href="http://WWT.COM/TWIT">WWT.COM/TWIT</a></li>
<li><a href="http://mintmobile.com/twit">mintmobile.com/twit</a></li>
<li><a href="http://privacy.com/twit">privacy.com/twit</a></li>
</ul></p>
]]></itunes:summary>
			<content:encoded><![CDATA[
<p>Stories this Week</p><ul><li> Mac Pro is only for Pros</li><li> Apple's pivot to services plays on our trust of Apple</li><li> How amoral should companies be?</li><li> Silicon Valley Finale</li><li> Larry and Sergei ride off into the sunset - what happens next?</li><li> How worried should companies be about government regulation?</li><li> Why we're watching Watchmen</li><li> Amazon comes to New York, without tax benefits</li><li> Stadiums as a metaphor for tech</li><li> Amazon's re:Invent is all about AI</li><li> Huawei makes "America-free" Phones</li><li> What is the future of war?</li><li> Is 5G going to be like LTE or WiMAX?</li><li> Intel admits failure</li><li> Reddit bans Russian sock puppets</li><li> Elon dodges pedo bullet</li><li> Magic Leap is the most amazing, important, incredible failure ever </li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twit.tv/people/christina-warren">Christina Warren</a> and <a href="https://amywebb.io/" target="_blank">Amy Webb</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://molekule.com">Molekule.com  promo code TWIT10</a></li>
<li><a href="http://WWT.COM/TWIT">WWT.COM/TWIT</a></li>
<li><a href="http://mintmobile.com/twit">mintmobile.com/twit</a></li>
<li><a href="http://privacy.com/twit">privacy.com/twit</a></li>
</ul></p>
]]></content:encoded>
				<itunes:image href="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_600x450/public/images/episodes/811401/hero/scratch.00_00_39_02.still001.jpg?itok=46cKWJKs"/>
			<guid isPermaLink="false">https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0748/twit0748.mp3</guid>
			<itunes:duration>2:41:55</itunes:duration>
			<enclosure url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0748/twit0748.mp3" length="77872777" type="audio/mpeg"/>
			<media:content url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0748/twit0748.mp3" fileSize="77872777" type="audio/mpeg" medium="audio">
				<media:title type="plain">TWiT 748: The BAT FAANGs</media:title>
				<media:description type="plain">Mac Pro, Google's End of an Era, the Future of War</media:description>
				<media:keywords>TWiT, this week in tech, Leo Laporte, Amy Webb, Christina Warren, Apple, Mac Pro, huawei, China, silicon valley, Google, Watchmen, amazon, 5G, intel, reddit, elon musk, magic leap</media:keywords>
				<media:thumbnail url="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_400x300/public/images/episodes/811401/hero/scratch.00_00_39_02.still001.jpg?itok=Uykm4fhZ" width="400" height="225" />
				<media:rating scheme="urn:simple">nonadult</media:rating>
				<media:rating scheme="urn:v-chip">tv-g</media:rating>
				<media:category scheme="urn:iab:categories" label="Technology &amp; Computing">IAB19</media:category>		<media:credit role="anchor person">Leo Laporte</media:credit>
		<media:credit role="reporter">Christina Warren</media:credit>
		<media:credit role="reporter">Amy Webb</media:credit>
			</media:content>
		</item>
		<item>
			<title>TWiT 747: Every Click is a Vote</title>
			<itunes:title>Every Click is a Vote</itunes:title>
			<itunes:episodeType>full</itunes:episodeType>
			<pubDate>Sun, 01 Dec 2019 19:01:21 PST</pubDate>
			<itunes:episode>747</itunes:episode>
			<link>https://twit.tv/shows/this-week-in-tech/episodes/747</link>
			<comments>https://twit.tv/shows/this-week-in-tech/episodes/747</comments>
			<itunes:author>TWiT</itunes:author>
			<category>Tech News</category>
			<itunes:explicit>clean</itunes:explicit>
			<itunes:subtitle>Alexa sounds disappointed, Apple complies with Russian demands</itunes:subtitle>
			<itunes:keywords>TWiT, this week in tech, Leo Laporte, Iain Thomson, Lisa Schmeiser, Alex Lindsay, .org, alexa, disappointed, Apple, russia, Jony Ive, Mac Pro, cheese grater, amd, intel, Apple Pro Display XDR, HDR, hololens, google glass, facebook, singapore, DMV</itunes:keywords>
			<description>
<![CDATA[
<p><img src="https://elroy.twit.tv/sites/default/files/styles/twit_album_art_2048x2048/public/images/shows/this_week_in_tech/album_art/audio/twit1400audio.jpg?itok=J0vhatZb" align="right" hspace="20" vspace="20" border="0" width="300" height="300" title="This Week in Tech (Audio)" alt="This Week in Tech (Audio)"/></p><p>This Week's Stories</p><ul><li> .org being sold off is a much bigger deal than you think</li><li> Apple erases Jony Ive, brings back thicker iPhones, decent MacBook keyboards, and the cheese grater Mac Pro</li><li> AMD cleans up on Black Friday. Intel, not so much</li><li> Who should buy the Apple Pro Display XDR monitor?</li><li> Why is HDR important?</li><li> Why Hololens is succeeding where Google Glass failed</li><li> Why aren't video games perfectly realistic yet?</li><li> Apple bows to Russia, shows Crimea as Russian in Apple Maps</li><li> Facebook thinks political lies are fine everywhere but Singapore</li><li> Alexa is very, very, disappointed in you</li><li> Are US presidential candidates using enough email security?</li><li> California DMV sold my data</li><li> Tim Berners-Lee still wants to save the web</li><li> Windows 7 has 45 days to live</li><li> We are really, truly, finally out of IPv4 addresses</li><li> Dubai Police force buys Tesla Cybertrucks</li><li> Record Black Friday - 40% of purchases made on smartphones</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="http://twitter.com/lschmeiser" target="_blank">Lisa Schmeiser</a>, <a href="https://twit.tv/people/iain-thomson">Iain Thomson</a>, and <a href="https://twit.tv/people/alex-lindsay">Alex Lindsay</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://eero.com/TWIT">eero.com/TWIT code TWIT</a></li>
<li><a href="http://casper.com/twit1">casper.com/twit1 - promo code: TWIT1</a></li>
<li><a href="http://LastPass.com/twit">LastPass.com/twit</a></li>
<li><a href="http://wasabi.com">Wasabi.com  offer code TWiT</a></li>
</ul></p>
]]>
			</description>
			<itunes:summary><![CDATA[
<p>This Week's Stories</p><ul><li> .org being sold off is a much bigger deal than you think</li><li> Apple erases Jony Ive, brings back thicker iPhones, decent MacBook keyboards, and the cheese grater Mac Pro</li><li> AMD cleans up on Black Friday. Intel, not so much</li><li> Who should buy the Apple Pro Display XDR monitor?</li><li> Why is HDR important?</li><li> Why Hololens is succeeding where Google Glass failed</li><li> Why aren't video games perfectly realistic yet?</li><li> Apple bows to Russia, shows Crimea as Russian in Apple Maps</li><li> Facebook thinks political lies are fine everywhere but Singapore</li><li> Alexa is very, very, disappointed in you</li><li> Are US presidential candidates using enough email security?</li><li> California DMV sold my data</li><li> Tim Berners-Lee still wants to save the web</li><li> Windows 7 has 45 days to live</li><li> We are really, truly, finally out of IPv4 addresses</li><li> Dubai Police force buys Tesla Cybertrucks</li><li> Record Black Friday - 40% of purchases made on smartphones</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="http://twitter.com/lschmeiser" target="_blank">Lisa Schmeiser</a>, <a href="https://twit.tv/people/iain-thomson">Iain Thomson</a>, and <a href="https://twit.tv/people/alex-lindsay">Alex Lindsay</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://eero.com/TWIT">eero.com/TWIT code TWIT</a></li>
<li><a href="http://casper.com/twit1">casper.com/twit1 - promo code: TWIT1</a></li>
<li><a href="http://LastPass.com/twit">LastPass.com/twit</a></li>
<li><a href="http://wasabi.com">Wasabi.com  offer code TWiT</a></li>
</ul></p>
]]></itunes:summary>
			<content:encoded><![CDATA[
<p>This Week's Stories</p><ul><li> .org being sold off is a much bigger deal than you think</li><li> Apple erases Jony Ive, brings back thicker iPhones, decent MacBook keyboards, and the cheese grater Mac Pro</li><li> AMD cleans up on Black Friday. Intel, not so much</li><li> Who should buy the Apple Pro Display XDR monitor?</li><li> Why is HDR important?</li><li> Why Hololens is succeeding where Google Glass failed</li><li> Why aren't video games perfectly realistic yet?</li><li> Apple bows to Russia, shows Crimea as Russian in Apple Maps</li><li> Facebook thinks political lies are fine everywhere but Singapore</li><li> Alexa is very, very, disappointed in you</li><li> Are US presidential candidates using enough email security?</li><li> California DMV sold my data</li><li> Tim Berners-Lee still wants to save the web</li><li> Windows 7 has 45 days to live</li><li> We are really, truly, finally out of IPv4 addresses</li><li> Dubai Police force buys Tesla Cybertrucks</li><li> Record Black Friday - 40% of purchases made on smartphones</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="http://twitter.com/lschmeiser" target="_blank">Lisa Schmeiser</a>, <a href="https://twit.tv/people/iain-thomson">Iain Thomson</a>, and <a href="https://twit.tv/people/alex-lindsay">Alex Lindsay</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://eero.com/TWIT">eero.com/TWIT code TWIT</a></li>
<li><a href="http://casper.com/twit1">casper.com/twit1 - promo code: TWIT1</a></li>
<li><a href="http://LastPass.com/twit">LastPass.com/twit</a></li>
<li><a href="http://wasabi.com">Wasabi.com  offer code TWiT</a></li>
</ul></p>
]]></content:encoded>
				<itunes:image href="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_600x450/public/images/episodes/811161/hero/edit.00_03_27_45.still004.jpg?itok=k2-kkHty"/>
			<guid isPermaLink="false">https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0747/twit0747.mp3</guid>
			<itunes:duration>2:24:29</itunes:duration>
			<enclosure url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0747/twit0747.mp3" length="69582975" type="audio/mpeg"/>
			<media:content url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0747/twit0747.mp3" fileSize="69582975" type="audio/mpeg" medium="audio">
				<media:title type="plain">TWiT 747: Every Click is a Vote</media:title>
				<media:description type="plain">Alexa sounds disappointed, Apple complies with Russian demands</media:description>
				<media:keywords>TWiT, this week in tech, Leo Laporte, Iain Thomson, Lisa Schmeiser, Alex Lindsay, .org, alexa, disappointed, Apple, russia, Jony Ive, Mac Pro, cheese grater, amd, intel, Apple Pro Display XDR, HDR, hololens, google glass, facebook, singapore, DMV</media:keywords>
				<media:thumbnail url="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_400x300/public/images/episodes/811161/hero/edit.00_03_27_45.still004.jpg?itok=usUqryrd" width="400" height="225" />
				<media:rating scheme="urn:simple">nonadult</media:rating>
				<media:rating scheme="urn:v-chip">tv-g</media:rating>
				<media:category scheme="urn:iab:categories" label="Technology &amp; Computing">IAB19</media:category>		<media:credit role="anchor person">Leo Laporte</media:credit>
		<media:credit role="reporter">Lisa Schmeiser</media:credit>
		<media:credit role="reporter">Iain Thomson</media:credit>
		<media:credit role="reporter">Alex Lindsay</media:credit>
			</media:content>
		</item>
		<item>
			<title>TWiT 746: My Robot Lawyer</title>
			<itunes:title>My Robot Lawyer</itunes:title>
			<itunes:episodeType>full</itunes:episodeType>
			<pubDate>Sun, 24 Nov 2019 20:50:14 PST</pubDate>
			<itunes:episode>746</itunes:episode>
			<link>https://twit.tv/shows/this-week-in-tech/episodes/746</link>
			<comments>https://twit.tv/shows/this-week-in-tech/episodes/746</comments>
			<itunes:author>TWiT</itunes:author>
			<category>Tech News</category>
			<itunes:explicit>clean</itunes:explicit>
			<itunes:subtitle>Right to repair, Tesla's new truck, Google Stadia</itunes:subtitle>
			<itunes:keywords>TWiT, this week in tech, Leo Laporte, Alex Wilhelm, Mike Elgan, Seth Rosenblatt, Google, stadia, uber, tesla, spacex, Twitter, right to repair, Apple, honey, paypal, ai, privacy, Security, congress, iPhone, fox, Starlink Satellities, cybertruck</itunes:keywords>
			<description>
<![CDATA[
<p><img src="https://elroy.twit.tv/sites/default/files/styles/twit_album_art_2048x2048/public/images/shows/this_week_in_tech/album_art/audio/twit1400audio.jpg?itok=J0vhatZb" align="right" hspace="20" vspace="20" border="0" width="300" height="300" title="This Week in Tech (Audio)" alt="This Week in Tech (Audio)"/></p><p>This Week's Stories</p><ul><li> Tesla's unveils its new Cybertruck, watch out for shotputs!</li><li> NTSB says a fatal crash involving Uber's Robocar was due to human error</li><li> Tesla tries to SWAT a whistleblower</li><li> Jack Dorsey's hacker has been arrested</li><li> Google Stadia and what the future of gaming might look like</li><li> Can't seem to print using Cloud, we'll tell you why</li><li> Apple is building a new campus in Austin, guess who was there to help celebrate?</li><li> Apple tells Congress you shouldn't be able to fix your iPhone because you could hurt yourself. Really Apple?</li><li> And they claim they are losing money when they do repair your iPhone for you.</li><li> SpaceX is serious about its Starlink satellites</li><li> Who gets to see and keep your Ring video doorbell footage? You might not be happy when you find out!</li><li> A new type of AI can predict seizures before they happen, and it's amazingly accurate</li><li> PayPal just bought the coupon-finding browser extension Honey for \$4 Billion!</li><li> Need a lawyer? Your next call might be a robot</li><li> Fox has plans for a new show, and the 50+ crowd might not like the name</li><li> A court has ruled that police can't force a suspect to reveal his password</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/alex" target="_blank">Alex Wilhelm</a>, <a href="https://twit.tv/people/mike-elgan">Mike Elgan</a>, and <a href="https://twitter.com/sethr" target="_blank">Seth Rosenblatt</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://mackweldon.com">mackweldon.com promo code TWIT</a></li>
<li><a href="https://twit.cachefly.com">twit.cachefly.com</a></li>
<li><a href="http://molekule.com">Molekule.com  promo code TWIT10</a></li>
<li><a href="http://capterra.com/twit">capterra.com/twit</a></li>
</ul></p>
]]>
			</description>
			<itunes:summary><![CDATA[
<p>This Week's Stories</p><ul><li> Tesla's unveils its new Cybertruck, watch out for shotputs!</li><li> NTSB says a fatal crash involving Uber's Robocar was due to human error</li><li> Tesla tries to SWAT a whistleblower</li><li> Jack Dorsey's hacker has been arrested</li><li> Google Stadia and what the future of gaming might look like</li><li> Can't seem to print using Cloud, we'll tell you why</li><li> Apple is building a new campus in Austin, guess who was there to help celebrate?</li><li> Apple tells Congress you shouldn't be able to fix your iPhone because you could hurt yourself. Really Apple?</li><li> And they claim they are losing money when they do repair your iPhone for you.</li><li> SpaceX is serious about its Starlink satellites</li><li> Who gets to see and keep your Ring video doorbell footage? You might not be happy when you find out!</li><li> A new type of AI can predict seizures before they happen, and it's amazingly accurate</li><li> PayPal just bought the coupon-finding browser extension Honey for \$4 Billion!</li><li> Need a lawyer? Your next call might be a robot</li><li> Fox has plans for a new show, and the 50+ crowd might not like the name</li><li> A court has ruled that police can't force a suspect to reveal his password</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/alex" target="_blank">Alex Wilhelm</a>, <a href="https://twit.tv/people/mike-elgan">Mike Elgan</a>, and <a href="https://twitter.com/sethr" target="_blank">Seth Rosenblatt</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://mackweldon.com">mackweldon.com promo code TWIT</a></li>
<li><a href="https://twit.cachefly.com">twit.cachefly.com</a></li>
<li><a href="http://molekule.com">Molekule.com  promo code TWIT10</a></li>
<li><a href="http://capterra.com/twit">capterra.com/twit</a></li>
</ul></p>
]]></itunes:summary>
			<content:encoded><![CDATA[
<p>This Week's Stories</p><ul><li> Tesla's unveils its new Cybertruck, watch out for shotputs!</li><li> NTSB says a fatal crash involving Uber's Robocar was due to human error</li><li> Tesla tries to SWAT a whistleblower</li><li> Jack Dorsey's hacker has been arrested</li><li> Google Stadia and what the future of gaming might look like</li><li> Can't seem to print using Cloud, we'll tell you why</li><li> Apple is building a new campus in Austin, guess who was there to help celebrate?</li><li> Apple tells Congress you shouldn't be able to fix your iPhone because you could hurt yourself. Really Apple?</li><li> And they claim they are losing money when they do repair your iPhone for you.</li><li> SpaceX is serious about its Starlink satellites</li><li> Who gets to see and keep your Ring video doorbell footage? You might not be happy when you find out!</li><li> A new type of AI can predict seizures before they happen, and it's amazingly accurate</li><li> PayPal just bought the coupon-finding browser extension Honey for \$4 Billion!</li><li> Need a lawyer? Your next call might be a robot</li><li> Fox has plans for a new show, and the 50+ crowd might not like the name</li><li> A court has ruled that police can't force a suspect to reveal his password</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/alex" target="_blank">Alex Wilhelm</a>, <a href="https://twit.tv/people/mike-elgan">Mike Elgan</a>, and <a href="https://twitter.com/sethr" target="_blank">Seth Rosenblatt</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://mackweldon.com">mackweldon.com promo code TWIT</a></li>
<li><a href="https://twit.cachefly.com">twit.cachefly.com</a></li>
<li><a href="http://molekule.com">Molekule.com  promo code TWIT10</a></li>
<li><a href="http://capterra.com/twit">capterra.com/twit</a></li>
</ul></p>
]]></content:encoded>
				<itunes:image href="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_600x450/public/images/episodes/811003/hero/edit.00_09_16_01.still004.jpg?itok=ZP3FaKZc"/>
			<guid isPermaLink="false">https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0746/twit0746.mp3</guid>
			<itunes:duration>2:41:00</itunes:duration>
			<enclosure url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0746/twit0746.mp3" length="77745926" type="audio/mpeg"/>
			<media:content url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0746/twit0746.mp3" fileSize="77745926" type="audio/mpeg" medium="audio">
				<media:title type="plain">TWiT 746: My Robot Lawyer</media:title>
				<media:description type="plain">Right to repair, Tesla's new truck, Google Stadia</media:description>
				<media:keywords>TWiT, this week in tech, Leo Laporte, Alex Wilhelm, Mike Elgan, Seth Rosenblatt, Google, stadia, uber, tesla, spacex, Twitter, right to repair, Apple, honey, paypal, ai, privacy, Security, congress, iPhone, fox, Starlink Satellities, cybertruck</media:keywords>
				<media:thumbnail url="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_400x300/public/images/episodes/811003/hero/edit.00_09_16_01.still004.jpg?itok=GbZUh2l-" width="400" height="225" />
				<media:rating scheme="urn:simple">nonadult</media:rating>
				<media:rating scheme="urn:v-chip">tv-g</media:rating>
				<media:category scheme="urn:iab:categories" label="Technology &amp; Computing">IAB19</media:category>		<media:credit role="anchor person">Leo Laporte</media:credit>
		<media:credit role="reporter">Alex Wilhelm</media:credit>
		<media:credit role="reporter">Mike Elgan</media:credit>
		<media:credit role="reporter">Seth Rosenblatt</media:credit>
			</media:content>
		</item>
		<item>
			<title>TWiT 745: Highly Illegal - and Very Affordable</title>
			<itunes:title>Highly Illegal - and Very Affordable</itunes:title>
			<itunes:episodeType>full</itunes:episodeType>
			<pubDate>Sun, 17 Nov 2019 16:58:08 PST</pubDate>
			<itunes:episode>745</itunes:episode>
			<link>https://twit.tv/shows/this-week-in-tech/episodes/745</link>
			<comments>https://twit.tv/shows/this-week-in-tech/episodes/745</comments>
			<itunes:author>TWiT</itunes:author>
			<category>Tech News</category>
			<itunes:explicit>clean</itunes:explicit>
			<itunes:subtitle>16-Inch MacBook, Stadia's Failure, Disney+ vs Apple+</itunes:subtitle>
			<itunes:keywords>TWiT, this week in tech, Leo Laporte, Brianna Wu, Brian McCullough, Daniel Rubino, Apple, macbook, 16-inch, Surface Book 3, Surface Laptop 3, Surface Pro X, Project xCloud, Gogle, stadia, Goldman Sachs, Apple Card, Project Nightingale, fitbit</itunes:keywords>
			<description>
<![CDATA[
<p><img src="https://elroy.twit.tv/sites/default/files/styles/twit_album_art_2048x2048/public/images/shows/this_week_in_tech/album_art/audio/twit1400audio.jpg?itok=J0vhatZb" align="right" hspace="20" vspace="20" border="0" width="300" height="300" title="This Week in Tech (Audio)" alt="This Week in Tech (Audio)"/></p><p>This Week's Stories</p><ul><li> Apple's November Surprise: 16-Inch Macbook Pro brings back the scissor-switch keyboard and physical ESC key</li><li> Surface Book 3 Rumors, Surface Laptop 3 and Surface Pro X Reviews</li><li> Microsoft's Project xCloud launches in early 2020 as the odds-on favorite to dominate game streaming</li><li> Google Stadia launches tomorrow as a failure</li><li> Goldman Sachs re-evaluating Apple Card credit limits after sexism accusations</li><li> Google will offer checking accounts to anyone who wants Google to know absolutely everything they pay money for.</li><li> Google's secret "Nightingale" health-care project and Fitbit purchase: Google wants to own your health data</li><li> Apple's Research App: do we trust Apple with our health data more than Google?</li><li> Disney+, Apple+, Peacock TV, etc - when will the streaming bubble burst?</li><li> YouTube creators: are you a kids' channel or an adult channel?</li><li> Is YouTube fracturing the world? Should we go back to all reading the same newspaper?</li><li> Apple kicks vaping apps out of the App Store, Canadian pot stocks crash - legal marijuana's bad week</li><li> Minecraft Earth launches in the US - the perfect demo for Azure Anchors</li><li> Hololens is still the future</li><li> So is the Oculus Quest</li><li> Are Apple Glasses?</li><li> British Labor Party offers free broadband - could this work in the US?</li><li> AI can tell if you are going to die - doctors baffled</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/Daniel_Rubino" target="_blank">Daniel Rubino</a>, <a href="https://techmeme.com" target="_blank">Brian McCullough</a>, and <a href="https://twitter.com/BriannaWu" target="_blank">Brianna Wu</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://Bombas.com/twit">Bombas.com/twit</a></li>
<li><a href="http://expressvpn.com/twit">expressvpn.com/twit</a></li>
<li><a href="http://calm.com/twit">calm.com/twit</a></li>
<li><a href="http://WWT.COM/TWIT">WWT.COM/TWIT</a></li>
</ul></p>
]]>
			</description>
			<itunes:summary><![CDATA[
<p>This Week's Stories</p><ul><li> Apple's November Surprise: 16-Inch Macbook Pro brings back the scissor-switch keyboard and physical ESC key</li><li> Surface Book 3 Rumors, Surface Laptop 3 and Surface Pro X Reviews</li><li> Microsoft's Project xCloud launches in early 2020 as the odds-on favorite to dominate game streaming</li><li> Google Stadia launches tomorrow as a failure</li><li> Goldman Sachs re-evaluating Apple Card credit limits after sexism accusations</li><li> Google will offer checking accounts to anyone who wants Google to know absolutely everything they pay money for.</li><li> Google's secret "Nightingale" health-care project and Fitbit purchase: Google wants to own your health data</li><li> Apple's Research App: do we trust Apple with our health data more than Google?</li><li> Disney+, Apple+, Peacock TV, etc - when will the streaming bubble burst?</li><li> YouTube creators: are you a kids' channel or an adult channel?</li><li> Is YouTube fracturing the world? Should we go back to all reading the same newspaper?</li><li> Apple kicks vaping apps out of the App Store, Canadian pot stocks crash - legal marijuana's bad week</li><li> Minecraft Earth launches in the US - the perfect demo for Azure Anchors</li><li> Hololens is still the future</li><li> So is the Oculus Quest</li><li> Are Apple Glasses?</li><li> British Labor Party offers free broadband - could this work in the US?</li><li> AI can tell if you are going to die - doctors baffled</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/Daniel_Rubino" target="_blank">Daniel Rubino</a>, <a href="https://techmeme.com" target="_blank">Brian McCullough</a>, and <a href="https://twitter.com/BriannaWu" target="_blank">Brianna Wu</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://Bombas.com/twit">Bombas.com/twit</a></li>
<li><a href="http://expressvpn.com/twit">expressvpn.com/twit</a></li>
<li><a href="http://calm.com/twit">calm.com/twit</a></li>
<li><a href="http://WWT.COM/TWIT">WWT.COM/TWIT</a></li>
</ul></p>
]]></itunes:summary>
			<content:encoded><![CDATA[
<p>This Week's Stories</p><ul><li> Apple's November Surprise: 16-Inch Macbook Pro brings back the scissor-switch keyboard and physical ESC key</li><li> Surface Book 3 Rumors, Surface Laptop 3 and Surface Pro X Reviews</li><li> Microsoft's Project xCloud launches in early 2020 as the odds-on favorite to dominate game streaming</li><li> Google Stadia launches tomorrow as a failure</li><li> Goldman Sachs re-evaluating Apple Card credit limits after sexism accusations</li><li> Google will offer checking accounts to anyone who wants Google to know absolutely everything they pay money for.</li><li> Google's secret "Nightingale" health-care project and Fitbit purchase: Google wants to own your health data</li><li> Apple's Research App: do we trust Apple with our health data more than Google?</li><li> Disney+, Apple+, Peacock TV, etc - when will the streaming bubble burst?</li><li> YouTube creators: are you a kids' channel or an adult channel?</li><li> Is YouTube fracturing the world? Should we go back to all reading the same newspaper?</li><li> Apple kicks vaping apps out of the App Store, Canadian pot stocks crash - legal marijuana's bad week</li><li> Minecraft Earth launches in the US - the perfect demo for Azure Anchors</li><li> Hololens is still the future</li><li> So is the Oculus Quest</li><li> Are Apple Glasses?</li><li> British Labor Party offers free broadband - could this work in the US?</li><li> AI can tell if you are going to die - doctors baffled</li></ul> 
<p><strong>Host:</strong> <a href="https://twit.tv/people/leo-laporte">Leo Laporte</a></p> 
<p><strong>Guests:</strong> <a href="https://twitter.com/Daniel_Rubino" target="_blank">Daniel Rubino</a>, <a href="https://techmeme.com" target="_blank">Brian McCullough</a>, and <a href="https://twitter.com/BriannaWu" target="_blank">Brianna Wu</a></p> 
<p>Download or subscribe to this show at <a href="https://twit.tv/shows/this-week-in-tech">https://twit.tv/shows/this-week-in-tech</a></p>
<p><strong>Sponsors:</strong><ul>
<li><a href="http://Bombas.com/twit">Bombas.com/twit</a></li>
<li><a href="http://expressvpn.com/twit">expressvpn.com/twit</a></li>
<li><a href="http://calm.com/twit">calm.com/twit</a></li>
<li><a href="http://WWT.COM/TWIT">WWT.COM/TWIT</a></li>
</ul></p>
]]></content:encoded>
				<itunes:image href="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_600x450/public/images/episodes/810737/hero/edit.00_02_43_46.still004.jpg?itok=lzApJBxI"/>
			<guid isPermaLink="false">https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0745/twit0745.mp3</guid>
			<itunes:duration>2:11:40</itunes:duration>
			<enclosure url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0745/twit0745.mp3" length="63336366" type="audio/mpeg"/>
			<media:content url="https://media.blubrry.com/deepknowhow/cdn.twit.tv/audio/twit/twit0745/twit0745.mp3" fileSize="63336366" type="audio/mpeg" medium="audio">
				<media:title type="plain">TWiT 745: Highly Illegal - and Very Affordable</media:title>
				<media:description type="plain">16-Inch MacBook, Stadia's Failure, Disney+ vs Apple+</media:description>
				<media:keywords>TWiT, this week in tech, Leo Laporte, Brianna Wu, Brian McCullough, Daniel Rubino, Apple, macbook, 16-inch, Surface Book 3, Surface Laptop 3, Surface Pro X, Project xCloud, Gogle, stadia, Goldman Sachs, Apple Card, Project Nightingale, fitbit</media:keywords>
				<media:thumbnail url="https://elroy.twit.tv/sites/default/files/styles/twit_slideshow_400x300/public/images/episodes/810737/hero/edit.00_02_43_46.still004.jpg?itok=VHFdWdpl" width="400" height="225" />
				<media:rating scheme="urn:simple">nonadult</media:rating>
				<media:rating scheme="urn:v-chip">tv-g</media:rating>
				<media:category scheme="urn:iab:categories" label="Technology &amp; Computing">IAB19</media:category>		<media:credit role="anchor person">Leo Laporte</media:credit>
		<media:credit role="reporter">Daniel Rubino</media:credit>
		<media:credit role="reporter">Brian McCullough</media:credit>
		<media:credit role="reporter">Brianna Wu</media:credit>
			</media:content>
		</item>
	</channel>
</rss>
''';
