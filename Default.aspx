<%@ Page Language="c#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"%>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Xml" %>
<%
        var xmlDocument = new XmlDocument();
        xmlDocument.Load(Server.MapPath("~/data/counter.xml"));

        var address = File.ReadAllLines(Server.MapPath("~/data/addr.txt"));
        var addrHashSet = new HashSet<string>(address);
        bool isExist = addrHashSet.Contains(Request.ServerVariables["REMOTE_ADDR"]);
        int counter = int.Parse(xmlDocument.DocumentElement.FirstChild.Value);
        
        if (!isExist)
        {
            counter++;
            xmlDocument.DocumentElement.FirstChild.Value = counter.ToString();
            File.AppendAllText(Server.MapPath("~/data/addr.txt"), Request.ServerVariables["REMOTE_ADDR"]+"\n");
            xmlDocument.Save(Server.MapPath("~/data/counter.xml"));
        }
        counterLabel.Text = counter.ToString();
        var opinion = File.ReadAllLines(Server.MapPath("~/data/comments.txt"));

        for (var i = 0; i < opinion.Length; i++)
        {
            var label = new Label();
            label.Text = opinion[i];
            Panel1.Controls.Add(label);
            Panel1.Controls.Add(new LiteralControl("<br>"));
        }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Портфолио</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="index.css">
    <script type='text/javascript'>
        var bigSlideId = 0;
        function bigpicture(slideId) {
            bigSlideId = parseInt(slideId);
            var slide = document.getElementById(bigSlideId.toString());
            slide.style.display = 'block';
            var background = document.getElementsByClassName('blackout');
            background[0].style.display = 'block';
        }

        function visit(count) {
            var body = document.body;
            var counter = document.createElement('div')
            var text = document.createTextNode(count);
            counter.style.top = '500px';
            counter.style.left = '10px';
            body.appendChild(counter);
            counter.appendChild(text);
        }
        function control() {
            if (event.keyCode === 27) {
                var slide = document.getElementById(bigSlideId.toString());
                slide.style.display = 'none';
                var background = document.getElementsByClassName('blackout');
                background[0].style.display = 'none';
                bigSlideId = 0;
            }
            if (event.keyCode === 37 && bigSlideId > 1) {
                var slide = document.getElementById(bigSlideId.toString());
                slide.style.display = 'none';
                bigSlideId -= 1;
                var slide = document.getElementById(bigSlideId.toString());
                slide.style.display = 'block';
            }
            if (event.keyCode === 39) {
                var slide = document.getElementById(bigSlideId.toString());
                var new_slide = document.getElementById((bigSlideId+1).toString());
                if (new_slide !== null) {
                    slide.style.display = 'none';
                    bigSlideId += 1;
                    var slide = document.getElementById(bigSlideId.toString());
                    slide.style.display = 'block';
                }
            }
        }
    </script>
