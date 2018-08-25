<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
    
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />

<style>
<%@include file='css/leaflet.css' %>
</style>
<style>
<%@include file='css/style.css' %>
</style>
<style>
<%@include file='css/default.css' %>
</style>
<style>
<%@include file='css/component.css' %>
</style>
<style>
<%@include file='css/sait.css' %>
</style>

<jsp:include page="js/prefixfree.min.jsp" />

<body onload="start();">
<div style='display:none'>
<div id=start_point><c:out value="${requestScope.start_point}"></c:out></div>
<div id=i_m_here><c:out value="${requestScope.i_m_here}"></c:out></div>
<div id=reg_str><c:out value="${requestScope.registration}"></c:out></div>
<div id=exit><c:out value="${requestScope.exit}"></c:out></div>
<div id=enter><c:out value="${requestScope.enter}"></c:out></div>
<script>
start_point=document.getElementById('start_point').innerHTML;
i_m_here=document.getElementById('i_m_here').innerHTML;
reg_str=document.getElementById('reg_str').innerHTML;
exit=document.getElementById('exit').innerHTML;
enter=document.getElementById('enter').innerHTML;
</script>
</div>


<div id='msg' style='display:none;top:35%;left:35%;height:30%;width:30%;position:fixed;z-index:10001;color:white;box-shadow: 2px 2px 6px 0px #333333;background-color:gray;'>
<br><br>
<div  id='msg_text'></div><br> <button><c:out value="${requestScope.yes}"></c:out> </button> <button><c:out value="${requestScope.no}"></c:out> </button></div>

<script>/*
<div id=qr_req onmousedown='qr_req_bool=true;' 
style='top:20%;left:20%;background-color:yellow;width:60%;height:60%;position:absolute;z-index:10000;box-shadow: 2px 2px 6px 0px #333333;'>
<a style='top:5%;left:90%;position:absolute;z-index:10000;box-shadow: 2px 2px 6px 0px #333333;'
onmousedown='this.parentNode.style.display="none";'><img src=images/del1.png></a>
<br>
Свяжите приложение и сайт! Вы можете подключать страницы, открытые в нескольких браузерах. Для этого отсканируйте приложением QR-код телефоном
<br>
Скачать приложение Android:   IPhone:
<br>
<a href='admin.jsp'>Admin</a>
</div>*/
</script>

<div id=qr_shower onmousedown='qr_shower_bool=true;' 
style='display:none;top:20%;left:20%;background-color:yellow;width:60%;height:60%;position:absolute;z-index:10000;box-shadow: 2px 2px 6px 0px #333333;'>
<a style='top:5%;left:90%;position:absolute;z-index:10000;box-shadow: 2px 2px 6px 0px #333333;'
onmousedown='this.parentNode.style.display="none";'><img src=images/del1.png></a>
<br>
<c:out value="${requestScope.link_message}"></c:out>
<br>
</div>




