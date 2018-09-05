<%@page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<c:set var="testString" value="${requestScope.testString}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>
<style>
<%@include file='css/leaflet.css' %>
</style>
<style>
<%@include file='css/style.css' %>
</style>

<style>
.center {
    width: 200px; /* Ширина элемента в пикселах */
    padding: 10px; /* Поля вокруг текста */
    margin: auto; /* Выравниваем по центру */
    background: #fc0; /* Цвет фона */
    border-radius:5px;
    -webkit-box-shadow:  0px 0px 15px 0px rgba(0, 0, 0, .45);
  	box-shadow:  0px 0px 15px 0px rgba(0, 0, 0, .45);
   }

  			/* Базовые стили формы */
.form{
  margin:0 auto;
  max-width:95%;
  box-sizing:border-box;
  padding:40px;
  border-radius:5px;
  background:RGBA(255,255,255,1);
  -webkit-box-shadow:  0px 0px 15px 0px rgba(0, 0, 0, .45);
  box-shadow:  0px 0px 15px 0px rgba(0, 0, 0, .45);
}
/* Стили полей ввода */
.textbox{
  height:50px;
  width:100%;
  border-radius:3px;
  border:rgba(0,0,0,.3) 2px solid;
  box-sizing:border-box;
  font-family: 'Open Sans', sans-serif;
  font-size:18px;
  padding:10px;
  margin-bottom:30px;
}
.message:focus,
.textbox:focus{
  outline:none;
   border:rgba(24,149,215,1) 2px solid;
   color:rgba(24,149,215,1);
}
/* Стили текстового поля */
.message{
	background: rgba(255, 255, 255, 0.4);
    width:100%;
    height: 120px;
    border:rgba(0,0,0,.3) 2px solid;
    box-sizing:border-box;
    -moz-border-radius: 3px;
    font-size:18px;
    font-family: 'Open Sans', sans-serif;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    display:block;
    padding:10px;
    margin-bottom:30px;
    overflow:hidden;
}
/* Базовые стили кнопки */
.button{
  height:50px;
  width:100%;
  border-radius:3px;
  border:rgba(0,0,0,.3) 0px solid;
  box-sizing:border-box;
  padding:10px;
  background:#90c843;
  color:#FFF;
  font-family: 'Open Sans', sans-serif;
  font-weight:400;
  font-size: 16pt;
  transition:background .4s;
  cursor:pointer;
}
/* Изменение фона кнопки при наведении */
.button:hover{
  background:#80b438;
}

  .menu {
	background-color:RGB(149, 201, 216);
	color: white;
    font-size: 16px;
    font-weight: bold;
    text-transform: uppercase;
    white-space: nowrap;
    letter-spacing: 1px;
    font-family: 'PT Sans',sans-serif;
    padding-left: 20px;
    padding-top: 17px;
    box-shadow: 2px 2px 6px 0px #333333;
	}

	a {
	color:#000;
	cursor: pointer; cursor: hand;
	}

	a:hover {
		color:#000;
		text-decoration:underline;
	}
</style>


<body style="background-attachment:fixed;" onload="setTimeout(start,200);">

<script>
var prev_id = 'id0';
function show_page(id_page)
{
	document.getElementById(prev_id).style.display = 'none';
	document.getElementById(id_page).style.display = 'block';
	prev_id = id_page;
}
</script>

<div id=id0></div>

<table id="menu" background="pa/hid00000.png" style="position:absolute; left:2%; width:15%; top:2%; z-index:1; font-size:20;">
<tr><td class="menu" style="background-color:#2285e8;"><a href onmousedown="show_page('actions');"> Редактировать акции</a></td></tr>
<tr><td class="menu" style="background-color:#6cb44d;"><a href onmousedown="show_page('products');"> Редактировать товары </a></td></tr>
<tr><td class="menu" style="background-color:#f78f4a;"><a href onmousedown="show_page('add_product');"> Добавить товар </a></td></tr>
<tr><td class="menu" style="background-color:#bf689f;"><a href onmousedown="show_page('add_action');"> Добавить акцию </a></td></tr>
<tr><td class="menu" style="background-color:#3fa8ef;"><a href onmousedown="show_page('add_action');"> Перезвонить </a></td></tr>
<tr><td class="menu" style="background-color:#7ff85f;"><a href onmousedown="show_page('add_action');"> В корзине </a></td></tr>
</table>
                

<div  class="center" name=producti ><b>${testString} Усе акцii кампанii </b></div>