</head>
<body onkeydown='control()'>
    <nav class="navigation">
        <div class="menu-items menu-item1">
            <a href="#main">Главная</a>
        </div>
        <div class="menu-items menu-item2">
            <a href="#gallery">Галерея</a>
        </div>
        <div class="menu-items menu-item3">
            <a href="#links">Cсылки</a>
        </div>
    </nav>
    <main class="content" id="main">
        <section class="first-col">
        </section>
        <section class="second-col">
            <section id="main" class="main-info">
                <img src="main.jpg" alt="My photo" class="main-photo">
                <div class="main-text">
                    <h2>Добро пожаловать на мой сайт!</h2>
                    <p>Меня зовут Варюхина Арина. В данный момент я учусь на 3 курсе института математики и
                        компьютерных наук УрФУ по специальности математика и компьютерные науки</p>
                </div>
            </section>
            <section id="gallery" class="gal">
                <section class="slide1" onclick="bigpicture('1')" onkeydown='control()'>
                    <article class="slides slide1">
                        <img src="images/slide6.jpg" class="picture" alt="">
                    </article>
                    <img src="images/slide6.jpg"
                        class="bigPicture" alt="" id="1">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide2" onclick="bigpicture('2')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide30.jpg" class="picture" alt="">
                    </article>
                    <img src="images/slide30.jpg"
                        class="bigPicture" alt="" id="2">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide3"  onclick="bigpicture('3')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide2.jpg" class="picture" alt="">
                    </article>
                    <img src="images/slide2.jpg"
                        class="bigPicture" alt="" id="3">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide4" onclick="bigpicture('4')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide13.jpg" class="picture" alt="">
                    </article>
                    <img src="images/slide13.jpg"
                        class="bigPicture" alt="" id="4">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide5" onclick="bigpicture('5')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide21.jpg" class="picture" alt="">
                    </article>
                    <img src="images/slide21.jpg"
                        class="bigPicture" alt="" id="5">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide6" onclick="bigpicture('6')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide22.jpg" class="picture" alt="">
                    </article>
                    <img src="images/slide22.jpg"
                        class="bigPicture" alt="" id="6">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide7" onclick="bigpicture('7')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide16.jpg"
                            class="picture" alt="">
                    </article>
                    <img src="images/slide16.jpg"
                        class="bigPicture" alt="" id="7">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide8" onclick="bigpicture('8')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide36.jpg" class="picture" alt="">
                    </article>
                    <img src="images/slide36.jpg"
                        class="bigPicture" alt="" id="8">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide9" onclick="bigpicture('9')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide4.jpg" class="picture" alt="">
                    </article>
                    <img src="images/slide4.jpg"
                        class="bigPicture" alt="" id="9">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide10" onclick="bigpicture('10')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide20.jpg" class="picture" alt="">
                    </article>
                    <img src="images/slide20.jpg"
                        class="bigPicture" alt="" id="10">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide11" onclick="bigpicture('11')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide8.jpg"
                            class="picture" alt="">
                    </article>
                    <img src="images/slide8.jpg"
                        class="bigPicture" alt="" id="11">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide12" onclick="bigpicture('12')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide5.jpg"
                            class="picture" alt="">
                    </article>
                    <img src="images/slide5.jpg"
                        class="bigPicture" alt="" id="12">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide13" onclick="bigpicture('13')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide37.jpg" class="picture" alt="">
                    </article>
                    <img src="images/slide37.jpg"
                        class="bigPicture" alt="" id="13">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide14" onclick="bigpicture('14')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide31.jpg" class="picture" alt="">
                    </article>
                    <img src="images/slide31.jpg"
                        class="bigPicture" alt="" id="14">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide15" onclick="bigpicture('15')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide17.jpg"
                            class="picture" alt="">
                    </article>
                    <img src="images/slide17.jpg"
                        class="bigPicture" alt="" id="15">
                    <div class="blackout">
                    </div>
                </section>
                <section class="slide16" onclick="bigpicture('16')" onkeydown='control()'>
                    <article class="slides">
                        <img src="images/slide33.jpg"
                            class="picture" alt="">
                    </article>
                    <img src="images/slide33.jpg"
                        class="bigPicture" alt="" id="16">
                    <div class="blackout">
                    </div>
                </section>
            </section>
            <section id="links" class="links">
                <a href="http://urfu.ru/">Уральский федеральный университет</a>
                <a href="http://imkn.urfu.ru/">Институт математики и компьютерных наук УрФУ</a>
                <div>Связаться со мной:</div>
                <a href="https://vk.com/id50889898">Vk</a>
                <a href="mailto:arinavaruhina@gmail.com">Электронная почта</a>
            </section>
            <section id="count" class="count"> Вы
                <asp:Label Text="0" ID="counterLabel" runat="server"></asp:Label>
                посетитель.
            </section>
            <form id="form1" runat="server" class="form1">
                <div>
                    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
                    <script type='text/javascript'>
                        function sendOpinion() {
                            $.ajax({
                                type: "POST",
                                url: "Default.aspx/sendOpinion",
                                data: '{opinionText: "' + $("#<%=textInputField.ClientID%>")[0].value + '" }',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: OnSuccess,
                                failure: function (response) {
                                    alert(response.d);
                                }
                            });
                        }
                        function OnSuccess(response) {
                            if (response.d !== ""){
                                var parentDiv = document.getElementById("Panel1");
                                var newlabel = document.createElement("Label");
                                newlabel.innerHTML = response.d;
                                parentDiv.appendChild(newlabel);
                                parentDiv.appendChild(document.createElement("br"));
                                var textbox = document.getElementById("textInputField");
                                textbox.value = "";
                            }
                        }
                    </script>
                    <asp:TextBox runat="server" ID ="textInputField"/>
                    <input value="Отправить отзыв" type="button" id="btnSendOpinion" onclick="sendOpinion()" /><br />
                    <asp:Panel runat="server" ID="Panel1"> 
                        <asp:Label runat="server" Text="" ID="opinionText"></asp:Label>
                    </asp:Panel>     
                </div>          
            </form>
        </section>
        <section class="third-col"></section>
    </main>
</body>
</html>