<div id=menu  style="display:block;width:90%;height:6%;left:5%;top:50%;position:absolute;" onmousedown="prev_id_show=true;">
 <div class="menu" style="left:0%;background-color:#2285e8;"
 onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('sport').style.display='block'; prev_id='sport';"><a><c:out value="${requestScope.sport}"></c:out></a></div>
  <div class="menu" style="left:12.5%;background-color:#6cb44d;"
  onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('electronica').style.display='block'; prev_id='electronica';"><a><c:out value="${requestScope.electronics}"></c:out> </a></div>
   <div class="menu" style="left:25%;background-color:#f78f4a;"
    onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('krasota').style.display='block'; prev_id='krasota';"><a><c:out value="${requestScope.beauty}"></c:out></a></div>
   <div class="menu" style="left:37.5%;background-color:#6a6d9e;"
    onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('odezda').style.display='block'; prev_id='odezda';"><a><c:out value="${requestScope.clothing}"></c:out></a></div>
   <div class="menu" style="left:50%;background-color:#dc0505;"
    onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('auto').style.display='block'; prev_id='auto';"><a><c:out value="${requestScope.auto}"></c:out></a></div>
   <div class="menu" style="left:62.5%;background-color:#ffdf00;"
    onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('technika').style.display='block'; prev_id='technika';"><a><c:out value="${requestScope.equipment}"></c:out></a></div>
   <div class="menu" style="left:75%;background-color:#ff5e55;"
    onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('stroyka').style.display='block'; prev_id='stroyka';"><a><c:out value="${requestScope.building}"></c:out></a></div>
   <div class="menu" style="left:87.5%;background-color:#db4c3f;"
    onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('eda').style.display='block'; prev_id='eda';"><a><c:out value="${requestScope.cafe}"></c:out></a></div>
 </div>

 <div id=menu_phone  style="display:none;width:90%;height:100%;left:10%;top:0%;position:fixed;z-index:100;" onmousedown="prev_id_show=true;">
 <div class="menu" style="top:0%;left:0%;width:50%;height:25%;background-color:#2285e8;"
 onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('sport').style.display='block'; prev_id='sport'; menu_level=1;"><a><c:out value="${requestScope.sport}"></c:out></a></div>
  <div class="menu" style="top:0%;left:50%;width:50%;height:25%;background-color:#6cb44d;"
  onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('electronica').style.display='block'; prev_id='electronica'; menu_level=1;"><a><c:out value="${requestScope.electronics}"></c:out> </a></div>
   <div class="menu" style="top:25%;left:0%;width:50%;height:25%;background-color:#f78f4a;"
    onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('krasota').style.display='block'; prev_id='krasota'; menu_level=1;"><a><c:out value="${requestScope.beauty}"></c:out></a></div>
   <div class="menu" style="top:25%;left:50%;width:50%;height:25%;background-color:#6a6d9e;"
    onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('odezda').style.display='block'; prev_id='odezda'; menu_level=1;"><a><c:out value="${requestScope.clothing}"></c:out></a></div>
   <div class="menu" style="top:50%;left:0%;width:50%;height:25%;background-color:#dc0505;"
    onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('auto').style.display='block'; prev_id='auto'; menu_level=1;"><a><c:out value="${requestScope.auto}"></c:out></a></div>
   <div class="menu" style="top:50%;left:50%;width:50%;height:25%;background-color:#ffdf00;"
    onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('technika').style.display='block'; prev_id='technika'; menu_level=1;"><a><c:out value="${requestScope.equipment}"></c:out></a></div>
   <div class="menu" style="top:75%;left:0%;width:50%;height:25%;background-color:#ff5e55;"
    onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('stroyka').style.display='block'; prev_id='stroyka'; menu_level=1;"><a><c:out value="${requestScope.building}"></c:out></a></div>
   <div class="menu" style="top:75%;left:50%;width:50%;height:25%;background-color:#db4c3f;"
    onmousedown=" document.getElementById(prev_id).style.display='none';document.getElementById('eda').style.display='block'; prev_id='eda'; menu_level=1;"><a><c:out value="${requestScope.cafe}"></c:out></a></div>
 </div>
 
<div style="position:fixed;top:1%;left:70%;height:7%;width:20%;background-color:#f78f4a;z-index:1;">
<select onchange="local_leng(this.value);">
<option value='ru'>RU</option>
<option value='by'>BY</option>
<option value='en'>EN</option>
</select>
</div>