<table  class=form id=show_actions>
<tr><td>Акцii:</td><td><div></div></td></tr>
</table>

<table  class=form id=add_action>
<tr><td>Добавить Акцию:</td><td><div></div></td></tr>
</table>

<table  class=form id=products>
<tr><td>Товары:</td><td><div></div></td></tr>
</table>

<table  class=form id=add_product>
<tr><td>Добавить Товар:</td><td><div></div></td></tr>
</table>

<table  class=form id=basket>//одобреные акции
<tr><td>Перезвонить:</td><td><div></div></td></tr>
</table>


<table class=form id=types_show style='display:none'><tr><td>
<table >
<tr><td>Категории:</td><td><div></div></td></tr>
</table>
</td><td>
<table id=types>//заявки в корзине
<tr><td>Добавить Категорию:</td><td><div></div></td></tr>
</table>
</td><td><a onmousedown="document.getElementById('types_show').style.display='none';">X</a></td></tr>
</table>

<table class=form id=product_actions style='display:none;position:fixed;top:30%;left:30%;width:40%;height:40%;'>
<tr><td>Акции товара: </td><td><div></div></td>
<td>Доступные акции: </td><td><div></div></td>
<td><i style='display:none;'></i></td>
<td><button 
onmousedown='html_action_adder();'>
Добавить акцию</button>
<button 
onmousedown='add_product_action(document.getElementById("product_types").getElementsByTagName("I")[0].innerHTML, document.getElementById("product_types").getElementsByTagName("DIV")[0]);'>
Сохранить</button></td>
<td><a onmousedown='document.getElementById("product_actions").style.display="none";'><b>X</b></a></td></tr>
</table>

<table class=form id=product_types style='display:none;position:fixed;top:20%;left:20%;width:60%;height:60%;'>
<tr><td>Типы товара:  </td><td><div></div></td>
<td>Доступные типы: </td><td><div></div></td>
<td><i style='display:none;'></i></td>
<td><button 
onmousedown='html_type_adder();'>
Добавить акцию</button>
<button 
onmousedown='add_product_type(document.getElementById("product_types").getElementsByTagName("I")[0].innerHTML, document.getElementById("product_types").getElementsByTagName("DIV")[0]);'>
Сохранить</button>
</td>
<td><a onmousedown='document.getElementById("product_types").style.display="none";'><b>X</b></a></td></tr>
</table>

<table class=form id=add style='display:none;position:fixed;top:20%;left:20%;width:60%;height:61%;'>
<tr><td>
<div> </div>
</td><td>
<a onmousedown='document.getElementById("add").style.display="none";'><b>X</b></a>
</td></tr>
</table>


<table class=form id=product_update style='display:none;position:fixed;top:20%;left:10%;width:80%;height:60%;'>
<tr>
<td>Товар:</td><td><input type=text  maxlength="15" class="textbox"></td></tr><tr>
<td>Краткий текст: </td><td><input type=text  maxlength="20" class="textbox"></td></tr><tr>
<td>Большой текст: </td><td><textarea  maxlength="100" class="textbox"></textarea></td></tr><tr>
<td>Цана: </td><td><input type=text maxlength="7" class="textbox"></td></tr><tr>
<td>
<button 
onmousedown='update_product();'>
Сохранить</button>
</td></tr><tr>
<td><FORM ENCTYPE="multipart/form-data" ACTION="uploadFile" METHOD=POST target=self>
						Выберите файл:<INPUT NAME="uploadFile" TYPE="file" accept="image/jpeg,image/png">
						<input type="hidden" name="id_product">
						<INPUT TYPE="submit" VALUE="Загрузить"></FORM></td>
<td><a onmousedown='document.getElementById("product_update").style.display="none";'><b>X</b></a></td>
</tr></table>




<table class=form id=actions_show style='display:none;position:fixed;top:20%;left:20%;width:60%;height:60%;'><tr><td>
<table>
<tr><td>Акции:</td><td><div></div></td></tr>
</table>
</td><td>
<table id=actions>
<tr><td>Выбрать Акцию:</td><td><div></div></td></tr>
</table>
</td><td><a onmousedown="document.getElementById('actions_show').style.display='none';">X</a></td></tr>
</table>



