<%-- 
    Document   : index
    Created on : Aug 21, 2013, 11:04:48 PM
    Author     : aadong
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Free SMS</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   
        <link href="resources/css/custom.css" rel="stylesheet" type="text/css"/>   
        <script type="text/javascript" src="resources/js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script> 
        <script type="text/javascript">

            google.load("feeds", "1");

            function initialize() {
                var feed = new google.feeds.Feed("http://www.phcorner.net/forums/-/index.rss");
                feed.load(function(result) {
                    if (!result.error) {
                        console.log(result.feed);
                        for (var i = 0; i < result.feed.entries.length; i++) {
                            var entry = result.feed.entries[i];
                            var title = document.createTextNode(entry.title);
                            var link = document.createTextNode(entry.link);
                            var contentSnippet = entry.contentSnippet;
                            $("#feeddiv").append('<a href="' + link.textContent + '" target="_blank">' + title.textContent + '</a><br/>');
                             $("#feeddiv").append(contentSnippet + "<br/><br/>");
                        }
                    }
                });
            }
            google.setOnLoadCallback(initialize);

        </script>

    </head>
    <body class="container-fluid">
        <div class="row">
            <div class="span12" style="float: none; margin: 0 auto;">
                <div class="row" style="margin: 0"> 
                </div>
                <div class="navbar">
                    <div class="navbar-inner">
                        <a class="brand" href="#">BubbleSMS</a>
                        <ul class="nav">
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="#">Buy Ebooks</a></li>
                            <li><a href="#">Contact Us</a></li>
                        </ul>   
                        <div class="pull-right label label-warning" style="margin-top: 3px"> 
                            BETA!<br/>
                            This will work very soon.
                        </div>
                    </div> 
                </div>  
                <div class="row" style="margin: 0"> 
                </div>
                <div class="row" style="margin: 0">
                    <div class="span6" style="margin: 0">
                        <h4>Gisele Bündchen named as world's highest paid model (again)</h4>
                        <p  style="text-align: justify; text-indent: 20px;">The Brazilian supermodel has been listed as the highest earning star in Forbes Magazine's annual review for the seventh year running. 
                            The 33-year-old model has certainly brought home the bacon over the past 12 months with an estimated combined salary of $42 million, as listed in the annual report into supermodel earnings by Forbes Magazine. 
                            Lucrative modeling contracts with H&M, Pantene, Oral-B and Sky HDTV and her role as the face of Chanel's 'Les Beiges' cosmetics line have all contributed to this enormous total. The figure dwarfs that of second placed supermodel, Australian Victoria's Secret star Miranda Kerr, who comes in at just over $7 million. 
                            Impressive as they are, Bündchen's latest earnings don't quite match last year's total of $45 million, which is perhaps accounted for by the time she took off to give birth to her youngest daughter Vivian, her second child with NFL quarterback Tom Brady. 
                            Other notable figures in the list include British star Kate Moss, who is still earning a multimillion-dollar salary from her modeling contracts (including Versace and Rimmel) at the age of 39, and emerging Chinese superstar Liu Wen (aged just 25), who is the first Chinese model to star in a Victoria's Secret fashion show. </p>
                        <h5 class="pull-right">~Yahoo!</h5>
                    </div>
                    <div class="span4" style="padding-right: 5px;"> 
                        <div class="box pull-left">
                            <form>
                                <legend>Send free SMS to the Philippines!</legend>  
                                <label for="mobile_no">Mobile No.</label>
                                <div class="form-inline">
                                    <label>+63</label>
                                    <input type="text" name="mobile_no" placeholder="Type recipient mobile no..."/>
                                </div> 
                                <label style="height: 5px">&nbsp;</label>
                                <label for="message">Message</label>  
                                <textarea  style="width: 19em; height: 10em;" name="message" placeholder="Type your message..."></textarea>
                                <label id="char_left" class="label label-info">160 characters left.</label> 
                                <label style="height: 5px">&nbsp;</label>
                                <input type="submit" value="Send Message" id="send" class="btn btn-primary"/>
                            </form>
                        </div> 
                        <div class="">  
                        </div>
                    </div>
                    <div class="offset10 span2" style="margin: 0; text-align: justify;"> 
                        <div id="feeddiv" class="feed-container">  
                            <p class="label label-info">PHCorner Feeds</p>
                            <a href="http://www.phcorner.net/" target="_blank"><li class="icon-check"></li></a><br/>
                        </div>  
                    </div>
                </div>
                <div class="row" style="margin: 0">
                    <div class="span12" style="margin: 0">
                        <hr/>
                        &copy; 2012 BubbleSMS 
                        <div class="pull-right" style="padding: 0">
                            <a href="#">Home</a> <a href="#">Buy Ebooks</a> <a href="#">Contact Us</a> <a href="#">Terms & Policies</a>
                        </div>
                    </div>
                </div>
            </div>  
        </div> 
    </body> 
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/js/home/index.js"></script> 
</html>