<div class="menu" id=vhod style="position:fixed;top:10%;left:70%;height:7%;width:20%;background-color:#f78f4a;z-index:1;">
<a><c:out value="${requestScope.enter}"></c:out></a></div>
<script>
document.getElementById('vhod').onmousedown = function(){ 
	registraciya=true; 
	if (this.innerHTML == '<a> ${requestScope.exit}</a>') { 
		set_cookie('session_id', ''); 
		set_cookie('user_bool', 'false');
		this.innerHTML = '<a> ${requestScope.enter}</a>';  
		document.getElementById('registraciya').style.display='none'; 
		location.reload();
		} else 
		{ 
		/*	document.getElementById('front-sign-in').style.display = 'block'; 
			document.getElementById('back-sign-up').style.display = 'none';  */
			document.getElementById('registraciya').style.display='block'; 
			document.getElementById('login').style.display='none'; 
			setTimeout( function(){ focus_el = document.getElementById('lgn2'); focus_el.focus();},100); 
		}
	
}
</script>
<div >
<table class="table_poshuk">
<tr><td style="position:relative;width:80%;" align="left" class=mid_text>
<input size="30" style="width:100%;" id=inputSearch onkeyup="searchLike(this.value);enter_submit='poshuk';"  />
</td><td style="position:relative;width:20%;">
<button onmousedown="search_text=document.getElementById('inputSearch').value;search_bool=true;search(1);"
 class="btn btn-1 btn-1a"><img src="images\search1.png"/></button>
</td></tr>
<tr><td colspan=2>
<table width=100%><tr><td width=25%>
<div id=filtr style="display:block;z-index:9999;">
<table style="color:white;"><tr><td rowspan=2>
Цена </td><td>
Min: </td><td><input size="5" onkeyup="cana_min=this.value; clearTimeout(cana_timeout_id); cana_timeout_id=setTimeout(upd_cana,1500);enter_submit='poshuk';" value=0 class=input_filtr>
</td></tr>
<tr><td>
Max: </td><td><input size="5" onkeyup="cana_max=this.value; clearTimeout(cana_timeout_id); cana_timeout_id=setTimeout(upd_cana,1500);enter_submit='poshuk';" value=0 class=input_filtr>
</td></tr></table>
</a></td>
<td width=25%><a><p onmousedown='if (this.innerHTML == "Начиная с max цены &#9660;"){sort_cana_dir = "DESC";strelka("Начиная с min цены ",this);}else{sort_cana_dir = "ASC";strelka("Начиная с max цены ",this);}'>Начиная с max цены &#9660;</p>
<p style='display:none;'>
</p></a></td>
<td width=25%>
<a>
<p style='display:none;'></p></a></div>
</td>
<td width=25%><a><p onmousedown='strelka("Доп. фильтры ",this);'>Доп. фильтры &#9660;</p><p style='display:none;'>
</p>
</a></td></tr></table>
</tr>
<tr><td colspan=2>
<table id=searchLike 	style="width:80%;left:10%;top:50%; background-color:RGB(251, 251, 0);">searchLike</table>
</td></tr> </table>
</div>

<style>
.arrow {
font-weight:bold;
color:#000;
}
.no_arrow {
font-weight:bold;
color:#aaaaff;
}
</style>
<div style="width:77.2%;height:40%;left:10%;top:61%;position:absolute; background-color:RGB(201, 16, 209);box-shadow: 2px 2px 3px 2px rgba(0, 0, 0, .45);">
<div id=search>
55555 </div>
<table id='panel'><tr>
<td class='no_arrow'><<</td>
<td onmousedown='change_page(this.page);'>1</td>
<td  class='arrow' >>></td></tr><table>
</div><div id=hidden_pages style='display:none;'></div>