<table class=form id=add_product style='display:none;position:fixed;top:20%;left:10%;width:80%;height:60%;'>
<tr>
<td>Товар:</td><td><input type=text  maxlength="15" class="textbox"></td></tr><tr>
<td>Краткий текст: </td><td><input type=text  maxlength="20" class="textbox"></td></tr><tr>
<td>Большой текст: </td><td><textarea  maxlength="100" class="textbox"></textarea></td></tr><tr>
<td>Цана: </td><td><input type=text maxlength="7" class="textbox"></td></tr><tr>
<td>
<button 
onmousedown='update_product();'>
Сохранить</button>
</td></tr><tr>
<td><FORM ENCTYPE="multipart/form-data" ACTION="uploadFile" METHOD=POST target=self>
						Выберите файл:<INPUT NAME="uploadFile" TYPE="file" accept="image/jpeg,image/png">
						<input type="hidden" name="id_product" value="x">
						<INPUT TYPE="submit" VALUE="Загрузить"></FORM></td>
<td><a onmousedown='document.getElementById("product_update").style.display="none";'><b>X</b></a></td>
</tr></table>


<hr>
<br>
<div  id=add_actions><b>Новая акцыя</b>
<table  class=form>
<tr><td>Назва</td><td><input value="" placeholder="Название акции!" class="textbox" ></td></tr>
<tr><td>Тэкст</td><td><input value="" placeholder="Опишите акцию!" class="textbox" ></td></tr>
<tr><td>Эксп</td><td><input value="" placeholder="!" class="textbox" ></td></tr>
<tr><td>Дата Публiкацii</td><td><input value="" ></td></tr>
<tr><td><button onmousedown='add_actions( this.parentNode.getElementsByTagName("INPUT")[0].value,  this.parentNode.getElementsByTagName("INPUT")[1].value,'+
' this.parentNode.getElementsByTagName("INPUT")[2].value,  this.parentNode.getElementsByTagName("INPUT")[3].value);'>Новая акцыя</button></td><td><input value="" ></td></tr>
</table>
</div>

<hr>
<br>
<button onmousedown="update_shops();">
Obnovit vse shops</button>



<audio id="sound1">
		<source src="images/sound.wav" type="audio/wav">
</audio>

     <button onmousedown="PlaySound('sound1');">Звук!</button>




<%@include file='js/admin_js.jsp' %>

<script>
             document.write("<div id='map' style='width: "+(myWidth/2.1)+"px; height: "+(myHeight/2.1)+"px'></div>");
</script>

<%@include file='js/leaflet.jsp' %>


			<script>/*
             var map;

			function mapping(longt, latt, arr)
			{
					map = L.map('map').setView([latt, longt], 13);

					mapping2(longt, latt, arr)
            }
            function mapping2(longt, latt, arr)
            {            len = document.getElementsByClassName('leaflet-shadow-pane')[0].childNodes.length-1;
                 for (;len >= 0; len--)
                 {
                 document.getElementsByClassName('leaflet-shadow-pane')[0].removeChild(document.getElementsByClassName('leaflet-shadow-pane')[0].childNodes[len]);
                 document.getElementsByClassName('leaflet-marker-pane')[0].removeChild(document.getElementsByClassName('leaflet-marker-pane')[0].childNodes[len]);
                 }

			L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
			maxZoom: 18,
			attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
				'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
				'Imagery © <a href="http://mapbox.com">Mapbox</a>',
			id: 'mapbox.streets'
		}).addTo(map);

						for (i = 0; i < arr.length; i++)
						{
						L.marker([arr[i][1], arr[i][0]]).addTo(map)
							.bindPopup("<a href='absolutbank.by'>" + arr[i][2]+"</a>").openPopup();
						}

					var popup = L.popup();

					function onMapClick(e) {
						popup
							.setLatLng(e.latlng)
							.setContent("Координата точки " + e.latlng.toString())
							.openOn(map);

							myplace(e.latlng.toString());
					}

					L.marker([latt, longt]).addTo(map)
						.bindPopup("<b>Я здесь!</b><br />это точно").openPopup();

					map.on('click', onMapClick);
			}

                                                          arr = [[27.6200,53.9300,"касса2"], [27.6000,53.9000,"касса1"], [27.6100,53.9200,"банкомат1"]];
			                          mapping(27.6200,53.9300,arr);

			                           mapping2(27.6200,53.9300,arr);
                                        var prev_act_s = document.getElementById('nul');*/
			       /*     function poper(i)
			            {
			            var evt = document.createEvent("HTMLEvents");
						evt.initEvent("click", true, true);
			            document.getElementsByClassName('leaflet-marker-pane')[0].getElementsByTagName('IMG')[i].dispatchEvent(evt);
			            }         */

				</script>



