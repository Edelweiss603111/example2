<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
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
    <main class="content" id="main">
        <section class="first-col">
             <script src="<%@ Page Language="c#"%>
                 <%@ Import Namespace="System.Xml" %>
                 <%
                 var xmlDocument = new XmlDocument();
                 xmlDocument.Load(Server.MapPath("data\\counter.xml"));

                 int counter = int.Parse(xmlDocument.DocumentElement.FirstChild.Value) + 1;
                 xmlDocument.DocumentElement.FirstChild.Value = counter.ToString();
                 xmlDocument.Save(Server.MapPath("data\\counter.xml"));

                 var div = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                 div.Style.Add(HtmlTextWriterStyle.Top, "500px");
                 div.InnerHtml = counter.ToString();
                 this.Controls.Add(div);



                 //var bitmap = new Bitmap(160, 20);
                 //var graphics = Graphics.FromImage(bitmap);
                 //graphics.Clear(Color.White);
                 //graphics.DrawString("Вы посетитель №" + counter, new Font("Arial", 12), new SolidBrush(Color.Red), 0, 0);
                 //Response.ContentType = "image/gif";
        %>">
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
                        class="bigPicture" alt="Морковь" id="1">
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
        </section>
        <section class="third-col"></section>
    </main>
</body>
</html>