<style>
<%@include file='js/leaflet.jsp' %>
</style>

				
 <div id="sport" class="plitka" style="background-color:#418cce;z-index:102;" onmousedown="prev_id_show=true">
  <table id=table_sport width=100%>
  <tr><td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('sport1');document.getElementById(prev_id).style.display='none';">Тренажеры</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('sport2');document.getElementById(prev_id).style.display='none';">Спортзалы</a>
  </td></tr>
  <tr><td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('sport3');document.getElementById(prev_id).style.display='none';">Танцы</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('sport4');document.getElementById(prev_id).style.display='none';">Питание</a>
  </td></tr>
  <tr><td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('sport5');document.getElementById(prev_id).style.display='none';">Одежда</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('sport6');document.getElementById(prev_id).style.display='none';">Аксессуары</a>
  </td></tr></table></div>

 <div id="electronica" class="plitka"  style="background-color:#0bf689f;z-index:102;" onmousedown='prev_id_show=true;'>
 <table id=table_electronica width=100%>
  <tr><td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('electronica1');document.getElementById(prev_id).style.display='none';">Телевизоры</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('electronica2');document.getElementById(prev_id).style.display='none';">Ноутбуки</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('electronica3');document.getElementById(prev_id).style.display='none';">Мобильные телефоны</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('electronica4');document.getElementById(prev_id).style.display='none';">Кондиционеры</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('electronica5');document.getElementById(prev_id).style.display='none';">Фотоаппараты</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('electronica6');document.getElementById(prev_id).style.display='none';">Планшеты</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('electronica7');document.getElementById(prev_id).style.display='none';">Умный дом</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('electronica8');document.getElementById(prev_id).style.display='none';">Навигаторы</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('electronica9');document.getElementById(prev_id).style.display='none';">Аудиотехника</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('electronica10');document.getElementById(prev_id).style.display='none';">Музыкально оборудование</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('electronica11');document.getElementById(prev_id).style.display='none';">Квадрокоптеры</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('electronica12');document.getElementById(prev_id).style.display='none';">Хобби-модели</a>
  </td></tr></table></div>

 <div id="krasota" class="plitka" style="background-color:#f78f4a;z-index:102;" onmousedown='prev_id_show=true;'>
 <table id=table_krasota width=100%>
 <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('krasota1');document.getElementById(prev_id).style.display='none';">Салоны</a></td>
  <td width=50%  align="left">
   <a onmousedown="menu_level=2;menu('krasota2');document.getElementById(prev_id).style.display='none';">Парикмахерская</a>
   </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('krasota3');document.getElementById(prev_id).style.display='none';">Маникюр</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('krasota4');document.getElementById(prev_id).style.display='none';">Стоматология</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('krasota5');document.getElementById(prev_id).style.display='none';">Тату-салоны</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('krasota6');document.getElementById(prev_id).style.display='none';">Массаж</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('krasota7');document.getElementById(prev_id).style.display='none';">Косметология</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('krasota8');document.getElementById(prev_id).style.display='none';">krasota1</a>
  </td></tr>
  </table>  </div>

   <div id="odezda" class="plitka"  style="background-color:#6a6d9e;z-index:102;" onmousedown='prev_id_show=true;'>
   <table id=table_odezda width=100%>
   <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('odezda1');document.getElementById(prev_id).style.display='none';">Мужские брюки</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('odezda2');document.getElementById(prev_id).style.display='none';">Мужские куртки</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('odezda3');document.getElementById(prev_id).style.display='none';">Мужские джинсы</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('odezda4');document.getElementById(prev_id).style.display='none';">Мужские майки</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('odezda5');document.getElementById(prev_id).style.display='none';">Мужские рубашки</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('odezda6');document.getElementById(prev_id).style.display='none';">Мужские свитера</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('odezda7');document.getElementById(prev_id).style.display='none';">Костюмы</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('odezda8');document.getElementById(prev_id).style.display='none';">Спортивные костюмы</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('odezda9');document.getElementById(prev_id).style.display='none';">Свадебный гардероб</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('odezda10');document.getElementById(prev_id).style.display='none';">Женские брюки</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('odezda11');document.getElementById(prev_id).style.display='none';">Женские куртки</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('odezda12');document.getElementById(prev_id).style.display='none';">Женские джинсы</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('odezda13');document.getElementById(prev_id).style.display='none';">Женские майки</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('odezda14');document.getElementById(prev_id).style.display='none';">Женские рубашки</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('odezda15');document.getElementById(prev_id).style.display='none';">Женские свитеры</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('odezda16');document.getElementById(prev_id).style.display='none';">Блузки</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('odezda17');document.getElementById(prev_id).style.display='none';">Костюмы</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('odezda18');document.getElementById(prev_id).style.display='none';">Платья</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('odezda19');document.getElementById(prev_id).style.display='none';">Спортивные костюмы</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('odezda20');document.getElementById(prev_id).style.display='none';">Шубы</a>
  </td></tr>
  </table>  </div>

   <div id="auto" class="plitka"  style="background-color:#e87285;z-index:102;" onmousedown='prev_id_show=true;'>
   <table id=table_auto width=100%>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('auto1');document.getElementById(prev_id).style.display='none';">Шины</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('auto2');document.getElementById(prev_id).style.display='none';">Мойки</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('auto3');document.getElementById(prev_id).style.display='none';">Аккумуляторы</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('auto4');document.getElementById(prev_id).style.display='none';">Заправки</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('auto5');document.getElementById(prev_id).style.display='none';">Замена масла</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('auto6');document.getElementById(prev_id).style.display='none';">Диагностика</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('auto7');document.getElementById(prev_id).style.display='none';">Сервис</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('auto8');document.getElementById(prev_id).style.display='none';">Запчасти</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('auto9');document.getElementById(prev_id).style.display='none';">Эвакуация</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('auto10');document.getElementById(prev_id).style.display='none';">auto1</a>
  </td></tr></table>  </div>

   <div id="technika"  class="plitka"  style="background-color:#6cb44d;z-index:102;" onmousedown='prev_id_show=true;'>
   <table id=table_technika width=100%>
   <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('technika1');document.getElementById(prev_id).style.display='none';">Духовые шкафы</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('technika2');document.getElementById(prev_id).style.display='none';">Плиты</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('technika3');document.getElementById(prev_id).style.display='none';">Посудомоечные машины</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('technika4');document.getElementById(prev_id).style.display='none';">Кофеварки</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('technika5');document.getElementById(prev_id).style.display='none';">Хлебопечки</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('technika6');document.getElementById(prev_id).style.display='none';">Комбайны</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('technika7');document.getElementById(prev_id).style.display='none';">Мультиварки</a></td>
  </tr></table>  </div>

   <div id="hobby"  class="plitka"  style="background-color:#418cce;z-index:102;" onmousedown='prev_id_show=true;'>
   <table id=table_hobby width=100%>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('stroyka1');document.getElementById(prev_id).style.display='none';">Светильники</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('stroyka2');document.getElementById(prev_id).style.display='none';">Кухни</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('stroyka3');document.getElementById(prev_id).style.display='none';">Корпуснвя мебель</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('stroyka4');document.getElementById(prev_id).style.display='none';">Мягкая мебель</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('stroyka5');document.getElementById(prev_id).style.display='none';">Обои</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('stroyka6');document.getElementById(prev_id).style.display='none';">Напольные покрытия</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('stroyka7');document.getElementById(prev_id).style.display='none';">Электирика</a></td>
  <td width=50%  align="left">
  <a onmousedown="menu_level=2;menu('stroyka8');document.getElementById(prev_id).style.display='none';">Инструмент</a>
  </td></tr>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('stroyka9');document.getElementById(prev_id).style.display='none';">Краски, лаки</a></td>
  </tr></table>  </div>

   <div id="eda"  class="plitka"  style="background-color:#e87285;z-index:102;">
   <table id=table_eda width=100%>
  <tr><td width=50%  align="left"><a onmousedown="menu_level=2;menu('eda1');document.getElementById(prev_id).style.display='none';">eda1</a></td>
  <td width=50%  align="left">
  <a onmousedown="document.getElementById(prev_id).style.display='none';" style="position:relative;left:80%;"><img src=images/del1.png></a>
  </td></tr></table>  </div>


<div id=nul></div>
	
	
	
	
	
	
	
	
	
	

<title>Eximer</title>

<style>
   <%@include file='css/cube.css' %>
</style>
</head>
<body onload='start();'>

<button onmousedown='one_page()' style='position:fixed;left:800px;top:=20px;'>one_page</button>






<script>/*
<div style='top:40%;position:absolute;width:20%;left:40%;height:40%;background-color:rgba(255, 150, 100, 0.5);display:none;' id=login> 
<table><tr><td>Логин</td><td><input type=text></td></tr>
	<tr><td>Пароль</td><td><input type=password></td></tr>
	<tr><td colspan=2><button 
	onmousedown='signIn(document.getElementById("login").getElementsByTagName("INPUT")[0].value,document.getElementById("login").getElementsByTagName("INPUT")[1].value);'
	>войти</button></td></tr>
</table>
</div>
<div style='top:40%;position:absolute;width:20%;left:40%;height:40%;background-color:rgba(255, 150, 100, 0.5);display:none;' id=registration> 
	<table><tr><td>Логин</td><td><input type=text onkeyup='test_login(this.value);'></td><td id=test_login></td></tr>
		<tr><td>Пароль</td><td><input type=password onkeyup='test_parol(this.value);'></td><td id=test_parol></td></tr>
		<tr><td colspan=2><button 
			onmousedown='registration(document.getElementById("registration").getElementsByTagName("INPUT")[0].value,document.getElementById("registration").getElementsByTagName("INPUT")[1].value);'
				'>регистрация</button></td></tr>
	</table>
</div>

<div style='top:1%;position:absolute;width:10%;left:80%;height:10%;background-color:rgba(255, 150, 100, 0.5);display:none;' id=logout> 
<a onmousedown=" set_cookie( 'session_id', ''); start();"> 
выйти</a>
</div>
*/</script>




<div id='registraciya' onmousedown="registraciya=true;" style="position:fixed;top:30%;left:25%;width:50%;height:30%;background-color:#f78f4a;display:none;z-index:1;">

  <div class="back-sign-up" id="login" style="display:none;">
	    <input type="text" placeholder="<c:out value="${requestScope.login}"></c:out>" id=lgn onblur='focus_el=document.getElementById("prl"); focus_el.focus();'>
	    <input type="password" placeholder="<c:out value="${requestScope.password}"></c:out>" id=prl onblur='focus_el=document.getElementById("vjt"); focus_el.focus();'>
	    <br><button class="signin-submit"  id=vjt
	    onmousedown="signIn(this.parentNode.getElementsByTagName('INPUT')[0].value,this.parentNode.getElementsByTagName('INPUT')[1].value);">
	    <c:out value="${requestScope.enter}"></c:out></button>
        <br>
		  <a class="h2"  id="form-switch"
		  onmousedown="document.getElementById('registration').style.display = 'block'; document.getElementById('login').style.display = 'none'; setTimeout( function(){ focus_el = document.getElementById('lgn2'); focus_el.focus();},100);"
		  ><c:out value="${requestScope.registration}"></c:out>!</a>
  </div>
  <div class="front-sign-in" id="registration"  style="display:block;">
	    <input type="text" placeholder="<c:out value="${requestScope.login}"></c:out>" onkeyup="test_login(this.value);" id=lgn2  
	    onblur='focus_el=document.getElementById("prl2"); focus_el.focus();'>
	    <input type="text" placeholder="<c:out value="${requestScope.password}"></c:out>" onkeyup="test_parol(this.value);" id=prl2 
	    onblur='focus_el=document.getElementById("nm2"); focus_el.focus();'>
	    <br>
	    <input type="text" placeholder="<c:out value="${requestScope.name}"></c:out>"  id=nm2 
	    onblur='focus_el=document.getElementById("ph2"); focus_el.focus();'>
	    <input type="text" placeholder="<c:out value="${requestScope.phone}"></c:out>"  id=ph2 
	    onblur='focus_el=document.getElementById("rgsrt"); focus_el.focus();'>
	    <br>
	    <button class="signup-submit" type="submit" id=rgsrt
	    onmousedown="registration(this.parentNode.getElementsByTagName('INPUT')[0].value,this.parentNode.getElementsByTagName('INPUT')[1].value,this.parentNode.getElementsByTagName('INPUT')[2].value,this.parentNode.getElementsByTagName('INPUT')[3].value);">
	     <c:out value="${requestScope.registration}"></c:out></button>
       	<br>
       	<a id='test_login'></a>
       	<a id='test_parol'></a>
       	<br>
	    
	  <a class="h2" href="#" id="form-switch"
	  onmousedown="document.getElementById('login').style.display = 'block'; document.getElementById('registration').style.display = 'none'; setTimeout( function(){ focus_el = document.getElementById('lgn'); focus_el.focus();},100);"
	  ><c:out value="${requestScope.enter}"></c:out>!</a>
  </div>

</div>


<div id=panel style='top:1%;position:absolute;width:60%;left:5%;height:25%;background-color:rgba(255, 150, 100, 0.5);display:none;'> 
	<table id=save><tr><td>Имя</td><td><input type=text></td></tr>
		<tr><td>Фамилия</td><td><input type=text></td></tr>
		<tr><td>Адрес</td><td><input type=text></td></tr>
		<tr><td colspan=2><button onmousedown='save_info(); document.getElementById("save").style.display="none";'>сохранить</button></td></tr>
	</table>
</div>

<div  id=setting123></div>

<div id=one_page>
<div style='top:30%;position:absolute;width:90%;left:5%;height:30%;background-color:rgba(255, 150, 100, 0.5);display:none;'> 
<a class=usr style='display:none;'> Книги, которые я взял</a><a class=admin style='display:none;'> Запросы на возврат книги</a>
<table id=panel3>
</table>	
</div>

<div style='top:65%;position:absolute;width:90%;left:5%;height:30%;background-color:rgba(255, 150, 100, 0.5);display:none;'>
<a class=usr style='display:none;'> Выберите книгу!</a><a class=admin style='display:none;'> Запрос на книги</a>  
<table id=panel2>
</table>	
</div>

</div>

<script src="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js"></script>
			
<jsp:include page="js/sait_js.jsp" />				

<jsp:include page="js/library.jsp" />

<jsp:include page='js/search_js.jsp' />

<jsp:include page="js/mapping_js.jsp" />

<jsp:include page='js/cube.jsp' />
 
<jsp:include page='js/qrcode.jsp' />


<div id="placeHolder"></div>
<script>/*
if (get_cookie('user_bool')) 
{				//alert( (get_cookie('session_id') && get_cookie('session_id')!='') );
	if (get_cookie('session_id') && get_cookie('session_id')!='')
	{
var typeNumber = 4;
var errorCorrectionLevel = 'L';
var qr = qrcode(typeNumber, errorCorrectionLevel);
qr.addData( get_cookie('session_id') );
qr.make();
document.getElementById('placeHolder').innerHTML = qr.createImgTag();
	}
}*/
</script>





<body style="background:linear-gradient(-45deg, #dfbd9a, #aa7281, #102158);background-attachment:fixed;">
<div id="bok_tip" style="" class=bok_tip onmousedown="(function(){  so_bok();})(); so_bok_trapiy=true;"></div>

<div id="bok" style="" class="bok" onmousedown="(function(){ so_bok_down();})(); so_bok_trapiy=true; prev_id_show=true;">
<div style="background-color: rgba(0,205, 59,.95);display:none;" class="bok_menu" id="bok_menu_menu">
	<a style="position:relative;padding-left:20px;top:17px;"
onmousedown="console.log(menu_level+' '+prev_id); if(menu_level>0){document.getElementById(prev_id).style.display='none';document.getElementById('menu_phone').style.display='block';}
else {document.getElementById(prev_id).style.display='block';document.getElementById('menu_phone').style.display='none';}">
<table width=100%><tr><td width=90%>Меню</td><td width=10%><img src=images/katalog.png></td></tr></table></a></div>
<div style="background-color: rgba(255,155, 19,.95);display:none;" class="bok_menu" id="bok_menu_map">
	<a style="position:relative;padding-left:20px;top:17px;"
onmousedown="document.getElementById(prev_id).style.display='none';document.getElementById('map').style.display='block'; prev_id='map';">
<table width=100%><tr><td width=90%>Карта</td><td width=10%></td></tr></table></a></div>
<div style="background-color: rgba(201, 16, 209,.95);display:none;" class="bok_menu" id="bok_menu_filtr">
	<a style="position:relative;padding-left:20px;top:17px;"
onmousedown="document.getElementById(prev_id).style.display='none';document.getElementById('filtr').style.display='block'; prev_id='filtr';">
<table width=100%><tr><td width=90%>Фильтр</td><td width=10%></td></tr></table></a></div>

<div style="background-color: rgba(0,205, 59,.95);" class="bok_menu">
	<a style="position:relative;padding-left:20px;top:17px;"
onmousedown="document.getElementById(prev_id).style.display='none';document.getElementById('zakl').style.display='block'; prev_id='zakl';
alert('arr_zakl_geo'+arr_zakl_geo); mapping2(lng, lat,arr_zakl_geo, 'zakl_dist');">
<table width=100%><tr><td width=90%><c:out value="${requestScope.bookmarks}"></c:out></td><td width=10%><img src=images/zakladka1.png></td></tr></table></a></div>
<div style="background-color: rgba(0,195,195,.95);" class="bok_menu">
	<a style="position:relative;padding-left:20px;top:17px;"
onmousedown="document.getElementById(prev_id).style.display='none';document.getElementById('akc').style.display='block'; prev_id='akc';
alert('arr_akc_geo'+arr_akc_geo); mapping2(lng, lat,arr_akc_geo, 'akc_dist');">
<table width=100%><tr><td width=90%><c:out value="${requestScope.current}"></c:out><br><c:out value="${requestScope.offers}"></c:out></td><td width=10%><img src=images/star1.png></td></tr></table></a></div>
<div style="background-color: rgba(233,99,13,.95);" class="bok_menu">
	<a style="position:relative;padding-left:20px;top:17px;"
onmousedown="document.getElementById(prev_id).style.display='none';document.getElementById('korz').style.display='block'; prev_id='korz';
alert('arr_korz_geo'+arr_korz_geo); mapping2(lng, lat,arr_korz_geo, 'korz_dist');">
<table width=100%><tr><td width=90%><c:out value="${requestScope.basket}"></c:out></td><td width=10%><img src=images/basket1.png></td></tr></table></a></div>
<div style="background-color: rgba(255,235,0,.95);" class="bok_menu">
	<a style="position:relative;padding-left:20px;top:17px;"
onmousedown="document.getElementById(prev_id).style.display='none';qr_shower_bool=true;document.getElementById('qr_shower').style.display='block'; prev_id='qr_shower';">
<table width=100%><tr><td width=90%><c:out value="${requestScope.bind}"></c:out></td><td width=10%><img src=images/qr_small.png></td></tr></table></a></div>

<div class="menu_target" onmousedown="(function(){  so_bok();})(); so_bok_trapiy=true;">
</div>
</div>



				<div id=menu></div>
				<div id=menu_resp></div>



<div id=akc class='client_show'  onmousedown='prev_id_show = true;so_bok_trapiy=true;'>
<a onmousedown="this.parentNode.style.display='none';" style="position:relative;left:80%;color:black;"><img src=images/del1.png></a>
<div id=uadkaz></div>
<div id=approve></div>
<div id=akcii></div>
<button onmousedown="approve();">approve</button>
</div>

<div id=zakl class='client_show' onmousedown='prev_id_show = true;so_bok_trapiy=true;'>
<a onmousedown="this.parentNode.style.display='none';" style="position:relative;left:80%;color:black;"><img src=images/del1.png></a>
<div id=bookmarks></div>
</div>

<div id=korz class='client_show'  onmousedown='prev_id_show = true;so_bok_trapiy=true;'>
<a onmousedown="this.parentNode.style.display='none';" style="position:relative;left:80%;color:black;"><img src=images/del1.png></a>
<div id=basket></div>
</div>


	</body>
</html>
<fmt:setLocale value="en-EN"/>
<fmt:formatDate value="${now}" />

<fmt:setLocale value="ru-RU"/>
 <fmt:formatDate value="${now}" />

<c:if test="${not empty requestScope.errorMessage}">
	<c:out value="${requestScope.errorMessage}"/>
</c:if>
</body>
</html>